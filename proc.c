#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "x86.h"
#include "proc.h"
#include "spinlock.h"

struct {
  struct spinlock lock;
  struct proc proc[NPROC];
} ptable;

static struct proc *initproc;

int nextpid = 1;
extern void forkret(void);
extern void trapret(void);

static void wakeup1(void *chan);

void
pinit(void)
{
  initlock(&ptable.lock, "ptable");
}

// Must be called with interrupts disabled
int
cpuid() {
  return mycpu()-cpus;
}

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu*
mycpu(void)
{
  int apicid, i;
  
  if(readeflags()&FL_IF)
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return &cpus[i];
  }
  panic("unknown apicid\n");
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
  c = mycpu();
  p = c->proc;
  popcli();
  return p;
}

//PAGEBREAK: 32
// Look in the process table for an UNUSED proc.
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
  p->tf->es = p->tf->ds;
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
  p->cwd = namei("/");

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);

  p->state = RUNNABLE;

  release(&ptable.lock);
}

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
  switchuvm(curproc);
  return 0;
}

// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));

  pid = np->pid;

  acquire(&ptable.lock);

  np->state = RUNNABLE;

  release(&ptable.lock);

  return pid;
}

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd]){
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
  iput(curproc->cwd);
  end_op();
  curproc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
      if(p->state == ZOMBIE)
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
  sched();
  panic("zombie exit");
}

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->parent != curproc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
        freevm(p->pgdir);
        p->pid = 0;
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}

//PAGEBREAK: 42
// Per-CPU process scheduler.
// Each CPU calls scheduler() after setting itself up.
// Scheduler never returns.  It loops, doing:
//  - choose a process to run
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
  struct proc *p;
  struct cpu *c = mycpu();
  c->proc = 0;
  
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->state != RUNNABLE)
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
      p->state = RUNNING;

      swtch(&(c->scheduler), p->context);
      switchkvm();

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
    }
    release(&ptable.lock);

  }
}

// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state. Saves and restores
// intena because intena is a property of this
// kernel thread, not this CPU. It should
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
  swtch(&p->context, mycpu()->scheduler);
  mycpu()->intena = intena;
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
  acquire(&ptable.lock);  //DOC: yieldlock
  myproc()->state = RUNNABLE;
  sched();
  release(&ptable.lock);
}

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");

  // Must acquire ptable.lock in order to
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  p->chan = chan;
  p->state = SLEEPING;

  sched();

  // Tidy up.
  p->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}

//PAGEBREAK!
// Wake up all processes sleeping on chan.
// The ptable lock must be held.
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == SLEEPING && p->chan == chan)
      p->state = RUNNABLE;
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
}

// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}


// Retorna se a página apontada por pageTabEntry possui alguma posição de memória sendo utilizada
uint temPosicaoUtilizada(pte_t *pageTabEntry) {
    int i;
    for (i = 0; i < NPTENTRIES; i++) {  // percorre todas as posições da Page Table
        if ((pageTabEntry[i] & PTE_P) && (pageTabEntry[i] & PTE_U)) {
              // verifica pra cada entrada da Page Table se as flags P (Present) e U (User) estão acionadas
              // se estiverem acionadas, quer dizer que aquela página está sendo usada (retorna 1)
            return 1;
        }
    }
    return 0;
}

