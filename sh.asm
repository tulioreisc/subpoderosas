
_sh: formato do arquivo elf32-i386


Desmontagem da seção .text:

00001000 <main>:
  return 0;
}

int
main(void)
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	51                   	push   %ecx
    100e:	83 ec 04             	sub    $0x4,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    1011:	eb 0e                	jmp    1021 <main+0x21>
    1013:	90                   	nop
    1014:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
    1018:	83 f8 02             	cmp    $0x2,%eax
    101b:	0f 8f c3 00 00 00    	jg     10e4 <main+0xe4>
{
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    1021:	83 ec 08             	sub    $0x8,%esp
    1024:	6a 02                	push   $0x2
    1026:	68 31 22 00 00       	push   $0x2231
    102b:	e8 32 0d 00 00       	call   1d62 <open>
    1030:	83 c4 10             	add    $0x10,%esp
    1033:	85 c0                	test   %eax,%eax
    1035:	79 e1                	jns    1018 <main+0x18>
    1037:	eb 2e                	jmp    1067 <main+0x67>
    1039:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
    1040:	80 3d 42 38 00 00 20 	cmpb   $0x20,0x3842
    1047:	74 5d                	je     10a6 <main+0xa6>
    1049:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
    1050:	e8 c5 0c 00 00       	call   1d1a <fork>
  if(pid == -1)
    1055:	83 f8 ff             	cmp    $0xffffffff,%eax
    1058:	74 3f                	je     1099 <main+0x99>
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
    105a:	85 c0                	test   %eax,%eax
    105c:	0f 84 98 00 00 00    	je     10fa <main+0xfa>
      runcmd(parsecmd(buf));
    wait();
    1062:	e8 c3 0c 00 00       	call   1d2a <wait>
      break;
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    1067:	83 ec 08             	sub    $0x8,%esp
    106a:	6a 64                	push   $0x64
    106c:	68 40 38 00 00       	push   $0x3840
    1071:	e8 9a 00 00 00       	call   1110 <getcmd>
    1076:	83 c4 10             	add    $0x10,%esp
    1079:	85 c0                	test   %eax,%eax
    107b:	78 78                	js     10f5 <main+0xf5>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
    107d:	80 3d 40 38 00 00 63 	cmpb   $0x63,0x3840
    1084:	75 ca                	jne    1050 <main+0x50>
    1086:	80 3d 41 38 00 00 64 	cmpb   $0x64,0x3841
    108d:	74 b1                	je     1040 <main+0x40>
int
fork1(void)
{
  int pid;

  pid = fork();
    108f:	e8 86 0c 00 00       	call   1d1a <fork>
  if(pid == -1)
    1094:	83 f8 ff             	cmp    $0xffffffff,%eax
    1097:	75 c1                	jne    105a <main+0x5a>
    panic("fork");
    1099:	83 ec 0c             	sub    $0xc,%esp
    109c:	68 ba 21 00 00       	push   $0x21ba
    10a1:	e8 ba 00 00 00       	call   1160 <panic>

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
    10a6:	83 ec 0c             	sub    $0xc,%esp
    10a9:	68 40 38 00 00       	push   $0x3840
    10ae:	e8 ad 0a 00 00       	call   1b60 <strlen>
      if(chdir(buf+3) < 0)
    10b3:	c7 04 24 43 38 00 00 	movl   $0x3843,(%esp)

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
    10ba:	c6 80 3f 38 00 00 00 	movb   $0x0,0x383f(%eax)
      if(chdir(buf+3) < 0)
    10c1:	e8 cc 0c 00 00       	call   1d92 <chdir>
    10c6:	83 c4 10             	add    $0x10,%esp
    10c9:	85 c0                	test   %eax,%eax
    10cb:	79 9a                	jns    1067 <main+0x67>
        printf(2, "cannot cd %s\n", buf+3);
    10cd:	50                   	push   %eax
    10ce:	68 43 38 00 00       	push   $0x3843
    10d3:	68 39 22 00 00       	push   $0x2239
    10d8:	6a 02                	push   $0x2
    10da:	e8 91 0d 00 00       	call   1e70 <printf>
    10df:	83 c4 10             	add    $0x10,%esp
    10e2:	eb 83                	jmp    1067 <main+0x67>
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
    10e4:	83 ec 0c             	sub    $0xc,%esp
    10e7:	50                   	push   %eax
    10e8:	e8 5d 0c 00 00       	call   1d4a <close>
      break;
    10ed:	83 c4 10             	add    $0x10,%esp
    10f0:	e9 72 ff ff ff       	jmp    1067 <main+0x67>
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
  }
  exit();
    10f5:	e8 28 0c 00 00       	call   1d22 <exit>
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    10fa:	83 ec 0c             	sub    $0xc,%esp
    10fd:	68 40 38 00 00       	push   $0x3840
    1102:	e8 69 09 00 00       	call   1a70 <parsecmd>
    1107:	89 04 24             	mov    %eax,(%esp)
    110a:	e8 71 00 00 00       	call   1180 <runcmd>
    110f:	90                   	nop

00001110 <getcmd>:
  exit();
}

int
getcmd(char *buf, int nbuf)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	56                   	push   %esi
    1114:	53                   	push   %ebx
    1115:	8b 75 0c             	mov    0xc(%ebp),%esi
    1118:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
    111b:	83 ec 08             	sub    $0x8,%esp
    111e:	68 90 21 00 00       	push   $0x2190
    1123:	6a 02                	push   $0x2
    1125:	e8 46 0d 00 00       	call   1e70 <printf>
  memset(buf, 0, nbuf);
    112a:	83 c4 0c             	add    $0xc,%esp
    112d:	56                   	push   %esi
    112e:	6a 00                	push   $0x0
    1130:	53                   	push   %ebx
    1131:	e8 5a 0a 00 00       	call   1b90 <memset>
  gets(buf, nbuf);
    1136:	58                   	pop    %eax
    1137:	5a                   	pop    %edx
    1138:	56                   	push   %esi
    1139:	53                   	push   %ebx
    113a:	e8 b1 0a 00 00       	call   1bf0 <gets>
    113f:	83 c4 10             	add    $0x10,%esp
    1142:	31 c0                	xor    %eax,%eax
    1144:	80 3b 00             	cmpb   $0x0,(%ebx)
    1147:	0f 94 c0             	sete   %al
  if(buf[0] == 0) // EOF
    return -1;
  return 0;
}
    114a:	8d 65 f8             	lea    -0x8(%ebp),%esp
    114d:	f7 d8                	neg    %eax
    114f:	5b                   	pop    %ebx
    1150:	5e                   	pop    %esi
    1151:	5d                   	pop    %ebp
    1152:	c3                   	ret    
    1153:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001160 <panic>:
  exit();
}

