
/* null pointer dereference should kill process */
#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   uint *pointer = (uint*)0;
   *pointer = 15;
   printf(1,"%x %x\n", pointer, *pointer);
   exit();
}



void procdump(void) {
  static char *states[] = { [UNUSED]    "unused",
                            [EMBRYO]    "embryo",
                            [SLEEPING]  "sleep ",
                            [RUNNABLE]  "runble",
                            [RUNNING]   "run   ",
                            [ZOMBIE]    "zombie" };

  int i;
  struct proc *p;   
  char *state;      
  uint pc[10];      

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){ 
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])  
      state = states[p->state];  
    else
      state = "???";

    cprintf("\nPID: %d, Estado: %s, Nome: %s;", p->pid, state, p->name);
    if(p->state == SLEEPING){   
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)  
        cprintf(" %p", pc[i]);     
    }
    cprintf("\n");    
  
    ///////////////////////////////////////////
    ///////// ALTERAÇÕES REALIZADAS PARA TASK 1

    // pte_t: tipo da page table entry
    pte_t *pageDirEntryVir; // endereço virtual para o Page Directory de cada processo
    pte_t *pageTabEntryFis; // endereço físico para uma Page Table
    pte_t *pageTabEntryVir; // endereço virtual para uma Page Table
    pte_t *ppn; // Page Number Físico
    pte_t *vpn; // Page Number Virtual


    pageDirEntryVir = p->pgdir; // pageDirEntry recebe o endereço virtual do Page Directory do processo atual

    cprintf("----- MAIS INFO SOBRE O PROCESSO %d -----\n", p->pid); 
    cprintf("Page tables: \n");
    cprintf("    Endereco fisico da Page Directory do processo em questao = %p\n", V2P(pageDirEntryVir));

    // loop que percorre todos as Page Tables, isto é, que percorre todos os endereços apontados na Page Directory
    for (int indiceDiretorio = 0; indiceDiretorio < NPDENTRIES; indiceDiretorio++) {  // NPDENTRIES é determinada em mmu.h
      pageTabEntryFis = (pte_t*)PTE_ADDR(pageDirEntryVir[indiceDiretorio]);  
      // pega o endereço físico da Page Table apontada pora aquela entrada da Page Directory e armazena em pageTabEntryFis
      pageTabEntryVir = P2V(pageTabEntryFis);   
      // converte o endereço físico da Page Table em um endereço virtual
      ppn = (pte_t*)(PTE_ADDR(pageDirEntryVir[indiceDiretorio]) >> 12);
      // PPN da instância de Page Table apontada pela entrada atual da Page Directory (instância de índice [indiceDiretorio])

      if ((pageDirEntryVir[indiceDiretorio] & PTE_P) && (pageDirEntryVir[indiceDiretorio] & PTE_U) && isUsed(pageTabEntryVir)) {
      // verifica se as flags Present e User estão acionados e se aquela Page Table apontada possui em si posições sendo usadas
        cprintf("      pdir P %d, %p: \n", indiceDiretorio, ppn);
        cprintf("        End. fisico do inicio da Page Table apontada pelo diretorio %d = %p\n", indiceDiretorio, pageTabEntryFis); 

        // Impressões referentes a Page Table que é apontada pela entrada atual da Page Directory
        for (int indicePagina = 0; indicePagina < NPTENTRIES; indicePagina++) {   // percorre todas as páginas da Page Table!!
          if ((pageTabEntryVir[indicePagina] & PTE_P) && (pageTabEntryVir[indicePagina] & PTE_U)) { 
            cprintf("              ptbl PTE %d", indicePagina);  
            cprintf(", %p", (PTE_ADDR(pageTabEntryVir[indicePagina]) >> 12));
            cprintf(", %p\n", PTE_ADDR(pageTabEntryVir[indicePagina]));
          }
        }
      }
    }

    // inicio da impressão dos Page Mappings
    cprintf("Page mappings: \n");

    for (int indiceDiretorio = 0; indiceDiretorio < NPDENTRIES; indiceDiretorio++) {   // percorre todos as entradas da Page Directory
      pageTabEntryFis = (pte_t*)PTE_ADDR(pageDirEntryVir[indiceDiretorio]);   // coleta o endereço virtual armazenado naquela entrada 
      pageTabEntryVir = P2V(pageTabEntryFis);   // converte o endereço físico armazenado na pageTabEntryFis em virtual
      vpn = (pte_t*)(PTE_ADDR(pageTabEntryVir) >> 12); // armazena o virtual page number coletando os últimos 12 bits do endereço virtual
      ppn = (pte_t*)((int)pageTabEntryFis >> 12);     // armazena o phisical page number coletando os últimos 12 bits do endereço físico

      if ((pageDirEntryVir[indiceDiretorio] & PTE_P) && (pageDirEntryVir[indiceDiretorio] & PTE_U) && isUsed(pageTabEntryVir)) {
        cprintf("    [ memoria virtual: %x ] -> [ memoria fisica: %x ]\n", vpn, ppn);
      }
    }
  }
}