//PAGEBREAK: 36
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
///// FUNÇÃO QUE VAMOS ALTERAR PARA MODIFICAR O CTRL + P
void procdump(void) {
  // Estados que o processo pode estar 
  static char *states[] = { [UNUSED]    "unused",
                            [EMBRYO]    "embryo",
                            [SLEEPING]  "sleep ",
                            [RUNNABLE]  "runble",
                            [RUNNING]   "run   ",
                            [ZOMBIE]    "zombie" };

  int i;
  struct proc *p;   // variável que vai ser salvo o endereço do processo
  char *state;      // recebe o estado do processo
  uint pc[10];      // vetor que guarda todos os endereços de retorno do stack frame do processo

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){ // NPROC = número máximo de processos que se pode ter
                                                      // percorre a tabela de processos 
    if(p->state == UNUSED)
      continue;     // passa para a próxima iteração; se não está sendo usado, não tem pq printar
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])   // NELEM: verifica o número de elementos de um vetor de tamanho fixo
                                                                        // verificando se é um estado válido para o processo
      state = states[p->state];     // coloca em "state" o valor string do estado atual daquele processo
    else
      state = "???";                // se ele não tem um estado (sempre tem), "state" recebe o valor string de "???"

    cprintf("\nPID: %d, Estado: %s, Nome: %s;", p->pid, state, p->name);    // cprintf: serve para imprimir texto no console do xv6 (ao invés do meu terminal)
                                                    // imprime sobre o processo: o PID, a string referente ao estado e o nome do processo
                                                    // foi inserido um /n antes da impressão para melhorar a legibilidade
    if(p->state == SLEEPING){   // se o processo tiver em estado de "SLEEPING",
      getcallerpcs((uint*)p->context->ebp+2, pc);   // retorna todos os endereços de retorno do stack frame do processo, armazenando em pc
      for(i=0; i<10 && pc[i] != 0; i++)   // a última posição é preenchida com 0, então se tiver um 0 ele para de imprimir
        cprintf(" %p", pc[i]);      // imprime cada endereço de retorno (Qual a utilidade disso???)
    }
    cprintf("\n");    // pula linha para que o mesmo procedimento possa ser feito para o próximo processo 


  
    ///////////////////////////////////////////
    ///////// ALTERAÇÕES REALIZADAS PARA TASK 1

    // pte_t: tipo da page table entry
    pte_t *pageDirEntryVir; // endereço virtual para o Page Directory de cada processo
    pte_t *pageTabEntryFis; // endereço físico para uma Page Table
    pte_t *pageTabEntryVir; // endereço virtual para uma Page Table
    pte_t *ppn; // Page Number Físico
    pte_t *vpn; // Page Number Virtual


    pageDirEntryVir = p->pgdir; // pageDirEntry recebe o endereço virtual do Page Directory do processo atual
                                // cada processo tem sua Page Directory

    cprintf("----- MAIS INFO SOBRE O PROCESSO %d-----\n", p->pid); // imprime no xv6
    cprintf("Page tables: \n");
    //cprintf("    Memory location of page directory = %p\n", V2P(pageDirEntryVir));
    cprintf("    Endereco fisico da Page Directory do processo em questao = %p\n", V2P(pageDirEntryVir));
            // V2P converte o endereço virtual da Page Directory deste processo armazenado em pageDirEntry em um endereço físico
            // esse endereço físico e referente ao local físico que está sendo armazenado a Page Directory do processo atual
            // dentro dessa Page Directory, haverão várias entradas; cada entrada contém um endereço virtual que aponta para uma 
            // outra tabela, que é uma de Page Table. Dessa forma, a Page Directory aponta para várias Page Tables.
                // O que precisamos fazer é verificar quais páginas dessas Page Tables estão sendo usadas. 

    for (int indiceDiretorio = 0; indiceDiretorio < NPDENTRIES; indiceDiretorio++) {  // NPDENTRIES é determinada em mmu.h
                                                                                      // Page Directory é um vetor de tamanho NPDENTRIES
      // esse loop corre todas as posições da Page Directory, onde o índice da posição estará na variável indiceDiretorio
      // assim, é possível verificar para cada entrada da Page Directory qual é o endereço físico da Page Table correspondente
      // sabendo qual o endereço físico da Page Table correspondente é possível varrer essa Page Table atrás de páginas sendo usadas


      pageTabEntryFis = (pte_t*)PTE_ADDR(pageDirEntryVir[indiceDiretorio]);  // pega o endereço físico da Page Table apontada pora aquela
                                                                          // entrada da Page Directory e armazena em pageTabEntryFis
      pageTabEntryVir = P2V(pageTabEntryFis);   // converte o endereço físico da Page Table em um endereço virtual
      ppn = (pte_t*)(PTE_ADDR(pageDirEntryVir[indiceDiretorio]) >> 12);   // PPN da instância de Page Table apontada pela entrada atual 
                                                                          // da Page Directory (instância de índice [indiceDiretorio])

      if ((pageDirEntryVir[indiceDiretorio] & PTE_P) && (pageDirEntryVir[indiceDiretorio] & PTE_U) && temPosicaoUtilizada(pageTabEntryVir)) {
          // condicional verifica:
              // se os flags P (Present) e U (User) estão acionados
              // se para aquele índice, isto é, para aquela Page Table, se ela possui posições sendo utilizadas
        cprintf("      pdir P %d, %p: \n", indiceDiretorio, ppn);   // imprime o índice do diretório e qual a sua PPN
        //cprintf("          Memory location of page table = %p\n", pageTabEntryFis); // imprime o endereço físico da Page Table em questão
        cprintf("        End. fisico do inicio da Page Table apontada pelo diretorio %d = %p\n", indiceDiretorio, pageTabEntryFis); 

        // Impressões referentes a Page Table que é apontada pela entrada atual da Page Directory
        for (int indicePagina = 0; indicePagina < NPTENTRIES; indicePagina++) {   // percorre todas as páginas da Page Table!!
          if ((pageTabEntryVir[indicePagina] & PTE_P) && (pageTabEntryVir[indicePagina] & PTE_U)) {   // confere se a dita página está sendo usada
            cprintf("              ptbl PTE %d", indicePagina);     // começa a impressão: primeiro imprime o índice da página em questão
            cprintf(", %p", (PTE_ADDR(pageTabEntryVir[indicePagina]) >> 12));   // shift right de 12; assim os últimos 12 bits são "eliminados" (eram os flags)
                                                                                // e só resta a informação que queremos imprimir: o PPN
            cprintf(", %p\n", PTE_ADDR(pageTabEntryVir[indicePagina]));         // imprime o endereço virtual inteiro
          }
        }
      }

    }

    // inicio da impressão dos Page Mappings
    cprintf("Page mappings: \n");

    for (int indiceDiretorio = 0; indiceDiretorio < NPDENTRIES; indiceDiretorio++) {   // loop para percorrer todos as entradas da Page Directory
      pageTabEntryFis = (pte_t*)PTE_ADDR(pageDirEntryVir[indiceDiretorio]);   // coleta o endereço virtual armazenado naquela entrada do Page Directory
      pageTabEntryVir = P2V(pageTabEntryFis);   // converete o endereço físico armazenado na pageTabEntryFis em virtual
      vpn = (pte_t*)(PTE_ADDR(pageTabEntryVir) >> 12);   // armazena o virtual page number coletando os últimos 12 bits do endereço virtual
      ppn = (pte_t*)((int)pageTabEntryFis >> 12);                    // armazena o phisical page number coletando os últimos 12 bits do endereço físico

      if ((pageDirEntryVir[indiceDiretorio] & PTE_P) && (pageDirEntryVir[indiceDiretorio] & PTE_U) && temPosicaoUtilizada(pageTabEntryVir)) {
        cprintf("    [ memoria virtual: %x ] -> [ memoria fisica: %x ]\n", vpn, ppn);
      }
    }
  }
}