void
panic(char *s)
{
    1160:	55                   	push   %ebp
    1161:	89 e5                	mov    %esp,%ebp
    1163:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
    1166:	ff 75 08             	pushl  0x8(%ebp)
    1169:	68 2d 22 00 00       	push   $0x222d
    116e:	6a 02                	push   $0x2
    1170:	e8 fb 0c 00 00       	call   1e70 <printf>
  exit();
    1175:	e8 a8 0b 00 00       	call   1d22 <exit>
    117a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001180 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	53                   	push   %ebx
    1184:	83 ec 14             	sub    $0x14,%esp
    1187:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    118a:	85 db                	test   %ebx,%ebx
    118c:	74 76                	je     1204 <runcmd+0x84>
    exit();

  switch(cmd->type){
    118e:	83 3b 05             	cmpl   $0x5,(%ebx)
    1191:	0f 87 f8 00 00 00    	ja     128f <runcmd+0x10f>
    1197:	8b 03                	mov    (%ebx),%eax
    1199:	ff 24 85 48 22 00 00 	jmp    *0x2248(,%eax,4)
    runcmd(lcmd->right);
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
    11a0:	8d 45 f0             	lea    -0x10(%ebp),%eax
    11a3:	83 ec 0c             	sub    $0xc,%esp
    11a6:	50                   	push   %eax
    11a7:	e8 86 0b 00 00       	call   1d32 <pipe>
    11ac:	83 c4 10             	add    $0x10,%esp
    11af:	85 c0                	test   %eax,%eax
    11b1:	0f 88 07 01 00 00    	js     12be <runcmd+0x13e>
int
fork1(void)
{
  int pid;

  pid = fork();
    11b7:	e8 5e 0b 00 00       	call   1d1a <fork>
  if(pid == -1)
    11bc:	83 f8 ff             	cmp    $0xffffffff,%eax
    11bf:	0f 84 d7 00 00 00    	je     129c <runcmd+0x11c>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
    11c5:	85 c0                	test   %eax,%eax
    11c7:	0f 84 fe 00 00 00    	je     12cb <runcmd+0x14b>
int
fork1(void)
{
  int pid;

  pid = fork();
    11cd:	e8 48 0b 00 00       	call   1d1a <fork>
  if(pid == -1)
    11d2:	83 f8 ff             	cmp    $0xffffffff,%eax
    11d5:	0f 84 c1 00 00 00    	je     129c <runcmd+0x11c>
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
    11db:	85 c0                	test   %eax,%eax
    11dd:	0f 84 16 01 00 00    	je     12f9 <runcmd+0x179>
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
    11e3:	83 ec 0c             	sub    $0xc,%esp
    11e6:	ff 75 f0             	pushl  -0x10(%ebp)
    11e9:	e8 5c 0b 00 00       	call   1d4a <close>
    close(p[1]);
    11ee:	58                   	pop    %eax
    11ef:	ff 75 f4             	pushl  -0xc(%ebp)
    11f2:	e8 53 0b 00 00       	call   1d4a <close>
    wait();
    11f7:	e8 2e 0b 00 00       	call   1d2a <wait>
    wait();
    11fc:	e8 29 0b 00 00       	call   1d2a <wait>
    break;
    1201:	83 c4 10             	add    $0x10,%esp
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    exit();
    1204:	e8 19 0b 00 00       	call   1d22 <exit>
int
fork1(void)
{
  int pid;

  pid = fork();
    1209:	e8 0c 0b 00 00       	call   1d1a <fork>
  if(pid == -1)
    120e:	83 f8 ff             	cmp    $0xffffffff,%eax
    1211:	0f 84 85 00 00 00    	je     129c <runcmd+0x11c>
    wait();
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
    1217:	85 c0                	test   %eax,%eax
    1219:	75 e9                	jne    1204 <runcmd+0x84>
    121b:	eb 49                	jmp    1266 <runcmd+0xe6>
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
    121d:	8b 43 04             	mov    0x4(%ebx),%eax
    1220:	85 c0                	test   %eax,%eax
    1222:	74 e0                	je     1204 <runcmd+0x84>
      exit();
    exec(ecmd->argv[0], ecmd->argv);
    1224:	52                   	push   %edx
    1225:	52                   	push   %edx
    1226:	8d 53 04             	lea    0x4(%ebx),%edx
    1229:	52                   	push   %edx
    122a:	50                   	push   %eax
    122b:	e8 2a 0b 00 00       	call   1d5a <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    1230:	83 c4 0c             	add    $0xc,%esp
    1233:	ff 73 04             	pushl  0x4(%ebx)
    1236:	68 9a 21 00 00       	push   $0x219a
    123b:	6a 02                	push   $0x2
    123d:	e8 2e 0c 00 00       	call   1e70 <printf>
    break;
    1242:	83 c4 10             	add    $0x10,%esp
    1245:	eb bd                	jmp    1204 <runcmd+0x84>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    1247:	83 ec 0c             	sub    $0xc,%esp
    124a:	ff 73 14             	pushl  0x14(%ebx)
    124d:	e8 f8 0a 00 00       	call   1d4a <close>
    if(open(rcmd->file, rcmd->mode) < 0){
    1252:	59                   	pop    %ecx
    1253:	58                   	pop    %eax
    1254:	ff 73 10             	pushl  0x10(%ebx)
    1257:	ff 73 08             	pushl  0x8(%ebx)
    125a:	e8 03 0b 00 00       	call   1d62 <open>
    125f:	83 c4 10             	add    $0x10,%esp
    1262:	85 c0                	test   %eax,%eax
    1264:	78 43                	js     12a9 <runcmd+0x129>
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
    1266:	83 ec 0c             	sub    $0xc,%esp
    1269:	ff 73 04             	pushl  0x4(%ebx)
    126c:	e8 0f ff ff ff       	call   1180 <runcmd>
int
fork1(void)
{
  int pid;

  pid = fork();
    1271:	e8 a4 0a 00 00       	call   1d1a <fork>
  if(pid == -1)
    1276:	83 f8 ff             	cmp    $0xffffffff,%eax
    1279:	74 21                	je     129c <runcmd+0x11c>
    runcmd(rcmd->cmd);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
    127b:	85 c0                	test   %eax,%eax
    127d:	74 e7                	je     1266 <runcmd+0xe6>
      runcmd(lcmd->left);
    wait();
    127f:	e8 a6 0a 00 00       	call   1d2a <wait>
    runcmd(lcmd->right);
    1284:	83 ec 0c             	sub    $0xc,%esp
    1287:	ff 73 08             	pushl  0x8(%ebx)
    128a:	e8 f1 fe ff ff       	call   1180 <runcmd>
  if(cmd == 0)
    exit();

  switch(cmd->type){
  default:
    panic("runcmd");
    128f:	83 ec 0c             	sub    $0xc,%esp
    1292:	68 93 21 00 00       	push   $0x2193
    1297:	e8 c4 fe ff ff       	call   1160 <panic>
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
    129c:	83 ec 0c             	sub    $0xc,%esp
    129f:	68 ba 21 00 00       	push   $0x21ba
    12a4:	e8 b7 fe ff ff       	call   1160 <panic>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
    12a9:	52                   	push   %edx
    12aa:	ff 73 08             	pushl  0x8(%ebx)
    12ad:	68 aa 21 00 00       	push   $0x21aa
    12b2:	6a 02                	push   $0x2
    12b4:	e8 b7 0b 00 00       	call   1e70 <printf>
      exit();
    12b9:	e8 64 0a 00 00       	call   1d22 <exit>
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    12be:	83 ec 0c             	sub    $0xc,%esp
    12c1:	68 bf 21 00 00       	push   $0x21bf
    12c6:	e8 95 fe ff ff       	call   1160 <panic>
    if(fork1() == 0){
      close(1);
    12cb:	83 ec 0c             	sub    $0xc,%esp
    12ce:	6a 01                	push   $0x1
    12d0:	e8 75 0a 00 00       	call   1d4a <close>
      dup(p[1]);
    12d5:	58                   	pop    %eax
    12d6:	ff 75 f4             	pushl  -0xc(%ebp)
    12d9:	e8 bc 0a 00 00       	call   1d9a <dup>
      close(p[0]);
    12de:	58                   	pop    %eax
    12df:	ff 75 f0             	pushl  -0x10(%ebp)
    12e2:	e8 63 0a 00 00       	call   1d4a <close>
      close(p[1]);
    12e7:	58                   	pop    %eax
    12e8:	ff 75 f4             	pushl  -0xc(%ebp)
    12eb:	e8 5a 0a 00 00       	call   1d4a <close>
      runcmd(pcmd->left);
    12f0:	58                   	pop    %eax
    12f1:	ff 73 04             	pushl  0x4(%ebx)
    12f4:	e8 87 fe ff ff       	call   1180 <runcmd>
    }
    if(fork1() == 0){
      close(0);
    12f9:	83 ec 0c             	sub    $0xc,%esp
    12fc:	6a 00                	push   $0x0
    12fe:	e8 47 0a 00 00       	call   1d4a <close>
      dup(p[0]);
    1303:	5a                   	pop    %edx
    1304:	ff 75 f0             	pushl  -0x10(%ebp)
    1307:	e8 8e 0a 00 00       	call   1d9a <dup>
      close(p[0]);
    130c:	59                   	pop    %ecx
    130d:	ff 75 f0             	pushl  -0x10(%ebp)
    1310:	e8 35 0a 00 00       	call   1d4a <close>
      close(p[1]);
    1315:	58                   	pop    %eax
    1316:	ff 75 f4             	pushl  -0xc(%ebp)
    1319:	e8 2c 0a 00 00       	call   1d4a <close>
      runcmd(pcmd->right);
    131e:	58                   	pop    %eax
    131f:	ff 73 08             	pushl  0x8(%ebx)
    1322:	e8 59 fe ff ff       	call   1180 <runcmd>
    1327:	89 f6                	mov    %esi,%esi
    1329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001330 <fork1>:
  exit();
}

int
fork1(void)
{
    1330:	55                   	push   %ebp
    1331:	89 e5                	mov    %esp,%ebp
    1333:	83 ec 08             	sub    $0x8,%esp
  int pid;

  pid = fork();
    1336:	e8 df 09 00 00       	call   1d1a <fork>
  if(pid == -1)
    133b:	83 f8 ff             	cmp    $0xffffffff,%eax
    133e:	74 02                	je     1342 <fork1+0x12>
    panic("fork");
  return pid;
}
    1340:	c9                   	leave  
    1341:	c3                   	ret    
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
    1342:	83 ec 0c             	sub    $0xc,%esp
    1345:	68 ba 21 00 00       	push   $0x21ba
    134a:	e8 11 fe ff ff       	call   1160 <panic>
    134f:	90                   	nop

00001350 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
    1350:	55                   	push   %ebp
    1351:	89 e5                	mov    %esp,%ebp
    1353:	53                   	push   %ebx
    1354:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1357:	6a 54                	push   $0x54
    1359:	e8 42 0d 00 00       	call   20a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    135e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1361:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    1363:	6a 54                	push   $0x54
    1365:	6a 00                	push   $0x0
    1367:	50                   	push   %eax
    1368:	e8 23 08 00 00       	call   1b90 <memset>
  cmd->type = EXEC;
    136d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
    1373:	89 d8                	mov    %ebx,%eax
    1375:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1378:	c9                   	leave  
    1379:	c3                   	ret    
    137a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001380 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
    1380:	55                   	push   %ebp
    1381:	89 e5                	mov    %esp,%ebp
    1383:	53                   	push   %ebx
    1384:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1387:	6a 18                	push   $0x18
    1389:	e8 12 0d 00 00       	call   20a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    138e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1391:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    1393:	6a 18                	push   $0x18
    1395:	6a 00                	push   $0x0
    1397:	50                   	push   %eax
    1398:	e8 f3 07 00 00       	call   1b90 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
    139d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
    13a0:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
    13a6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
    13a9:	8b 45 0c             	mov    0xc(%ebp),%eax
    13ac:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
    13af:	8b 45 10             	mov    0x10(%ebp),%eax
    13b2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
    13b5:	8b 45 14             	mov    0x14(%ebp),%eax
    13b8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
    13bb:	8b 45 18             	mov    0x18(%ebp),%eax
    13be:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
    13c1:	89 d8                	mov    %ebx,%eax
    13c3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13c6:	c9                   	leave  
    13c7:	c3                   	ret    
    13c8:	90                   	nop
    13c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000013d0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
    13d0:	55                   	push   %ebp
    13d1:	89 e5                	mov    %esp,%ebp
    13d3:	53                   	push   %ebx
    13d4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
    13d7:	6a 0c                	push   $0xc
    13d9:	e8 c2 0c 00 00       	call   20a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    13de:	83 c4 0c             	add    $0xc,%esp
struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
    13e1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    13e3:	6a 0c                	push   $0xc
    13e5:	6a 00                	push   $0x0
    13e7:	50                   	push   %eax
    13e8:	e8 a3 07 00 00       	call   1b90 <memset>
  cmd->type = PIPE;
  cmd->left = left;
    13ed:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
    13f0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
    13f6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
    13f9:	8b 45 0c             	mov    0xc(%ebp),%eax
    13fc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
    13ff:	89 d8                	mov    %ebx,%eax
    1401:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1404:	c9                   	leave  
    1405:	c3                   	ret    
    1406:	8d 76 00             	lea    0x0(%esi),%esi
    1409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001410 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
    1410:	55                   	push   %ebp
    1411:	89 e5                	mov    %esp,%ebp
    1413:	53                   	push   %ebx
    1414:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1417:	6a 0c                	push   $0xc
    1419:	e8 82 0c 00 00       	call   20a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    141e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1421:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    1423:	6a 0c                	push   $0xc
    1425:	6a 00                	push   $0x0
    1427:	50                   	push   %eax
    1428:	e8 63 07 00 00       	call   1b90 <memset>
  cmd->type = LIST;
  cmd->left = left;
    142d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
    1430:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
    1436:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
    1439:	8b 45 0c             	mov    0xc(%ebp),%eax
    143c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
    143f:	89 d8                	mov    %ebx,%eax
    1441:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1444:	c9                   	leave  
    1445:	c3                   	ret    
    1446:	8d 76 00             	lea    0x0(%esi),%esi
    1449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001450 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
    1450:	55                   	push   %ebp
    1451:	89 e5                	mov    %esp,%ebp
    1453:	53                   	push   %ebx
    1454:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1457:	6a 08                	push   $0x8
    1459:	e8 42 0c 00 00       	call   20a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    145e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1461:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    1463:	6a 08                	push   $0x8
    1465:	6a 00                	push   $0x0
    1467:	50                   	push   %eax
    1468:	e8 23 07 00 00       	call   1b90 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
    146d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
    1470:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
    1476:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
    1479:	89 d8                	mov    %ebx,%eax
    147b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    147e:	c9                   	leave  
    147f:	c3                   	ret    

00001480 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
    1480:	55                   	push   %ebp
    1481:	89 e5                	mov    %esp,%ebp
    1483:	57                   	push   %edi
    1484:	56                   	push   %esi
    1485:	53                   	push   %ebx
    1486:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
    1489:	8b 45 08             	mov    0x8(%ebp),%eax
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
    148c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    148f:	8b 75 10             	mov    0x10(%ebp),%esi
  char *s;
  int ret;

  s = *ps;
    1492:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
    1494:	39 df                	cmp    %ebx,%edi
    1496:	72 13                	jb     14ab <gettoken+0x2b>
    1498:	eb 29                	jmp    14c3 <gettoken+0x43>
    149a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
    14a0:	83 c7 01             	add    $0x1,%edi
{
  char *s;
  int ret;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
    14a3:	39 fb                	cmp    %edi,%ebx
    14a5:	0f 84 ed 00 00 00    	je     1598 <gettoken+0x118>
    14ab:	0f be 07             	movsbl (%edi),%eax
    14ae:	83 ec 08             	sub    $0x8,%esp
    14b1:	50                   	push   %eax
    14b2:	68 38 38 00 00       	push   $0x3838
    14b7:	e8 f4 06 00 00       	call   1bb0 <strchr>
    14bc:	83 c4 10             	add    $0x10,%esp
    14bf:	85 c0                	test   %eax,%eax
    14c1:	75 dd                	jne    14a0 <gettoken+0x20>
    s++;
  if(q)
    14c3:	85 f6                	test   %esi,%esi
    14c5:	74 02                	je     14c9 <gettoken+0x49>
    *q = s;
    14c7:	89 3e                	mov    %edi,(%esi)
  ret = *s;
    14c9:	0f be 37             	movsbl (%edi),%esi
    14cc:	89 f1                	mov    %esi,%ecx
    14ce:	89 f0                	mov    %esi,%eax
  switch(*s){
    14d0:	80 f9 29             	cmp    $0x29,%cl
    14d3:	7f 5b                	jg     1530 <gettoken+0xb0>
    14d5:	80 f9 28             	cmp    $0x28,%cl
    14d8:	7d 61                	jge    153b <gettoken+0xbb>
    14da:	84 c9                	test   %cl,%cl
    14dc:	0f 85 de 00 00 00    	jne    15c0 <gettoken+0x140>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
    14e2:	8b 55 14             	mov    0x14(%ebp),%edx
    14e5:	85 d2                	test   %edx,%edx
    14e7:	74 05                	je     14ee <gettoken+0x6e>
    *eq = s;
    14e9:	8b 45 14             	mov    0x14(%ebp),%eax
    14ec:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
    14ee:	39 fb                	cmp    %edi,%ebx
    14f0:	77 0d                	ja     14ff <gettoken+0x7f>
    14f2:	eb 23                	jmp    1517 <gettoken+0x97>
    14f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s++;
    14f8:	83 c7 01             	add    $0x1,%edi
    break;
  }
  if(eq)
    *eq = s;

  while(s < es && strchr(whitespace, *s))
    14fb:	39 fb                	cmp    %edi,%ebx
    14fd:	74 18                	je     1517 <gettoken+0x97>
    14ff:	0f be 07             	movsbl (%edi),%eax
    1502:	83 ec 08             	sub    $0x8,%esp
    1505:	50                   	push   %eax
    1506:	68 38 38 00 00       	push   $0x3838
    150b:	e8 a0 06 00 00       	call   1bb0 <strchr>
    1510:	83 c4 10             	add    $0x10,%esp
    1513:	85 c0                	test   %eax,%eax
    1515:	75 e1                	jne    14f8 <gettoken+0x78>
    s++;
  *ps = s;
    1517:	8b 45 08             	mov    0x8(%ebp),%eax
    151a:	89 38                	mov    %edi,(%eax)
  return ret;
}
    151c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    151f:	89 f0                	mov    %esi,%eax
    1521:	5b                   	pop    %ebx
    1522:	5e                   	pop    %esi
    1523:	5f                   	pop    %edi
    1524:	5d                   	pop    %ebp
    1525:	c3                   	ret    
    1526:	8d 76 00             	lea    0x0(%esi),%esi
    1529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
    1530:	80 f9 3e             	cmp    $0x3e,%cl
    1533:	75 0b                	jne    1540 <gettoken+0xc0>
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
    1535:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
    1539:	74 75                	je     15b0 <gettoken+0x130>
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
    153b:	83 c7 01             	add    $0x1,%edi
    153e:	eb a2                	jmp    14e2 <gettoken+0x62>
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
    1540:	7f 5e                	jg     15a0 <gettoken+0x120>
    1542:	83 e9 3b             	sub    $0x3b,%ecx
    1545:	80 f9 01             	cmp    $0x1,%cl
    1548:	76 f1                	jbe    153b <gettoken+0xbb>
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    154a:	39 fb                	cmp    %edi,%ebx
    154c:	77 24                	ja     1572 <gettoken+0xf2>
    154e:	eb 7c                	jmp    15cc <gettoken+0x14c>
    1550:	0f be 07             	movsbl (%edi),%eax
    1553:	83 ec 08             	sub    $0x8,%esp
    1556:	50                   	push   %eax
    1557:	68 30 38 00 00       	push   $0x3830
    155c:	e8 4f 06 00 00       	call   1bb0 <strchr>
    1561:	83 c4 10             	add    $0x10,%esp
    1564:	85 c0                	test   %eax,%eax
    1566:	75 1f                	jne    1587 <gettoken+0x107>
      s++;
    1568:	83 c7 01             	add    $0x1,%edi
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    156b:	39 fb                	cmp    %edi,%ebx
    156d:	74 5b                	je     15ca <gettoken+0x14a>
    156f:	0f be 07             	movsbl (%edi),%eax
    1572:	83 ec 08             	sub    $0x8,%esp
    1575:	50                   	push   %eax
    1576:	68 38 38 00 00       	push   $0x3838
    157b:	e8 30 06 00 00       	call   1bb0 <strchr>
    1580:	83 c4 10             	add    $0x10,%esp
    1583:	85 c0                	test   %eax,%eax
    1585:	74 c9                	je     1550 <gettoken+0xd0>
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
    1587:	be 61 00 00 00       	mov    $0x61,%esi
    158c:	e9 51 ff ff ff       	jmp    14e2 <gettoken+0x62>
    1591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1598:	89 df                	mov    %ebx,%edi
    159a:	e9 24 ff ff ff       	jmp    14c3 <gettoken+0x43>
    159f:	90                   	nop
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
    15a0:	80 f9 7c             	cmp    $0x7c,%cl
    15a3:	74 96                	je     153b <gettoken+0xbb>
    15a5:	eb a3                	jmp    154a <gettoken+0xca>
    15a7:	89 f6                	mov    %esi,%esi
    15a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    15b0:	83 c7 02             	add    $0x2,%edi
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
    15b3:	be 2b 00 00 00       	mov    $0x2b,%esi
    15b8:	e9 25 ff ff ff       	jmp    14e2 <gettoken+0x62>
    15bd:	8d 76 00             	lea    0x0(%esi),%esi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
    15c0:	80 f9 26             	cmp    $0x26,%cl
    15c3:	75 85                	jne    154a <gettoken+0xca>
    15c5:	e9 71 ff ff ff       	jmp    153b <gettoken+0xbb>
    15ca:	89 df                	mov    %ebx,%edi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
    15cc:	8b 45 14             	mov    0x14(%ebp),%eax
    15cf:	be 61 00 00 00       	mov    $0x61,%esi
    15d4:	85 c0                	test   %eax,%eax
    15d6:	0f 85 0d ff ff ff    	jne    14e9 <gettoken+0x69>
    15dc:	e9 36 ff ff ff       	jmp    1517 <gettoken+0x97>
    15e1:	eb 0d                	jmp    15f0 <peek>
    15e3:	90                   	nop
    15e4:	90                   	nop
    15e5:	90                   	nop
    15e6:	90                   	nop
    15e7:	90                   	nop
    15e8:	90                   	nop
    15e9:	90                   	nop
    15ea:	90                   	nop
    15eb:	90                   	nop
    15ec:	90                   	nop
    15ed:	90                   	nop
    15ee:	90                   	nop
    15ef:	90                   	nop

000015f0 <peek>:
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
    15f0:	55                   	push   %ebp
    15f1:	89 e5                	mov    %esp,%ebp
    15f3:	57                   	push   %edi
    15f4:	56                   	push   %esi
    15f5:	53                   	push   %ebx
    15f6:	83 ec 0c             	sub    $0xc,%esp
    15f9:	8b 7d 08             	mov    0x8(%ebp),%edi
    15fc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
    15ff:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
    1601:	39 f3                	cmp    %esi,%ebx
    1603:	72 12                	jb     1617 <peek+0x27>
    1605:	eb 28                	jmp    162f <peek+0x3f>
    1607:	89 f6                	mov    %esi,%esi
    1609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    s++;
    1610:	83 c3 01             	add    $0x1,%ebx
peek(char **ps, char *es, char *toks)
{
  char *s;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
    1613:	39 de                	cmp    %ebx,%esi
    1615:	74 18                	je     162f <peek+0x3f>
    1617:	0f be 03             	movsbl (%ebx),%eax
    161a:	83 ec 08             	sub    $0x8,%esp
    161d:	50                   	push   %eax
    161e:	68 38 38 00 00       	push   $0x3838
    1623:	e8 88 05 00 00       	call   1bb0 <strchr>
    1628:	83 c4 10             	add    $0x10,%esp
    162b:	85 c0                	test   %eax,%eax
    162d:	75 e1                	jne    1610 <peek+0x20>
    s++;
  *ps = s;
    162f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
    1631:	0f be 13             	movsbl (%ebx),%edx
    1634:	31 c0                	xor    %eax,%eax
    1636:	84 d2                	test   %dl,%dl
    1638:	74 17                	je     1651 <peek+0x61>
    163a:	83 ec 08             	sub    $0x8,%esp
    163d:	52                   	push   %edx
    163e:	ff 75 10             	pushl  0x10(%ebp)
    1641:	e8 6a 05 00 00       	call   1bb0 <strchr>
    1646:	83 c4 10             	add    $0x10,%esp
    1649:	85 c0                	test   %eax,%eax
    164b:	0f 95 c0             	setne  %al
    164e:	0f b6 c0             	movzbl %al,%eax
}
    1651:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1654:	5b                   	pop    %ebx
    1655:	5e                   	pop    %esi
    1656:	5f                   	pop    %edi
    1657:	5d                   	pop    %ebp
    1658:	c3                   	ret    
    1659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001660 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
    1660:	55                   	push   %ebp
    1661:	89 e5                	mov    %esp,%ebp
    1663:	57                   	push   %edi
    1664:	56                   	push   %esi
    1665:	53                   	push   %ebx
    1666:	83 ec 1c             	sub    $0x1c,%esp
    1669:	8b 75 0c             	mov    0xc(%ebp),%esi
    166c:	8b 5d 10             	mov    0x10(%ebp),%ebx
    166f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    1670:	83 ec 04             	sub    $0x4,%esp
    1673:	68 e1 21 00 00       	push   $0x21e1
    1678:	53                   	push   %ebx
    1679:	56                   	push   %esi
    167a:	e8 71 ff ff ff       	call   15f0 <peek>
    167f:	83 c4 10             	add    $0x10,%esp
    1682:	85 c0                	test   %eax,%eax
    1684:	74 6a                	je     16f0 <parseredirs+0x90>
    tok = gettoken(ps, es, 0, 0);
    1686:	6a 00                	push   $0x0
    1688:	6a 00                	push   $0x0
    168a:	53                   	push   %ebx
    168b:	56                   	push   %esi
    168c:	e8 ef fd ff ff       	call   1480 <gettoken>
    1691:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
    1693:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1696:	50                   	push   %eax
    1697:	8d 45 e0             	lea    -0x20(%ebp),%eax
    169a:	50                   	push   %eax
    169b:	53                   	push   %ebx
    169c:	56                   	push   %esi
    169d:	e8 de fd ff ff       	call   1480 <gettoken>
    16a2:	83 c4 20             	add    $0x20,%esp
    16a5:	83 f8 61             	cmp    $0x61,%eax
    16a8:	75 51                	jne    16fb <parseredirs+0x9b>
      panic("missing file for redirection");
    switch(tok){
    16aa:	83 ff 3c             	cmp    $0x3c,%edi
    16ad:	74 31                	je     16e0 <parseredirs+0x80>
    16af:	83 ff 3e             	cmp    $0x3e,%edi
    16b2:	74 05                	je     16b9 <parseredirs+0x59>
    16b4:	83 ff 2b             	cmp    $0x2b,%edi
    16b7:	75 b7                	jne    1670 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    16b9:	83 ec 0c             	sub    $0xc,%esp
    16bc:	6a 01                	push   $0x1
    16be:	68 01 02 00 00       	push   $0x201
    16c3:	ff 75 e4             	pushl  -0x1c(%ebp)
    16c6:	ff 75 e0             	pushl  -0x20(%ebp)
    16c9:	ff 75 08             	pushl  0x8(%ebp)
    16cc:	e8 af fc ff ff       	call   1380 <redircmd>
      break;
    16d1:	83 c4 20             	add    $0x20,%esp
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    16d4:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    16d7:	eb 97                	jmp    1670 <parseredirs+0x10>
    16d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    16e0:	83 ec 0c             	sub    $0xc,%esp
    16e3:	6a 00                	push   $0x0
    16e5:	6a 00                	push   $0x0
    16e7:	eb da                	jmp    16c3 <parseredirs+0x63>
    16e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}
    16f0:	8b 45 08             	mov    0x8(%ebp),%eax
    16f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    16f6:	5b                   	pop    %ebx
    16f7:	5e                   	pop    %esi
    16f8:	5f                   	pop    %edi
    16f9:	5d                   	pop    %ebp
    16fa:	c3                   	ret    
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    16fb:	83 ec 0c             	sub    $0xc,%esp
    16fe:	68 c4 21 00 00       	push   $0x21c4
    1703:	e8 58 fa ff ff       	call   1160 <panic>
    1708:	90                   	nop
    1709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001710 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
    1710:	55                   	push   %ebp
    1711:	89 e5                	mov    %esp,%ebp
    1713:	57                   	push   %edi
    1714:	56                   	push   %esi
    1715:	53                   	push   %ebx
    1716:	83 ec 30             	sub    $0x30,%esp
    1719:	8b 75 08             	mov    0x8(%ebp),%esi
    171c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    171f:	68 e4 21 00 00       	push   $0x21e4
    1724:	57                   	push   %edi
    1725:	56                   	push   %esi
    1726:	e8 c5 fe ff ff       	call   15f0 <peek>
    172b:	83 c4 10             	add    $0x10,%esp
    172e:	85 c0                	test   %eax,%eax
    1730:	0f 85 9a 00 00 00    	jne    17d0 <parseexec+0xc0>
    return parseblock(ps, es);

  ret = execcmd();
    1736:	e8 15 fc ff ff       	call   1350 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
    173b:	83 ec 04             	sub    $0x4,%esp
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
    173e:	89 c3                	mov    %eax,%ebx
    1740:	89 45 cc             	mov    %eax,-0x34(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
    1743:	57                   	push   %edi
    1744:	56                   	push   %esi
    1745:	8d 5b 04             	lea    0x4(%ebx),%ebx
    1748:	50                   	push   %eax
    1749:	e8 12 ff ff ff       	call   1660 <parseredirs>
    174e:	83 c4 10             	add    $0x10,%esp
    1751:	89 45 d0             	mov    %eax,-0x30(%ebp)
    return parseblock(ps, es);

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
    1754:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    175b:	eb 16                	jmp    1773 <parseexec+0x63>
    175d:	8d 76 00             	lea    0x0(%esi),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
    1760:	83 ec 04             	sub    $0x4,%esp
    1763:	57                   	push   %edi
    1764:	56                   	push   %esi
    1765:	ff 75 d0             	pushl  -0x30(%ebp)
    1768:	e8 f3 fe ff ff       	call   1660 <parseredirs>
    176d:	83 c4 10             	add    $0x10,%esp
    1770:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    1773:	83 ec 04             	sub    $0x4,%esp
    1776:	68 fb 21 00 00       	push   $0x21fb
    177b:	57                   	push   %edi
    177c:	56                   	push   %esi
    177d:	e8 6e fe ff ff       	call   15f0 <peek>
    1782:	83 c4 10             	add    $0x10,%esp
    1785:	85 c0                	test   %eax,%eax
    1787:	75 5f                	jne    17e8 <parseexec+0xd8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    1789:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    178c:	50                   	push   %eax
    178d:	8d 45 e0             	lea    -0x20(%ebp),%eax
    1790:	50                   	push   %eax
    1791:	57                   	push   %edi
    1792:	56                   	push   %esi
    1793:	e8 e8 fc ff ff       	call   1480 <gettoken>
    1798:	83 c4 10             	add    $0x10,%esp
    179b:	85 c0                	test   %eax,%eax
    179d:	74 49                	je     17e8 <parseexec+0xd8>
      break;
    if(tok != 'a')
    179f:	83 f8 61             	cmp    $0x61,%eax
    17a2:	75 66                	jne    180a <parseexec+0xfa>
      panic("syntax");
    cmd->argv[argc] = q;
    17a4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    cmd->eargv[argc] = eq;
    argc++;
    17a7:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    17ab:	83 c3 04             	add    $0x4,%ebx
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
    17ae:	89 43 fc             	mov    %eax,-0x4(%ebx)
    cmd->eargv[argc] = eq;
    17b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    17b4:	89 43 24             	mov    %eax,0x24(%ebx)
    argc++;
    17b7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    if(argc >= MAXARGS)
    17ba:	83 f8 0a             	cmp    $0xa,%eax
    17bd:	75 a1                	jne    1760 <parseexec+0x50>
      panic("too many args");
    17bf:	83 ec 0c             	sub    $0xc,%esp
    17c2:	68 ed 21 00 00       	push   $0x21ed
    17c7:	e8 94 f9 ff ff       	call   1160 <panic>
    17cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);
    17d0:	83 ec 08             	sub    $0x8,%esp
    17d3:	57                   	push   %edi
    17d4:	56                   	push   %esi
    17d5:	e8 56 01 00 00       	call   1930 <parseblock>
    17da:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
    17dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    17e0:	5b                   	pop    %ebx
    17e1:	5e                   	pop    %esi
    17e2:	5f                   	pop    %edi
    17e3:	5d                   	pop    %ebp
    17e4:	c3                   	ret    
    17e5:	8d 76 00             	lea    0x0(%esi),%esi
    17e8:	8b 45 cc             	mov    -0x34(%ebp),%eax
    17eb:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    17ee:	8d 04 90             	lea    (%eax,%edx,4),%eax
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    17f1:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
    17f8:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
    17ff:	8b 45 d0             	mov    -0x30(%ebp),%eax
  return ret;
}
    1802:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1805:	5b                   	pop    %ebx
    1806:	5e                   	pop    %esi
    1807:	5f                   	pop    %edi
    1808:	5d                   	pop    %ebp
    1809:	c3                   	ret    
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    180a:	83 ec 0c             	sub    $0xc,%esp
    180d:	68 e6 21 00 00       	push   $0x21e6
    1812:	e8 49 f9 ff ff       	call   1160 <panic>
    1817:	89 f6                	mov    %esi,%esi
    1819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001820 <parsepipe>:
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
    1820:	55                   	push   %ebp
    1821:	89 e5                	mov    %esp,%ebp
    1823:	57                   	push   %edi
    1824:	56                   	push   %esi
    1825:	53                   	push   %ebx
    1826:	83 ec 14             	sub    $0x14,%esp
    1829:	8b 5d 08             	mov    0x8(%ebp),%ebx
    182c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    182f:	56                   	push   %esi
    1830:	53                   	push   %ebx
    1831:	e8 da fe ff ff       	call   1710 <parseexec>
  if(peek(ps, es, "|")){
    1836:	83 c4 0c             	add    $0xc,%esp
struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    1839:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
    183b:	68 00 22 00 00       	push   $0x2200
    1840:	56                   	push   %esi
    1841:	53                   	push   %ebx
    1842:	e8 a9 fd ff ff       	call   15f0 <peek>
    1847:	83 c4 10             	add    $0x10,%esp
    184a:	85 c0                	test   %eax,%eax
    184c:	75 12                	jne    1860 <parsepipe+0x40>
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}
    184e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1851:	89 f8                	mov    %edi,%eax
    1853:	5b                   	pop    %ebx
    1854:	5e                   	pop    %esi
    1855:	5f                   	pop    %edi
    1856:	5d                   	pop    %ebp
    1857:	c3                   	ret    
    1858:	90                   	nop
    1859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    1860:	6a 00                	push   $0x0
    1862:	6a 00                	push   $0x0
    1864:	56                   	push   %esi
    1865:	53                   	push   %ebx
    1866:	e8 15 fc ff ff       	call   1480 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
    186b:	58                   	pop    %eax
    186c:	5a                   	pop    %edx
    186d:	56                   	push   %esi
    186e:	53                   	push   %ebx
    186f:	e8 ac ff ff ff       	call   1820 <parsepipe>
    1874:	89 7d 08             	mov    %edi,0x8(%ebp)
    1877:	89 45 0c             	mov    %eax,0xc(%ebp)
    187a:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
    187d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1880:	5b                   	pop    %ebx
    1881:	5e                   	pop    %esi
    1882:	5f                   	pop    %edi
    1883:	5d                   	pop    %ebp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
    1884:	e9 47 fb ff ff       	jmp    13d0 <pipecmd>
    1889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001890 <parseline>:
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
    1890:	55                   	push   %ebp
    1891:	89 e5                	mov    %esp,%ebp
    1893:	57                   	push   %edi
    1894:	56                   	push   %esi
    1895:	53                   	push   %ebx
    1896:	83 ec 14             	sub    $0x14,%esp
    1899:	8b 5d 08             	mov    0x8(%ebp),%ebx
    189c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    189f:	56                   	push   %esi
    18a0:	53                   	push   %ebx
    18a1:	e8 7a ff ff ff       	call   1820 <parsepipe>
  while(peek(ps, es, "&")){
    18a6:	83 c4 10             	add    $0x10,%esp
struct cmd*
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    18a9:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
    18ab:	eb 1b                	jmp    18c8 <parseline+0x38>
    18ad:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
    18b0:	6a 00                	push   $0x0
    18b2:	6a 00                	push   $0x0
    18b4:	56                   	push   %esi
    18b5:	53                   	push   %ebx
    18b6:	e8 c5 fb ff ff       	call   1480 <gettoken>
    cmd = backcmd(cmd);
    18bb:	89 3c 24             	mov    %edi,(%esp)
    18be:	e8 8d fb ff ff       	call   1450 <backcmd>
    18c3:	83 c4 10             	add    $0x10,%esp
    18c6:	89 c7                	mov    %eax,%edi
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
    18c8:	83 ec 04             	sub    $0x4,%esp
    18cb:	68 02 22 00 00       	push   $0x2202
    18d0:	56                   	push   %esi
    18d1:	53                   	push   %ebx
    18d2:	e8 19 fd ff ff       	call   15f0 <peek>
    18d7:	83 c4 10             	add    $0x10,%esp
    18da:	85 c0                	test   %eax,%eax
    18dc:	75 d2                	jne    18b0 <parseline+0x20>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    18de:	83 ec 04             	sub    $0x4,%esp
    18e1:	68 fe 21 00 00       	push   $0x21fe
    18e6:	56                   	push   %esi
    18e7:	53                   	push   %ebx
    18e8:	e8 03 fd ff ff       	call   15f0 <peek>
    18ed:	83 c4 10             	add    $0x10,%esp
    18f0:	85 c0                	test   %eax,%eax
    18f2:	75 0c                	jne    1900 <parseline+0x70>
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}
    18f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    18f7:	89 f8                	mov    %edi,%eax
    18f9:	5b                   	pop    %ebx
    18fa:	5e                   	pop    %esi
    18fb:	5f                   	pop    %edi
    18fc:	5d                   	pop    %ebp
    18fd:	c3                   	ret    
    18fe:	66 90                	xchg   %ax,%ax
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    1900:	6a 00                	push   $0x0
    1902:	6a 00                	push   $0x0
    1904:	56                   	push   %esi
    1905:	53                   	push   %ebx
    1906:	e8 75 fb ff ff       	call   1480 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
    190b:	58                   	pop    %eax
    190c:	5a                   	pop    %edx
    190d:	56                   	push   %esi
    190e:	53                   	push   %ebx
    190f:	e8 7c ff ff ff       	call   1890 <parseline>
    1914:	89 7d 08             	mov    %edi,0x8(%ebp)
    1917:	89 45 0c             	mov    %eax,0xc(%ebp)
    191a:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
    191d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1920:	5b                   	pop    %ebx
    1921:	5e                   	pop    %esi
    1922:	5f                   	pop    %edi
    1923:	5d                   	pop    %ebp
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
    1924:	e9 e7 fa ff ff       	jmp    1410 <listcmd>
    1929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001930 <parseblock>:
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
    1930:	55                   	push   %ebp
    1931:	89 e5                	mov    %esp,%ebp
    1933:	57                   	push   %edi
    1934:	56                   	push   %esi
    1935:	53                   	push   %ebx
    1936:	83 ec 10             	sub    $0x10,%esp
    1939:	8b 5d 08             	mov    0x8(%ebp),%ebx
    193c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    193f:	68 e4 21 00 00       	push   $0x21e4
    1944:	56                   	push   %esi
    1945:	53                   	push   %ebx
    1946:	e8 a5 fc ff ff       	call   15f0 <peek>
    194b:	83 c4 10             	add    $0x10,%esp
    194e:	85 c0                	test   %eax,%eax
    1950:	74 4a                	je     199c <parseblock+0x6c>
    panic("parseblock");
  gettoken(ps, es, 0, 0);
    1952:	6a 00                	push   $0x0
    1954:	6a 00                	push   $0x0
    1956:	56                   	push   %esi
    1957:	53                   	push   %ebx
    1958:	e8 23 fb ff ff       	call   1480 <gettoken>
  cmd = parseline(ps, es);
    195d:	58                   	pop    %eax
    195e:	5a                   	pop    %edx
    195f:	56                   	push   %esi
    1960:	53                   	push   %ebx
    1961:	e8 2a ff ff ff       	call   1890 <parseline>
  if(!peek(ps, es, ")"))
    1966:	83 c4 0c             	add    $0xc,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
    1969:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
    196b:	68 20 22 00 00       	push   $0x2220
    1970:	56                   	push   %esi
    1971:	53                   	push   %ebx
    1972:	e8 79 fc ff ff       	call   15f0 <peek>
    1977:	83 c4 10             	add    $0x10,%esp
    197a:	85 c0                	test   %eax,%eax
    197c:	74 2b                	je     19a9 <parseblock+0x79>
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
    197e:	6a 00                	push   $0x0
    1980:	6a 00                	push   $0x0
    1982:	56                   	push   %esi
    1983:	53                   	push   %ebx
    1984:	e8 f7 fa ff ff       	call   1480 <gettoken>
  cmd = parseredirs(cmd, ps, es);
    1989:	83 c4 0c             	add    $0xc,%esp
    198c:	56                   	push   %esi
    198d:	53                   	push   %ebx
    198e:	57                   	push   %edi
    198f:	e8 cc fc ff ff       	call   1660 <parseredirs>
  return cmd;
}
    1994:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1997:	5b                   	pop    %ebx
    1998:	5e                   	pop    %esi
    1999:	5f                   	pop    %edi
    199a:	5d                   	pop    %ebp
    199b:	c3                   	ret    
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
    199c:	83 ec 0c             	sub    $0xc,%esp
    199f:	68 04 22 00 00       	push   $0x2204
    19a4:	e8 b7 f7 ff ff       	call   1160 <panic>
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
    19a9:	83 ec 0c             	sub    $0xc,%esp
    19ac:	68 0f 22 00 00       	push   $0x220f
    19b1:	e8 aa f7 ff ff       	call   1160 <panic>
    19b6:	8d 76 00             	lea    0x0(%esi),%esi
    19b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000019c0 <nulterminate>:
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
    19c0:	55                   	push   %ebp
    19c1:	89 e5                	mov    %esp,%ebp
    19c3:	53                   	push   %ebx
    19c4:	83 ec 04             	sub    $0x4,%esp
    19c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    19ca:	85 db                	test   %ebx,%ebx
    19cc:	0f 84 96 00 00 00    	je     1a68 <nulterminate+0xa8>
    return 0;

  switch(cmd->type){
    19d2:	83 3b 05             	cmpl   $0x5,(%ebx)
    19d5:	77 48                	ja     1a1f <nulterminate+0x5f>
    19d7:	8b 03                	mov    (%ebx),%eax
    19d9:	ff 24 85 60 22 00 00 	jmp    *0x2260(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
    19e0:	83 ec 0c             	sub    $0xc,%esp
    19e3:	ff 73 04             	pushl  0x4(%ebx)
    19e6:	e8 d5 ff ff ff       	call   19c0 <nulterminate>
    nulterminate(lcmd->right);
    19eb:	58                   	pop    %eax
    19ec:	ff 73 08             	pushl  0x8(%ebx)
    19ef:	e8 cc ff ff ff       	call   19c0 <nulterminate>
    break;
    19f4:	83 c4 10             	add    $0x10,%esp
    19f7:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
    19f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    19fc:	c9                   	leave  
    19fd:	c3                   	ret    
    19fe:	66 90                	xchg   %ax,%ax
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    1a00:	8b 4b 04             	mov    0x4(%ebx),%ecx
    1a03:	8d 43 2c             	lea    0x2c(%ebx),%eax
    1a06:	85 c9                	test   %ecx,%ecx
    1a08:	74 15                	je     1a1f <nulterminate+0x5f>
    1a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
    1a10:	8b 10                	mov    (%eax),%edx
    1a12:	83 c0 04             	add    $0x4,%eax
    1a15:	c6 02 00             	movb   $0x0,(%edx)
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    1a18:	8b 50 d8             	mov    -0x28(%eax),%edx
    1a1b:	85 d2                	test   %edx,%edx
    1a1d:	75 f1                	jne    1a10 <nulterminate+0x50>
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;

  switch(cmd->type){
    1a1f:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
    1a21:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1a24:	c9                   	leave  
    1a25:	c3                   	ret    
    1a26:	8d 76 00             	lea    0x0(%esi),%esi
    1a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    1a30:	83 ec 0c             	sub    $0xc,%esp
    1a33:	ff 73 04             	pushl  0x4(%ebx)
    1a36:	e8 85 ff ff ff       	call   19c0 <nulterminate>
    break;
    1a3b:	89 d8                	mov    %ebx,%eax
    1a3d:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
    1a40:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1a43:	c9                   	leave  
    1a44:	c3                   	ret    
    1a45:	8d 76 00             	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    1a48:	83 ec 0c             	sub    $0xc,%esp
    1a4b:	ff 73 04             	pushl  0x4(%ebx)
    1a4e:	e8 6d ff ff ff       	call   19c0 <nulterminate>
    *rcmd->efile = 0;
    1a53:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
    1a56:	83 c4 10             	add    $0x10,%esp
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
    1a59:	c6 00 00             	movb   $0x0,(%eax)
    break;
    1a5c:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
    1a5e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1a61:	c9                   	leave  
    1a62:	c3                   	ret    
    1a63:	90                   	nop
    1a64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;
    1a68:	31 c0                	xor    %eax,%eax
    1a6a:	eb 8d                	jmp    19f9 <nulterminate+0x39>
    1a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001a70 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
    1a70:	55                   	push   %ebp
    1a71:	89 e5                	mov    %esp,%ebp
    1a73:	56                   	push   %esi
    1a74:	53                   	push   %ebx
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
    1a75:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1a78:	83 ec 0c             	sub    $0xc,%esp
    1a7b:	53                   	push   %ebx
    1a7c:	e8 df 00 00 00       	call   1b60 <strlen>
  cmd = parseline(&s, es);
    1a81:	59                   	pop    %ecx
parsecmd(char *s)
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
    1a82:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
    1a84:	8d 45 08             	lea    0x8(%ebp),%eax
    1a87:	5e                   	pop    %esi
    1a88:	53                   	push   %ebx
    1a89:	50                   	push   %eax
    1a8a:	e8 01 fe ff ff       	call   1890 <parseline>
    1a8f:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
    1a91:	8d 45 08             	lea    0x8(%ebp),%eax
    1a94:	83 c4 0c             	add    $0xc,%esp
    1a97:	68 a9 21 00 00       	push   $0x21a9
    1a9c:	53                   	push   %ebx
    1a9d:	50                   	push   %eax
    1a9e:	e8 4d fb ff ff       	call   15f0 <peek>
  if(s != es){
    1aa3:	8b 45 08             	mov    0x8(%ebp),%eax
    1aa6:	83 c4 10             	add    $0x10,%esp
    1aa9:	39 c3                	cmp    %eax,%ebx
    1aab:	75 12                	jne    1abf <parsecmd+0x4f>
    printf(2, "leftovers: %s\n", s);
    panic("syntax");
  }
  nulterminate(cmd);
    1aad:	83 ec 0c             	sub    $0xc,%esp
    1ab0:	56                   	push   %esi
    1ab1:	e8 0a ff ff ff       	call   19c0 <nulterminate>
  return cmd;
}
    1ab6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1ab9:	89 f0                	mov    %esi,%eax
    1abb:	5b                   	pop    %ebx
    1abc:	5e                   	pop    %esi
    1abd:	5d                   	pop    %ebp
    1abe:	c3                   	ret    

  es = s + strlen(s);
  cmd = parseline(&s, es);
  peek(&s, es, "");
  if(s != es){
    printf(2, "leftovers: %s\n", s);
    1abf:	52                   	push   %edx
    1ac0:	50                   	push   %eax
    1ac1:	68 22 22 00 00       	push   $0x2222
    1ac6:	6a 02                	push   $0x2
    1ac8:	e8 a3 03 00 00       	call   1e70 <printf>
    panic("syntax");
    1acd:	c7 04 24 e6 21 00 00 	movl   $0x21e6,(%esp)
    1ad4:	e8 87 f6 ff ff       	call   1160 <panic>
    1ad9:	66 90                	xchg   %ax,%ax
    1adb:	66 90                	xchg   %ax,%ax
    1add:	66 90                	xchg   %ax,%ax
    1adf:	90                   	nop

00001ae0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1ae0:	55                   	push   %ebp
    1ae1:	89 e5                	mov    %esp,%ebp
    1ae3:	53                   	push   %ebx
    1ae4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ae7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1aea:	89 c2                	mov    %eax,%edx
    1aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1af0:	83 c1 01             	add    $0x1,%ecx
    1af3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1af7:	83 c2 01             	add    $0x1,%edx
    1afa:	84 db                	test   %bl,%bl
    1afc:	88 5a ff             	mov    %bl,-0x1(%edx)
    1aff:	75 ef                	jne    1af0 <strcpy+0x10>
    ;
  return os;
}
    1b01:	5b                   	pop    %ebx
    1b02:	5d                   	pop    %ebp
    1b03:	c3                   	ret    
    1b04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1b0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001b10 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1b10:	55                   	push   %ebp
    1b11:	89 e5                	mov    %esp,%ebp
    1b13:	56                   	push   %esi
    1b14:	53                   	push   %ebx
    1b15:	8b 55 08             	mov    0x8(%ebp),%edx
    1b18:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    1b1b:	0f b6 02             	movzbl (%edx),%eax
    1b1e:	0f b6 19             	movzbl (%ecx),%ebx
    1b21:	84 c0                	test   %al,%al
    1b23:	75 1e                	jne    1b43 <strcmp+0x33>
    1b25:	eb 29                	jmp    1b50 <strcmp+0x40>
    1b27:	89 f6                	mov    %esi,%esi
    1b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1b30:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1b33:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1b36:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1b39:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    1b3d:	84 c0                	test   %al,%al
    1b3f:	74 0f                	je     1b50 <strcmp+0x40>
    1b41:	89 f1                	mov    %esi,%ecx
    1b43:	38 d8                	cmp    %bl,%al
    1b45:	74 e9                	je     1b30 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1b47:	29 d8                	sub    %ebx,%eax
}
    1b49:	5b                   	pop    %ebx
    1b4a:	5e                   	pop    %esi
    1b4b:	5d                   	pop    %ebp
    1b4c:	c3                   	ret    
    1b4d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1b50:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1b52:	29 d8                	sub    %ebx,%eax
}
    1b54:	5b                   	pop    %ebx
    1b55:	5e                   	pop    %esi
    1b56:	5d                   	pop    %ebp
    1b57:	c3                   	ret    
    1b58:	90                   	nop
    1b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001b60 <strlen>:

uint
strlen(char *s)
{
    1b60:	55                   	push   %ebp
    1b61:	89 e5                	mov    %esp,%ebp
    1b63:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1b66:	80 39 00             	cmpb   $0x0,(%ecx)
    1b69:	74 12                	je     1b7d <strlen+0x1d>
    1b6b:	31 d2                	xor    %edx,%edx
    1b6d:	8d 76 00             	lea    0x0(%esi),%esi
    1b70:	83 c2 01             	add    $0x1,%edx
    1b73:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1b77:	89 d0                	mov    %edx,%eax
    1b79:	75 f5                	jne    1b70 <strlen+0x10>
    ;
  return n;
}
    1b7b:	5d                   	pop    %ebp
    1b7c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    1b7d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    1b7f:	5d                   	pop    %ebp
    1b80:	c3                   	ret    
    1b81:	eb 0d                	jmp    1b90 <memset>
    1b83:	90                   	nop
    1b84:	90                   	nop
    1b85:	90                   	nop
    1b86:	90                   	nop
    1b87:	90                   	nop
    1b88:	90                   	nop
    1b89:	90                   	nop
    1b8a:	90                   	nop
    1b8b:	90                   	nop
    1b8c:	90                   	nop
    1b8d:	90                   	nop
    1b8e:	90                   	nop
    1b8f:	90                   	nop

00001b90 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1b90:	55                   	push   %ebp
    1b91:	89 e5                	mov    %esp,%ebp
    1b93:	57                   	push   %edi
    1b94:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1b97:	8b 4d 10             	mov    0x10(%ebp),%ecx
    1b9a:	8b 45 0c             	mov    0xc(%ebp),%eax
    1b9d:	89 d7                	mov    %edx,%edi
    1b9f:	fc                   	cld    
    1ba0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1ba2:	89 d0                	mov    %edx,%eax
    1ba4:	5f                   	pop    %edi
    1ba5:	5d                   	pop    %ebp
    1ba6:	c3                   	ret    
    1ba7:	89 f6                	mov    %esi,%esi
    1ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001bb0 <strchr>:

char*
strchr(const char *s, char c)
{
    1bb0:	55                   	push   %ebp
    1bb1:	89 e5                	mov    %esp,%ebp
    1bb3:	53                   	push   %ebx
    1bb4:	8b 45 08             	mov    0x8(%ebp),%eax
    1bb7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    1bba:	0f b6 10             	movzbl (%eax),%edx
    1bbd:	84 d2                	test   %dl,%dl
    1bbf:	74 1d                	je     1bde <strchr+0x2e>
    if(*s == c)
    1bc1:	38 d3                	cmp    %dl,%bl
    1bc3:	89 d9                	mov    %ebx,%ecx
    1bc5:	75 0d                	jne    1bd4 <strchr+0x24>
    1bc7:	eb 17                	jmp    1be0 <strchr+0x30>
    1bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1bd0:	38 ca                	cmp    %cl,%dl
    1bd2:	74 0c                	je     1be0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1bd4:	83 c0 01             	add    $0x1,%eax
    1bd7:	0f b6 10             	movzbl (%eax),%edx
    1bda:	84 d2                	test   %dl,%dl
    1bdc:	75 f2                	jne    1bd0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    1bde:	31 c0                	xor    %eax,%eax
}
    1be0:	5b                   	pop    %ebx
    1be1:	5d                   	pop    %ebp
    1be2:	c3                   	ret    
    1be3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001bf0 <gets>:

char*
gets(char *buf, int max)
{
    1bf0:	55                   	push   %ebp
    1bf1:	89 e5                	mov    %esp,%ebp
    1bf3:	57                   	push   %edi
    1bf4:	56                   	push   %esi
    1bf5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1bf6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    1bf8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    1bfb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1bfe:	eb 29                	jmp    1c29 <gets+0x39>
    cc = read(0, &c, 1);
    1c00:	83 ec 04             	sub    $0x4,%esp
    1c03:	6a 01                	push   $0x1
    1c05:	57                   	push   %edi
    1c06:	6a 00                	push   $0x0
    1c08:	e8 2d 01 00 00       	call   1d3a <read>
    if(cc < 1)
    1c0d:	83 c4 10             	add    $0x10,%esp
    1c10:	85 c0                	test   %eax,%eax
    1c12:	7e 1d                	jle    1c31 <gets+0x41>
      break;
    buf[i++] = c;
    1c14:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1c18:	8b 55 08             	mov    0x8(%ebp),%edx
    1c1b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    1c1d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    1c1f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    1c23:	74 1b                	je     1c40 <gets+0x50>
    1c25:	3c 0d                	cmp    $0xd,%al
    1c27:	74 17                	je     1c40 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1c29:	8d 5e 01             	lea    0x1(%esi),%ebx
    1c2c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1c2f:	7c cf                	jl     1c00 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1c31:	8b 45 08             	mov    0x8(%ebp),%eax
    1c34:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1c38:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1c3b:	5b                   	pop    %ebx
    1c3c:	5e                   	pop    %esi
    1c3d:	5f                   	pop    %edi
    1c3e:	5d                   	pop    %ebp
    1c3f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1c40:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1c43:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1c45:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1c49:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1c4c:	5b                   	pop    %ebx
    1c4d:	5e                   	pop    %esi
    1c4e:	5f                   	pop    %edi
    1c4f:	5d                   	pop    %ebp
    1c50:	c3                   	ret    
    1c51:	eb 0d                	jmp    1c60 <stat>
    1c53:	90                   	nop
    1c54:	90                   	nop
    1c55:	90                   	nop
    1c56:	90                   	nop
    1c57:	90                   	nop
    1c58:	90                   	nop
    1c59:	90                   	nop
    1c5a:	90                   	nop
    1c5b:	90                   	nop
    1c5c:	90                   	nop
    1c5d:	90                   	nop
    1c5e:	90                   	nop
    1c5f:	90                   	nop

00001c60 <stat>:

int
stat(char *n, struct stat *st)
{
    1c60:	55                   	push   %ebp
    1c61:	89 e5                	mov    %esp,%ebp
    1c63:	56                   	push   %esi
    1c64:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1c65:	83 ec 08             	sub    $0x8,%esp
    1c68:	6a 00                	push   $0x0
    1c6a:	ff 75 08             	pushl  0x8(%ebp)
    1c6d:	e8 f0 00 00 00       	call   1d62 <open>
  if(fd < 0)
    1c72:	83 c4 10             	add    $0x10,%esp
    1c75:	85 c0                	test   %eax,%eax
    1c77:	78 27                	js     1ca0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1c79:	83 ec 08             	sub    $0x8,%esp
    1c7c:	ff 75 0c             	pushl  0xc(%ebp)
    1c7f:	89 c3                	mov    %eax,%ebx
    1c81:	50                   	push   %eax
    1c82:	e8 f3 00 00 00       	call   1d7a <fstat>
    1c87:	89 c6                	mov    %eax,%esi
  close(fd);
    1c89:	89 1c 24             	mov    %ebx,(%esp)
    1c8c:	e8 b9 00 00 00       	call   1d4a <close>
  return r;
    1c91:	83 c4 10             	add    $0x10,%esp
    1c94:	89 f0                	mov    %esi,%eax
}
    1c96:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1c99:	5b                   	pop    %ebx
    1c9a:	5e                   	pop    %esi
    1c9b:	5d                   	pop    %ebp
    1c9c:	c3                   	ret    
    1c9d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    1ca0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1ca5:	eb ef                	jmp    1c96 <stat+0x36>
    1ca7:	89 f6                	mov    %esi,%esi
    1ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001cb0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    1cb0:	55                   	push   %ebp
    1cb1:	89 e5                	mov    %esp,%ebp
    1cb3:	53                   	push   %ebx
    1cb4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1cb7:	0f be 11             	movsbl (%ecx),%edx
    1cba:	8d 42 d0             	lea    -0x30(%edx),%eax
    1cbd:	3c 09                	cmp    $0x9,%al
    1cbf:	b8 00 00 00 00       	mov    $0x0,%eax
    1cc4:	77 1f                	ja     1ce5 <atoi+0x35>
    1cc6:	8d 76 00             	lea    0x0(%esi),%esi
    1cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1cd0:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1cd3:	83 c1 01             	add    $0x1,%ecx
    1cd6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1cda:	0f be 11             	movsbl (%ecx),%edx
    1cdd:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1ce0:	80 fb 09             	cmp    $0x9,%bl
    1ce3:	76 eb                	jbe    1cd0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    1ce5:	5b                   	pop    %ebx
    1ce6:	5d                   	pop    %ebp
    1ce7:	c3                   	ret    
    1ce8:	90                   	nop
    1ce9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001cf0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1cf0:	55                   	push   %ebp
    1cf1:	89 e5                	mov    %esp,%ebp
    1cf3:	56                   	push   %esi
    1cf4:	53                   	push   %ebx
    1cf5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1cf8:	8b 45 08             	mov    0x8(%ebp),%eax
    1cfb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1cfe:	85 db                	test   %ebx,%ebx
    1d00:	7e 14                	jle    1d16 <memmove+0x26>
    1d02:	31 d2                	xor    %edx,%edx
    1d04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1d08:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    1d0c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    1d0f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1d12:	39 da                	cmp    %ebx,%edx
    1d14:	75 f2                	jne    1d08 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    1d16:	5b                   	pop    %ebx
    1d17:	5e                   	pop    %esi
    1d18:	5d                   	pop    %ebp
    1d19:	c3                   	ret    

00001d1a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1d1a:	b8 01 00 00 00       	mov    $0x1,%eax
    1d1f:	cd 40                	int    $0x40
    1d21:	c3                   	ret    

00001d22 <exit>:
SYSCALL(exit)
    1d22:	b8 02 00 00 00       	mov    $0x2,%eax
    1d27:	cd 40                	int    $0x40
    1d29:	c3                   	ret    

00001d2a <wait>:
SYSCALL(wait)
    1d2a:	b8 03 00 00 00       	mov    $0x3,%eax
    1d2f:	cd 40                	int    $0x40
    1d31:	c3                   	ret    

00001d32 <pipe>:
SYSCALL(pipe)
    1d32:	b8 04 00 00 00       	mov    $0x4,%eax
    1d37:	cd 40                	int    $0x40
    1d39:	c3                   	ret    

00001d3a <read>:
SYSCALL(read)
    1d3a:	b8 05 00 00 00       	mov    $0x5,%eax
    1d3f:	cd 40                	int    $0x40
    1d41:	c3                   	ret    

00001d42 <write>:
SYSCALL(write)
    1d42:	b8 10 00 00 00       	mov    $0x10,%eax
    1d47:	cd 40                	int    $0x40
    1d49:	c3                   	ret    

00001d4a <close>:
SYSCALL(close)
    1d4a:	b8 15 00 00 00       	mov    $0x15,%eax
    1d4f:	cd 40                	int    $0x40
    1d51:	c3                   	ret    

00001d52 <kill>:
SYSCALL(kill)
    1d52:	b8 06 00 00 00       	mov    $0x6,%eax
    1d57:	cd 40                	int    $0x40
    1d59:	c3                   	ret    

00001d5a <exec>:
SYSCALL(exec)
    1d5a:	b8 07 00 00 00       	mov    $0x7,%eax
    1d5f:	cd 40                	int    $0x40
    1d61:	c3                   	ret    

00001d62 <open>:
SYSCALL(open)
    1d62:	b8 0f 00 00 00       	mov    $0xf,%eax
    1d67:	cd 40                	int    $0x40
    1d69:	c3                   	ret    

00001d6a <mknod>:
SYSCALL(mknod)
    1d6a:	b8 11 00 00 00       	mov    $0x11,%eax
    1d6f:	cd 40                	int    $0x40
    1d71:	c3                   	ret    

00001d72 <unlink>:
SYSCALL(unlink)
    1d72:	b8 12 00 00 00       	mov    $0x12,%eax
    1d77:	cd 40                	int    $0x40
    1d79:	c3                   	ret    

00001d7a <fstat>:
SYSCALL(fstat)
    1d7a:	b8 08 00 00 00       	mov    $0x8,%eax
    1d7f:	cd 40                	int    $0x40
    1d81:	c3                   	ret    

00001d82 <link>:
SYSCALL(link)
    1d82:	b8 13 00 00 00       	mov    $0x13,%eax
    1d87:	cd 40                	int    $0x40
    1d89:	c3                   	ret    

00001d8a <mkdir>:
SYSCALL(mkdir)
    1d8a:	b8 14 00 00 00       	mov    $0x14,%eax
    1d8f:	cd 40                	int    $0x40
    1d91:	c3                   	ret    

00001d92 <chdir>:
SYSCALL(chdir)
    1d92:	b8 09 00 00 00       	mov    $0x9,%eax
    1d97:	cd 40                	int    $0x40
    1d99:	c3                   	ret    

00001d9a <dup>:
SYSCALL(dup)
    1d9a:	b8 0a 00 00 00       	mov    $0xa,%eax
    1d9f:	cd 40                	int    $0x40
    1da1:	c3                   	ret    

00001da2 <getpid>:
SYSCALL(getpid)
    1da2:	b8 0b 00 00 00       	mov    $0xb,%eax
    1da7:	cd 40                	int    $0x40
    1da9:	c3                   	ret    

00001daa <sbrk>:
SYSCALL(sbrk)
    1daa:	b8 0c 00 00 00       	mov    $0xc,%eax
    1daf:	cd 40                	int    $0x40
    1db1:	c3                   	ret    

00001db2 <sleep>:
SYSCALL(sleep)
    1db2:	b8 0d 00 00 00       	mov    $0xd,%eax
    1db7:	cd 40                	int    $0x40
    1db9:	c3                   	ret    

00001dba <uptime>:
SYSCALL(uptime)
    1dba:	b8 0e 00 00 00       	mov    $0xe,%eax
    1dbf:	cd 40                	int    $0x40
    1dc1:	c3                   	ret    
    1dc2:	66 90                	xchg   %ax,%ax
    1dc4:	66 90                	xchg   %ax,%ax
    1dc6:	66 90                	xchg   %ax,%ax
    1dc8:	66 90                	xchg   %ax,%ax
    1dca:	66 90                	xchg   %ax,%ax
    1dcc:	66 90                	xchg   %ax,%ax
    1dce:	66 90                	xchg   %ax,%ax

00001dd0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1dd0:	55                   	push   %ebp
    1dd1:	89 e5                	mov    %esp,%ebp
    1dd3:	57                   	push   %edi
    1dd4:	56                   	push   %esi
    1dd5:	53                   	push   %ebx
    1dd6:	89 c6                	mov    %eax,%esi
    1dd8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1ddb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1dde:	85 db                	test   %ebx,%ebx
    1de0:	74 7e                	je     1e60 <printint+0x90>
    1de2:	89 d0                	mov    %edx,%eax
    1de4:	c1 e8 1f             	shr    $0x1f,%eax
    1de7:	84 c0                	test   %al,%al
    1de9:	74 75                	je     1e60 <printint+0x90>
    neg = 1;
    x = -xx;
    1deb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    1ded:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    1df4:	f7 d8                	neg    %eax
    1df6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1df9:	31 ff                	xor    %edi,%edi
    1dfb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1dfe:	89 ce                	mov    %ecx,%esi
    1e00:	eb 08                	jmp    1e0a <printint+0x3a>
    1e02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1e08:	89 cf                	mov    %ecx,%edi
    1e0a:	31 d2                	xor    %edx,%edx
    1e0c:	8d 4f 01             	lea    0x1(%edi),%ecx
    1e0f:	f7 f6                	div    %esi
    1e11:	0f b6 92 80 22 00 00 	movzbl 0x2280(%edx),%edx
  }while((x /= base) != 0);
    1e18:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    1e1a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    1e1d:	75 e9                	jne    1e08 <printint+0x38>
  if(neg)
    1e1f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1e22:	8b 75 c0             	mov    -0x40(%ebp),%esi
    1e25:	85 c0                	test   %eax,%eax
    1e27:	74 08                	je     1e31 <printint+0x61>
    buf[i++] = '-';
    1e29:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    1e2e:	8d 4f 02             	lea    0x2(%edi),%ecx
    1e31:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    1e35:	8d 76 00             	lea    0x0(%esi),%esi
    1e38:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1e3b:	83 ec 04             	sub    $0x4,%esp
    1e3e:	83 ef 01             	sub    $0x1,%edi
    1e41:	6a 01                	push   $0x1
    1e43:	53                   	push   %ebx
    1e44:	56                   	push   %esi
    1e45:	88 45 d7             	mov    %al,-0x29(%ebp)
    1e48:	e8 f5 fe ff ff       	call   1d42 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1e4d:	83 c4 10             	add    $0x10,%esp
    1e50:	39 df                	cmp    %ebx,%edi
    1e52:	75 e4                	jne    1e38 <printint+0x68>
    putc(fd, buf[i]);
}
    1e54:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1e57:	5b                   	pop    %ebx
    1e58:	5e                   	pop    %esi
    1e59:	5f                   	pop    %edi
    1e5a:	5d                   	pop    %ebp
    1e5b:	c3                   	ret    
    1e5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    1e60:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1e62:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1e69:	eb 8b                	jmp    1df6 <printint+0x26>
    1e6b:	90                   	nop
    1e6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001e70 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1e70:	55                   	push   %ebp
    1e71:	89 e5                	mov    %esp,%ebp
    1e73:	57                   	push   %edi
    1e74:	56                   	push   %esi
    1e75:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1e76:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1e79:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1e7c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1e7f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1e82:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1e85:	0f b6 1e             	movzbl (%esi),%ebx
    1e88:	83 c6 01             	add    $0x1,%esi
    1e8b:	84 db                	test   %bl,%bl
    1e8d:	0f 84 b0 00 00 00    	je     1f43 <printf+0xd3>
    1e93:	31 d2                	xor    %edx,%edx
    1e95:	eb 39                	jmp    1ed0 <printf+0x60>
    1e97:	89 f6                	mov    %esi,%esi
    1e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1ea0:	83 f8 25             	cmp    $0x25,%eax
    1ea3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    1ea6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1eab:	74 18                	je     1ec5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1ead:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1eb0:	83 ec 04             	sub    $0x4,%esp
    1eb3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    1eb6:	6a 01                	push   $0x1
    1eb8:	50                   	push   %eax
    1eb9:	57                   	push   %edi
    1eba:	e8 83 fe ff ff       	call   1d42 <write>
    1ebf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1ec2:	83 c4 10             	add    $0x10,%esp
    1ec5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1ec8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1ecc:	84 db                	test   %bl,%bl
    1ece:	74 73                	je     1f43 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    1ed0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    1ed2:	0f be cb             	movsbl %bl,%ecx
    1ed5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1ed8:	74 c6                	je     1ea0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1eda:	83 fa 25             	cmp    $0x25,%edx
    1edd:	75 e6                	jne    1ec5 <printf+0x55>
      if(c == 'd'){
    1edf:	83 f8 64             	cmp    $0x64,%eax
    1ee2:	0f 84 f8 00 00 00    	je     1fe0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1ee8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1eee:	83 f9 70             	cmp    $0x70,%ecx
    1ef1:	74 5d                	je     1f50 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1ef3:	83 f8 73             	cmp    $0x73,%eax
    1ef6:	0f 84 84 00 00 00    	je     1f80 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1efc:	83 f8 63             	cmp    $0x63,%eax
    1eff:	0f 84 ea 00 00 00    	je     1fef <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1f05:	83 f8 25             	cmp    $0x25,%eax
    1f08:	0f 84 c2 00 00 00    	je     1fd0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1f0e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1f11:	83 ec 04             	sub    $0x4,%esp
    1f14:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1f18:	6a 01                	push   $0x1
    1f1a:	50                   	push   %eax
    1f1b:	57                   	push   %edi
    1f1c:	e8 21 fe ff ff       	call   1d42 <write>
    1f21:	83 c4 0c             	add    $0xc,%esp
    1f24:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1f27:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    1f2a:	6a 01                	push   $0x1
    1f2c:	50                   	push   %eax
    1f2d:	57                   	push   %edi
    1f2e:	83 c6 01             	add    $0x1,%esi
    1f31:	e8 0c fe ff ff       	call   1d42 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1f36:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1f3a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1f3d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1f3f:	84 db                	test   %bl,%bl
    1f41:	75 8d                	jne    1ed0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1f43:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1f46:	5b                   	pop    %ebx
    1f47:	5e                   	pop    %esi
    1f48:	5f                   	pop    %edi
    1f49:	5d                   	pop    %ebp
    1f4a:	c3                   	ret    
    1f4b:	90                   	nop
    1f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    1f50:	83 ec 0c             	sub    $0xc,%esp
    1f53:	b9 10 00 00 00       	mov    $0x10,%ecx
    1f58:	6a 00                	push   $0x0
    1f5a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1f5d:	89 f8                	mov    %edi,%eax
    1f5f:	8b 13                	mov    (%ebx),%edx
    1f61:	e8 6a fe ff ff       	call   1dd0 <printint>
        ap++;
    1f66:	89 d8                	mov    %ebx,%eax
    1f68:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1f6b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    1f6d:	83 c0 04             	add    $0x4,%eax
    1f70:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1f73:	e9 4d ff ff ff       	jmp    1ec5 <printf+0x55>
    1f78:	90                   	nop
    1f79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    1f80:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1f83:	8b 18                	mov    (%eax),%ebx
        ap++;
    1f85:	83 c0 04             	add    $0x4,%eax
    1f88:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    1f8b:	b8 78 22 00 00       	mov    $0x2278,%eax
    1f90:	85 db                	test   %ebx,%ebx
    1f92:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    1f95:	0f b6 03             	movzbl (%ebx),%eax
    1f98:	84 c0                	test   %al,%al
    1f9a:	74 23                	je     1fbf <printf+0x14f>
    1f9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1fa0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1fa3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1fa6:	83 ec 04             	sub    $0x4,%esp
    1fa9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    1fab:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1fae:	50                   	push   %eax
    1faf:	57                   	push   %edi
    1fb0:	e8 8d fd ff ff       	call   1d42 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1fb5:	0f b6 03             	movzbl (%ebx),%eax
    1fb8:	83 c4 10             	add    $0x10,%esp
    1fbb:	84 c0                	test   %al,%al
    1fbd:	75 e1                	jne    1fa0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1fbf:	31 d2                	xor    %edx,%edx
    1fc1:	e9 ff fe ff ff       	jmp    1ec5 <printf+0x55>
    1fc6:	8d 76 00             	lea    0x0(%esi),%esi
    1fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1fd0:	83 ec 04             	sub    $0x4,%esp
    1fd3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    1fd6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1fd9:	6a 01                	push   $0x1
    1fdb:	e9 4c ff ff ff       	jmp    1f2c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    1fe0:	83 ec 0c             	sub    $0xc,%esp
    1fe3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1fe8:	6a 01                	push   $0x1
    1fea:	e9 6b ff ff ff       	jmp    1f5a <printf+0xea>
    1fef:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1ff2:	83 ec 04             	sub    $0x4,%esp
    1ff5:	8b 03                	mov    (%ebx),%eax
    1ff7:	6a 01                	push   $0x1
    1ff9:	88 45 e4             	mov    %al,-0x1c(%ebp)
    1ffc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1fff:	50                   	push   %eax
    2000:	57                   	push   %edi
    2001:	e8 3c fd ff ff       	call   1d42 <write>
    2006:	e9 5b ff ff ff       	jmp    1f66 <printf+0xf6>
    200b:	66 90                	xchg   %ax,%ax
    200d:	66 90                	xchg   %ax,%ax
    200f:	90                   	nop

00002010 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    2010:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    2011:	a1 a4 38 00 00       	mov    0x38a4,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    2016:	89 e5                	mov    %esp,%ebp
    2018:	57                   	push   %edi
    2019:	56                   	push   %esi
    201a:	53                   	push   %ebx
    201b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    201e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    2020:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    2023:	39 c8                	cmp    %ecx,%eax
    2025:	73 19                	jae    2040 <free+0x30>
    2027:	89 f6                	mov    %esi,%esi
    2029:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    2030:	39 d1                	cmp    %edx,%ecx
    2032:	72 1c                	jb     2050 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    2034:	39 d0                	cmp    %edx,%eax
    2036:	73 18                	jae    2050 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    2038:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    203a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    203c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    203e:	72 f0                	jb     2030 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    2040:	39 d0                	cmp    %edx,%eax
    2042:	72 f4                	jb     2038 <free+0x28>
    2044:	39 d1                	cmp    %edx,%ecx
    2046:	73 f0                	jae    2038 <free+0x28>
    2048:	90                   	nop
    2049:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    2050:	8b 73 fc             	mov    -0x4(%ebx),%esi
    2053:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    2056:	39 d7                	cmp    %edx,%edi
    2058:	74 19                	je     2073 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    205a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    205d:	8b 50 04             	mov    0x4(%eax),%edx
    2060:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    2063:	39 f1                	cmp    %esi,%ecx
    2065:	74 23                	je     208a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    2067:	89 08                	mov    %ecx,(%eax)
  freep = p;
    2069:	a3 a4 38 00 00       	mov    %eax,0x38a4
}
    206e:	5b                   	pop    %ebx
    206f:	5e                   	pop    %esi
    2070:	5f                   	pop    %edi
    2071:	5d                   	pop    %ebp
    2072:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    2073:	03 72 04             	add    0x4(%edx),%esi
    2076:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    2079:	8b 10                	mov    (%eax),%edx
    207b:	8b 12                	mov    (%edx),%edx
    207d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    2080:	8b 50 04             	mov    0x4(%eax),%edx
    2083:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    2086:	39 f1                	cmp    %esi,%ecx
    2088:	75 dd                	jne    2067 <free+0x57>
    p->s.size += bp->s.size;
    208a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    208d:	a3 a4 38 00 00       	mov    %eax,0x38a4
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    2092:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    2095:	8b 53 f8             	mov    -0x8(%ebx),%edx
    2098:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    209a:	5b                   	pop    %ebx
    209b:	5e                   	pop    %esi
    209c:	5f                   	pop    %edi
    209d:	5d                   	pop    %ebp
    209e:	c3                   	ret    
    209f:	90                   	nop

000020a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    20a0:	55                   	push   %ebp
    20a1:	89 e5                	mov    %esp,%ebp
    20a3:	57                   	push   %edi
    20a4:	56                   	push   %esi
    20a5:	53                   	push   %ebx
    20a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    20a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    20ac:	8b 15 a4 38 00 00    	mov    0x38a4,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    20b2:	8d 78 07             	lea    0x7(%eax),%edi
    20b5:	c1 ef 03             	shr    $0x3,%edi
    20b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    20bb:	85 d2                	test   %edx,%edx
    20bd:	0f 84 a3 00 00 00    	je     2166 <malloc+0xc6>
    20c3:	8b 02                	mov    (%edx),%eax
    20c5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    20c8:	39 cf                	cmp    %ecx,%edi
    20ca:	76 74                	jbe    2140 <malloc+0xa0>
    20cc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    20d2:	be 00 10 00 00       	mov    $0x1000,%esi
    20d7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    20de:	0f 43 f7             	cmovae %edi,%esi
    20e1:	ba 00 80 00 00       	mov    $0x8000,%edx
    20e6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    20ec:	0f 46 da             	cmovbe %edx,%ebx
    20ef:	eb 10                	jmp    2101 <malloc+0x61>
    20f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    20f8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    20fa:	8b 48 04             	mov    0x4(%eax),%ecx
    20fd:	39 cf                	cmp    %ecx,%edi
    20ff:	76 3f                	jbe    2140 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    2101:	39 05 a4 38 00 00    	cmp    %eax,0x38a4
    2107:	89 c2                	mov    %eax,%edx
    2109:	75 ed                	jne    20f8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    210b:	83 ec 0c             	sub    $0xc,%esp
    210e:	53                   	push   %ebx
    210f:	e8 96 fc ff ff       	call   1daa <sbrk>
  if(p == (char*)-1)
    2114:	83 c4 10             	add    $0x10,%esp
    2117:	83 f8 ff             	cmp    $0xffffffff,%eax
    211a:	74 1c                	je     2138 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    211c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    211f:	83 ec 0c             	sub    $0xc,%esp
    2122:	83 c0 08             	add    $0x8,%eax
    2125:	50                   	push   %eax
    2126:	e8 e5 fe ff ff       	call   2010 <free>
  return freep;
    212b:	8b 15 a4 38 00 00    	mov    0x38a4,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    2131:	83 c4 10             	add    $0x10,%esp
    2134:	85 d2                	test   %edx,%edx
    2136:	75 c0                	jne    20f8 <malloc+0x58>
        return 0;
    2138:	31 c0                	xor    %eax,%eax
    213a:	eb 1c                	jmp    2158 <malloc+0xb8>
    213c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    2140:	39 cf                	cmp    %ecx,%edi
    2142:	74 1c                	je     2160 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    2144:	29 f9                	sub    %edi,%ecx
    2146:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    2149:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    214c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    214f:	89 15 a4 38 00 00    	mov    %edx,0x38a4
      return (void*)(p + 1);
    2155:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    2158:	8d 65 f4             	lea    -0xc(%ebp),%esp
    215b:	5b                   	pop    %ebx
    215c:	5e                   	pop    %esi
    215d:	5f                   	pop    %edi
    215e:	5d                   	pop    %ebp
    215f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    2160:	8b 08                	mov    (%eax),%ecx
    2162:	89 0a                	mov    %ecx,(%edx)
    2164:	eb e9                	jmp    214f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    2166:	c7 05 a4 38 00 00 a8 	movl   $0x38a8,0x38a4
    216d:	38 00 00 
    2170:	c7 05 a8 38 00 00 a8 	movl   $0x38a8,0x38a8
    2177:	38 00 00 
    base.s.size = 0;
    217a:	b8 a8 38 00 00       	mov    $0x38a8,%eax
    217f:	c7 05 ac 38 00 00 00 	movl   $0x0,0x38ac
    2186:	00 00 00 
    2189:	e9 3e ff ff ff       	jmp    20cc <malloc+0x2c>
