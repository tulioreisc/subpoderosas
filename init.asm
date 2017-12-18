
_init: formato do arquivo elf32-i386


Desmontagem da seção .text:

00001000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	53                   	push   %ebx
    100e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    100f:	83 ec 08             	sub    $0x8,%esp
    1012:	6a 02                	push   $0x2
    1014:	68 a0 17 00 00       	push   $0x17a0
    1019:	e8 54 03 00 00       	call   1372 <open>
    101e:	83 c4 10             	add    $0x10,%esp
    1021:	85 c0                	test   %eax,%eax
    1023:	0f 88 9f 00 00 00    	js     10c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
    1029:	83 ec 0c             	sub    $0xc,%esp
    102c:	6a 00                	push   $0x0
    102e:	e8 77 03 00 00       	call   13aa <dup>
  dup(0);  // stderr
    1033:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    103a:	e8 6b 03 00 00       	call   13aa <dup>
    103f:	83 c4 10             	add    $0x10,%esp
    1042:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
    1048:	83 ec 08             	sub    $0x8,%esp
    104b:	68 a8 17 00 00       	push   $0x17a8
    1050:	6a 01                	push   $0x1
    1052:	e8 29 04 00 00       	call   1480 <printf>
    pid = fork();
    1057:	e8 ce 02 00 00       	call   132a <fork>
    if(pid < 0){
    105c:	83 c4 10             	add    $0x10,%esp
    105f:	85 c0                	test   %eax,%eax
  dup(0);  // stdout
  dup(0);  // stderr

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    1061:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
    1063:	78 2c                	js     1091 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
    1065:	74 3d                	je     10a4 <main+0xa4>
    1067:	89 f6                	mov    %esi,%esi
    1069:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
    1070:	e8 c5 02 00 00       	call   133a <wait>
    1075:	85 c0                	test   %eax,%eax
    1077:	78 cf                	js     1048 <main+0x48>
    1079:	39 c3                	cmp    %eax,%ebx
    107b:	74 cb                	je     1048 <main+0x48>
      printf(1, "zombie!\n");
    107d:	83 ec 08             	sub    $0x8,%esp
    1080:	68 e7 17 00 00       	push   $0x17e7
    1085:	6a 01                	push   $0x1
    1087:	e8 f4 03 00 00       	call   1480 <printf>
    108c:	83 c4 10             	add    $0x10,%esp
    108f:	eb df                	jmp    1070 <main+0x70>

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
    1091:	53                   	push   %ebx
    1092:	53                   	push   %ebx
    1093:	68 bb 17 00 00       	push   $0x17bb
    1098:	6a 01                	push   $0x1
    109a:	e8 e1 03 00 00       	call   1480 <printf>
      exit();
    109f:	e8 8e 02 00 00       	call   1332 <exit>
    }
    if(pid == 0){
      exec("sh", argv);
    10a4:	50                   	push   %eax
    10a5:	50                   	push   %eax
    10a6:	68 94 1a 00 00       	push   $0x1a94
    10ab:	68 ce 17 00 00       	push   $0x17ce
    10b0:	e8 b5 02 00 00       	call   136a <exec>
      printf(1, "init: exec sh failed\n");
    10b5:	5a                   	pop    %edx
    10b6:	59                   	pop    %ecx
    10b7:	68 d1 17 00 00       	push   $0x17d1
    10bc:	6a 01                	push   $0x1
    10be:	e8 bd 03 00 00       	call   1480 <printf>
      exit();
    10c3:	e8 6a 02 00 00       	call   1332 <exit>
main(void)
{
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    mknod("console", 1, 1);
    10c8:	50                   	push   %eax
    10c9:	6a 01                	push   $0x1
    10cb:	6a 01                	push   $0x1
    10cd:	68 a0 17 00 00       	push   $0x17a0
    10d2:	e8 a3 02 00 00       	call   137a <mknod>
    open("console", O_RDWR);
    10d7:	58                   	pop    %eax
    10d8:	5a                   	pop    %edx
    10d9:	6a 02                	push   $0x2
    10db:	68 a0 17 00 00       	push   $0x17a0
    10e0:	e8 8d 02 00 00       	call   1372 <open>
    10e5:	83 c4 10             	add    $0x10,%esp
    10e8:	e9 3c ff ff ff       	jmp    1029 <main+0x29>
    10ed:	66 90                	xchg   %ax,%ax
    10ef:	90                   	nop

000010f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    10f0:	55                   	push   %ebp
    10f1:	89 e5                	mov    %esp,%ebp
    10f3:	53                   	push   %ebx
    10f4:	8b 45 08             	mov    0x8(%ebp),%eax
    10f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    10fa:	89 c2                	mov    %eax,%edx
    10fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1100:	83 c1 01             	add    $0x1,%ecx
    1103:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1107:	83 c2 01             	add    $0x1,%edx
    110a:	84 db                	test   %bl,%bl
    110c:	88 5a ff             	mov    %bl,-0x1(%edx)
    110f:	75 ef                	jne    1100 <strcpy+0x10>
    ;
  return os;
}
    1111:	5b                   	pop    %ebx
    1112:	5d                   	pop    %ebp
    1113:	c3                   	ret    
    1114:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    111a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	56                   	push   %esi
    1124:	53                   	push   %ebx
    1125:	8b 55 08             	mov    0x8(%ebp),%edx
    1128:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    112b:	0f b6 02             	movzbl (%edx),%eax
    112e:	0f b6 19             	movzbl (%ecx),%ebx
    1131:	84 c0                	test   %al,%al
    1133:	75 1e                	jne    1153 <strcmp+0x33>
    1135:	eb 29                	jmp    1160 <strcmp+0x40>
    1137:	89 f6                	mov    %esi,%esi
    1139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1140:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1143:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1146:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1149:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    114d:	84 c0                	test   %al,%al
    114f:	74 0f                	je     1160 <strcmp+0x40>
    1151:	89 f1                	mov    %esi,%ecx
    1153:	38 d8                	cmp    %bl,%al
    1155:	74 e9                	je     1140 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1157:	29 d8                	sub    %ebx,%eax
}
    1159:	5b                   	pop    %ebx
    115a:	5e                   	pop    %esi
    115b:	5d                   	pop    %ebp
    115c:	c3                   	ret    
    115d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1160:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1162:	29 d8                	sub    %ebx,%eax
}
    1164:	5b                   	pop    %ebx
    1165:	5e                   	pop    %esi
    1166:	5d                   	pop    %ebp
    1167:	c3                   	ret    
    1168:	90                   	nop
    1169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001170 <strlen>:

uint
strlen(char *s)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1176:	80 39 00             	cmpb   $0x0,(%ecx)
    1179:	74 12                	je     118d <strlen+0x1d>
    117b:	31 d2                	xor    %edx,%edx
    117d:	8d 76 00             	lea    0x0(%esi),%esi
    1180:	83 c2 01             	add    $0x1,%edx
    1183:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1187:	89 d0                	mov    %edx,%eax
    1189:	75 f5                	jne    1180 <strlen+0x10>
    ;
  return n;
}
    118b:	5d                   	pop    %ebp
    118c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    118d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    118f:	5d                   	pop    %ebp
    1190:	c3                   	ret    
    1191:	eb 0d                	jmp    11a0 <memset>
    1193:	90                   	nop
    1194:	90                   	nop
    1195:	90                   	nop
    1196:	90                   	nop
    1197:	90                   	nop
    1198:	90                   	nop
    1199:	90                   	nop
    119a:	90                   	nop
    119b:	90                   	nop
    119c:	90                   	nop
    119d:	90                   	nop
    119e:	90                   	nop
    119f:	90                   	nop

000011a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	57                   	push   %edi
    11a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11aa:	8b 45 0c             	mov    0xc(%ebp),%eax
    11ad:	89 d7                	mov    %edx,%edi
    11af:	fc                   	cld    
    11b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11b2:	89 d0                	mov    %edx,%eax
    11b4:	5f                   	pop    %edi
    11b5:	5d                   	pop    %ebp
    11b6:	c3                   	ret    
    11b7:	89 f6                	mov    %esi,%esi
    11b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011c0 <strchr>:

char*
strchr(const char *s, char c)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	53                   	push   %ebx
    11c4:	8b 45 08             	mov    0x8(%ebp),%eax
    11c7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    11ca:	0f b6 10             	movzbl (%eax),%edx
    11cd:	84 d2                	test   %dl,%dl
    11cf:	74 1d                	je     11ee <strchr+0x2e>
    if(*s == c)
    11d1:	38 d3                	cmp    %dl,%bl
    11d3:	89 d9                	mov    %ebx,%ecx
    11d5:	75 0d                	jne    11e4 <strchr+0x24>
    11d7:	eb 17                	jmp    11f0 <strchr+0x30>
    11d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11e0:	38 ca                	cmp    %cl,%dl
    11e2:	74 0c                	je     11f0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    11e4:	83 c0 01             	add    $0x1,%eax
    11e7:	0f b6 10             	movzbl (%eax),%edx
    11ea:	84 d2                	test   %dl,%dl
    11ec:	75 f2                	jne    11e0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    11ee:	31 c0                	xor    %eax,%eax
}
    11f0:	5b                   	pop    %ebx
    11f1:	5d                   	pop    %ebp
    11f2:	c3                   	ret    
    11f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001200 <gets>:

char*
gets(char *buf, int max)
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	57                   	push   %edi
    1204:	56                   	push   %esi
    1205:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1206:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    1208:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    120b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    120e:	eb 29                	jmp    1239 <gets+0x39>
    cc = read(0, &c, 1);
    1210:	83 ec 04             	sub    $0x4,%esp
    1213:	6a 01                	push   $0x1
    1215:	57                   	push   %edi
    1216:	6a 00                	push   $0x0
    1218:	e8 2d 01 00 00       	call   134a <read>
    if(cc < 1)
    121d:	83 c4 10             	add    $0x10,%esp
    1220:	85 c0                	test   %eax,%eax
    1222:	7e 1d                	jle    1241 <gets+0x41>
      break;
    buf[i++] = c;
    1224:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1228:	8b 55 08             	mov    0x8(%ebp),%edx
    122b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    122d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    122f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    1233:	74 1b                	je     1250 <gets+0x50>
    1235:	3c 0d                	cmp    $0xd,%al
    1237:	74 17                	je     1250 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1239:	8d 5e 01             	lea    0x1(%esi),%ebx
    123c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    123f:	7c cf                	jl     1210 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1241:	8b 45 08             	mov    0x8(%ebp),%eax
    1244:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1248:	8d 65 f4             	lea    -0xc(%ebp),%esp
    124b:	5b                   	pop    %ebx
    124c:	5e                   	pop    %esi
    124d:	5f                   	pop    %edi
    124e:	5d                   	pop    %ebp
    124f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1250:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1253:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1255:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1259:	8d 65 f4             	lea    -0xc(%ebp),%esp
    125c:	5b                   	pop    %ebx
    125d:	5e                   	pop    %esi
    125e:	5f                   	pop    %edi
    125f:	5d                   	pop    %ebp
    1260:	c3                   	ret    
    1261:	eb 0d                	jmp    1270 <stat>
    1263:	90                   	nop
    1264:	90                   	nop
    1265:	90                   	nop
    1266:	90                   	nop
    1267:	90                   	nop
    1268:	90                   	nop
    1269:	90                   	nop
    126a:	90                   	nop
    126b:	90                   	nop
    126c:	90                   	nop
    126d:	90                   	nop
    126e:	90                   	nop
    126f:	90                   	nop

00001270 <stat>:

int
stat(char *n, struct stat *st)
{
    1270:	55                   	push   %ebp
    1271:	89 e5                	mov    %esp,%ebp
    1273:	56                   	push   %esi
    1274:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1275:	83 ec 08             	sub    $0x8,%esp
    1278:	6a 00                	push   $0x0
    127a:	ff 75 08             	pushl  0x8(%ebp)
    127d:	e8 f0 00 00 00       	call   1372 <open>
  if(fd < 0)
    1282:	83 c4 10             	add    $0x10,%esp
    1285:	85 c0                	test   %eax,%eax
    1287:	78 27                	js     12b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1289:	83 ec 08             	sub    $0x8,%esp
    128c:	ff 75 0c             	pushl  0xc(%ebp)
    128f:	89 c3                	mov    %eax,%ebx
    1291:	50                   	push   %eax
    1292:	e8 f3 00 00 00       	call   138a <fstat>
    1297:	89 c6                	mov    %eax,%esi
  close(fd);
    1299:	89 1c 24             	mov    %ebx,(%esp)
    129c:	e8 b9 00 00 00       	call   135a <close>
  return r;
    12a1:	83 c4 10             	add    $0x10,%esp
    12a4:	89 f0                	mov    %esi,%eax
}
    12a6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12a9:	5b                   	pop    %ebx
    12aa:	5e                   	pop    %esi
    12ab:	5d                   	pop    %ebp
    12ac:	c3                   	ret    
    12ad:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    12b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    12b5:	eb ef                	jmp    12a6 <stat+0x36>
    12b7:	89 f6                	mov    %esi,%esi
    12b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012c0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    12c0:	55                   	push   %ebp
    12c1:	89 e5                	mov    %esp,%ebp
    12c3:	53                   	push   %ebx
    12c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12c7:	0f be 11             	movsbl (%ecx),%edx
    12ca:	8d 42 d0             	lea    -0x30(%edx),%eax
    12cd:	3c 09                	cmp    $0x9,%al
    12cf:	b8 00 00 00 00       	mov    $0x0,%eax
    12d4:	77 1f                	ja     12f5 <atoi+0x35>
    12d6:	8d 76 00             	lea    0x0(%esi),%esi
    12d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    12e0:	8d 04 80             	lea    (%eax,%eax,4),%eax
    12e3:	83 c1 01             	add    $0x1,%ecx
    12e6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12ea:	0f be 11             	movsbl (%ecx),%edx
    12ed:	8d 5a d0             	lea    -0x30(%edx),%ebx
    12f0:	80 fb 09             	cmp    $0x9,%bl
    12f3:	76 eb                	jbe    12e0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    12f5:	5b                   	pop    %ebx
    12f6:	5d                   	pop    %ebp
    12f7:	c3                   	ret    
    12f8:	90                   	nop
    12f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001300 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1300:	55                   	push   %ebp
    1301:	89 e5                	mov    %esp,%ebp
    1303:	56                   	push   %esi
    1304:	53                   	push   %ebx
    1305:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1308:	8b 45 08             	mov    0x8(%ebp),%eax
    130b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    130e:	85 db                	test   %ebx,%ebx
    1310:	7e 14                	jle    1326 <memmove+0x26>
    1312:	31 d2                	xor    %edx,%edx
    1314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1318:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    131c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    131f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1322:	39 da                	cmp    %ebx,%edx
    1324:	75 f2                	jne    1318 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    1326:	5b                   	pop    %ebx
    1327:	5e                   	pop    %esi
    1328:	5d                   	pop    %ebp
    1329:	c3                   	ret    

0000132a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    132a:	b8 01 00 00 00       	mov    $0x1,%eax
    132f:	cd 40                	int    $0x40
    1331:	c3                   	ret    

00001332 <exit>:
SYSCALL(exit)
    1332:	b8 02 00 00 00       	mov    $0x2,%eax
    1337:	cd 40                	int    $0x40
    1339:	c3                   	ret    

0000133a <wait>:
SYSCALL(wait)
    133a:	b8 03 00 00 00       	mov    $0x3,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    

00001342 <pipe>:
SYSCALL(pipe)
    1342:	b8 04 00 00 00       	mov    $0x4,%eax
    1347:	cd 40                	int    $0x40
    1349:	c3                   	ret    

0000134a <read>:
SYSCALL(read)
    134a:	b8 05 00 00 00       	mov    $0x5,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    

00001352 <write>:
SYSCALL(write)
    1352:	b8 10 00 00 00       	mov    $0x10,%eax
    1357:	cd 40                	int    $0x40
    1359:	c3                   	ret    

0000135a <close>:
SYSCALL(close)
    135a:	b8 15 00 00 00       	mov    $0x15,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <kill>:
SYSCALL(kill)
    1362:	b8 06 00 00 00       	mov    $0x6,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <exec>:
SYSCALL(exec)
    136a:	b8 07 00 00 00       	mov    $0x7,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    

00001372 <open>:
SYSCALL(open)
    1372:	b8 0f 00 00 00       	mov    $0xf,%eax
    1377:	cd 40                	int    $0x40
    1379:	c3                   	ret    

0000137a <mknod>:
SYSCALL(mknod)
    137a:	b8 11 00 00 00       	mov    $0x11,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    

00001382 <unlink>:
SYSCALL(unlink)
    1382:	b8 12 00 00 00       	mov    $0x12,%eax
    1387:	cd 40                	int    $0x40
    1389:	c3                   	ret    

0000138a <fstat>:
SYSCALL(fstat)
    138a:	b8 08 00 00 00       	mov    $0x8,%eax
    138f:	cd 40                	int    $0x40
    1391:	c3                   	ret    

00001392 <link>:
SYSCALL(link)
    1392:	b8 13 00 00 00       	mov    $0x13,%eax
    1397:	cd 40                	int    $0x40
    1399:	c3                   	ret    

0000139a <mkdir>:
SYSCALL(mkdir)
    139a:	b8 14 00 00 00       	mov    $0x14,%eax
    139f:	cd 40                	int    $0x40
    13a1:	c3                   	ret    

000013a2 <chdir>:
SYSCALL(chdir)
    13a2:	b8 09 00 00 00       	mov    $0x9,%eax
    13a7:	cd 40                	int    $0x40
    13a9:	c3                   	ret    

000013aa <dup>:
SYSCALL(dup)
    13aa:	b8 0a 00 00 00       	mov    $0xa,%eax
    13af:	cd 40                	int    $0x40
    13b1:	c3                   	ret    

000013b2 <getpid>:
SYSCALL(getpid)
    13b2:	b8 0b 00 00 00       	mov    $0xb,%eax
    13b7:	cd 40                	int    $0x40
    13b9:	c3                   	ret    

000013ba <sbrk>:
SYSCALL(sbrk)
    13ba:	b8 0c 00 00 00       	mov    $0xc,%eax
    13bf:	cd 40                	int    $0x40
    13c1:	c3                   	ret    

000013c2 <sleep>:
SYSCALL(sleep)
    13c2:	b8 0d 00 00 00       	mov    $0xd,%eax
    13c7:	cd 40                	int    $0x40
    13c9:	c3                   	ret    

000013ca <uptime>:
SYSCALL(uptime)
    13ca:	b8 0e 00 00 00       	mov    $0xe,%eax
    13cf:	cd 40                	int    $0x40
    13d1:	c3                   	ret    
    13d2:	66 90                	xchg   %ax,%ax
    13d4:	66 90                	xchg   %ax,%ax
    13d6:	66 90                	xchg   %ax,%ax
    13d8:	66 90                	xchg   %ax,%ax
    13da:	66 90                	xchg   %ax,%ax
    13dc:	66 90                	xchg   %ax,%ax
    13de:	66 90                	xchg   %ax,%ax

000013e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    13e0:	55                   	push   %ebp
    13e1:	89 e5                	mov    %esp,%ebp
    13e3:	57                   	push   %edi
    13e4:	56                   	push   %esi
    13e5:	53                   	push   %ebx
    13e6:	89 c6                	mov    %eax,%esi
    13e8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    13eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    13ee:	85 db                	test   %ebx,%ebx
    13f0:	74 7e                	je     1470 <printint+0x90>
    13f2:	89 d0                	mov    %edx,%eax
    13f4:	c1 e8 1f             	shr    $0x1f,%eax
    13f7:	84 c0                	test   %al,%al
    13f9:	74 75                	je     1470 <printint+0x90>
    neg = 1;
    x = -xx;
    13fb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    13fd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    1404:	f7 d8                	neg    %eax
    1406:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1409:	31 ff                	xor    %edi,%edi
    140b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    140e:	89 ce                	mov    %ecx,%esi
    1410:	eb 08                	jmp    141a <printint+0x3a>
    1412:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1418:	89 cf                	mov    %ecx,%edi
    141a:	31 d2                	xor    %edx,%edx
    141c:	8d 4f 01             	lea    0x1(%edi),%ecx
    141f:	f7 f6                	div    %esi
    1421:	0f b6 92 f8 17 00 00 	movzbl 0x17f8(%edx),%edx
  }while((x /= base) != 0);
    1428:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    142a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    142d:	75 e9                	jne    1418 <printint+0x38>
  if(neg)
    142f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1432:	8b 75 c0             	mov    -0x40(%ebp),%esi
    1435:	85 c0                	test   %eax,%eax
    1437:	74 08                	je     1441 <printint+0x61>
    buf[i++] = '-';
    1439:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    143e:	8d 4f 02             	lea    0x2(%edi),%ecx
    1441:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    1445:	8d 76 00             	lea    0x0(%esi),%esi
    1448:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    144b:	83 ec 04             	sub    $0x4,%esp
    144e:	83 ef 01             	sub    $0x1,%edi
    1451:	6a 01                	push   $0x1
    1453:	53                   	push   %ebx
    1454:	56                   	push   %esi
    1455:	88 45 d7             	mov    %al,-0x29(%ebp)
    1458:	e8 f5 fe ff ff       	call   1352 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    145d:	83 c4 10             	add    $0x10,%esp
    1460:	39 df                	cmp    %ebx,%edi
    1462:	75 e4                	jne    1448 <printint+0x68>
    putc(fd, buf[i]);
}
    1464:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1467:	5b                   	pop    %ebx
    1468:	5e                   	pop    %esi
    1469:	5f                   	pop    %edi
    146a:	5d                   	pop    %ebp
    146b:	c3                   	ret    
    146c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    1470:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1472:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1479:	eb 8b                	jmp    1406 <printint+0x26>
    147b:	90                   	nop
    147c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001480 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1480:	55                   	push   %ebp
    1481:	89 e5                	mov    %esp,%ebp
    1483:	57                   	push   %edi
    1484:	56                   	push   %esi
    1485:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1486:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1489:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    148c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    148f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1492:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1495:	0f b6 1e             	movzbl (%esi),%ebx
    1498:	83 c6 01             	add    $0x1,%esi
    149b:	84 db                	test   %bl,%bl
    149d:	0f 84 b0 00 00 00    	je     1553 <printf+0xd3>
    14a3:	31 d2                	xor    %edx,%edx
    14a5:	eb 39                	jmp    14e0 <printf+0x60>
    14a7:	89 f6                	mov    %esi,%esi
    14a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    14b0:	83 f8 25             	cmp    $0x25,%eax
    14b3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    14b6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    14bb:	74 18                	je     14d5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14bd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    14c0:	83 ec 04             	sub    $0x4,%esp
    14c3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    14c6:	6a 01                	push   $0x1
    14c8:	50                   	push   %eax
    14c9:	57                   	push   %edi
    14ca:	e8 83 fe ff ff       	call   1352 <write>
    14cf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    14d2:	83 c4 10             	add    $0x10,%esp
    14d5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14d8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    14dc:	84 db                	test   %bl,%bl
    14de:	74 73                	je     1553 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    14e0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    14e2:	0f be cb             	movsbl %bl,%ecx
    14e5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    14e8:	74 c6                	je     14b0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    14ea:	83 fa 25             	cmp    $0x25,%edx
    14ed:	75 e6                	jne    14d5 <printf+0x55>
      if(c == 'd'){
    14ef:	83 f8 64             	cmp    $0x64,%eax
    14f2:	0f 84 f8 00 00 00    	je     15f0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    14f8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    14fe:	83 f9 70             	cmp    $0x70,%ecx
    1501:	74 5d                	je     1560 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1503:	83 f8 73             	cmp    $0x73,%eax
    1506:	0f 84 84 00 00 00    	je     1590 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    150c:	83 f8 63             	cmp    $0x63,%eax
    150f:	0f 84 ea 00 00 00    	je     15ff <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1515:	83 f8 25             	cmp    $0x25,%eax
    1518:	0f 84 c2 00 00 00    	je     15e0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    151e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1521:	83 ec 04             	sub    $0x4,%esp
    1524:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1528:	6a 01                	push   $0x1
    152a:	50                   	push   %eax
    152b:	57                   	push   %edi
    152c:	e8 21 fe ff ff       	call   1352 <write>
    1531:	83 c4 0c             	add    $0xc,%esp
    1534:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1537:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    153a:	6a 01                	push   $0x1
    153c:	50                   	push   %eax
    153d:	57                   	push   %edi
    153e:	83 c6 01             	add    $0x1,%esi
    1541:	e8 0c fe ff ff       	call   1352 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1546:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    154a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    154d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    154f:	84 db                	test   %bl,%bl
    1551:	75 8d                	jne    14e0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1553:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1556:	5b                   	pop    %ebx
    1557:	5e                   	pop    %esi
    1558:	5f                   	pop    %edi
    1559:	5d                   	pop    %ebp
    155a:	c3                   	ret    
    155b:	90                   	nop
    155c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    1560:	83 ec 0c             	sub    $0xc,%esp
    1563:	b9 10 00 00 00       	mov    $0x10,%ecx
    1568:	6a 00                	push   $0x0
    156a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    156d:	89 f8                	mov    %edi,%eax
    156f:	8b 13                	mov    (%ebx),%edx
    1571:	e8 6a fe ff ff       	call   13e0 <printint>
        ap++;
    1576:	89 d8                	mov    %ebx,%eax
    1578:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    157b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    157d:	83 c0 04             	add    $0x4,%eax
    1580:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1583:	e9 4d ff ff ff       	jmp    14d5 <printf+0x55>
    1588:	90                   	nop
    1589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    1590:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1593:	8b 18                	mov    (%eax),%ebx
        ap++;
    1595:	83 c0 04             	add    $0x4,%eax
    1598:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    159b:	b8 f0 17 00 00       	mov    $0x17f0,%eax
    15a0:	85 db                	test   %ebx,%ebx
    15a2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    15a5:	0f b6 03             	movzbl (%ebx),%eax
    15a8:	84 c0                	test   %al,%al
    15aa:	74 23                	je     15cf <printf+0x14f>
    15ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15b0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15b3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    15b6:	83 ec 04             	sub    $0x4,%esp
    15b9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    15bb:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15be:	50                   	push   %eax
    15bf:	57                   	push   %edi
    15c0:	e8 8d fd ff ff       	call   1352 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    15c5:	0f b6 03             	movzbl (%ebx),%eax
    15c8:	83 c4 10             	add    $0x10,%esp
    15cb:	84 c0                	test   %al,%al
    15cd:	75 e1                	jne    15b0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    15cf:	31 d2                	xor    %edx,%edx
    15d1:	e9 ff fe ff ff       	jmp    14d5 <printf+0x55>
    15d6:	8d 76 00             	lea    0x0(%esi),%esi
    15d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15e0:	83 ec 04             	sub    $0x4,%esp
    15e3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    15e6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    15e9:	6a 01                	push   $0x1
    15eb:	e9 4c ff ff ff       	jmp    153c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    15f0:	83 ec 0c             	sub    $0xc,%esp
    15f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    15f8:	6a 01                	push   $0x1
    15fa:	e9 6b ff ff ff       	jmp    156a <printf+0xea>
    15ff:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1602:	83 ec 04             	sub    $0x4,%esp
    1605:	8b 03                	mov    (%ebx),%eax
    1607:	6a 01                	push   $0x1
    1609:	88 45 e4             	mov    %al,-0x1c(%ebp)
    160c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    160f:	50                   	push   %eax
    1610:	57                   	push   %edi
    1611:	e8 3c fd ff ff       	call   1352 <write>
    1616:	e9 5b ff ff ff       	jmp    1576 <printf+0xf6>
    161b:	66 90                	xchg   %ax,%ax
    161d:	66 90                	xchg   %ax,%ax
    161f:	90                   	nop

00001620 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1620:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1621:	a1 9c 1a 00 00       	mov    0x1a9c,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    1626:	89 e5                	mov    %esp,%ebp
    1628:	57                   	push   %edi
    1629:	56                   	push   %esi
    162a:	53                   	push   %ebx
    162b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    162e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1630:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1633:	39 c8                	cmp    %ecx,%eax
    1635:	73 19                	jae    1650 <free+0x30>
    1637:	89 f6                	mov    %esi,%esi
    1639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1640:	39 d1                	cmp    %edx,%ecx
    1642:	72 1c                	jb     1660 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1644:	39 d0                	cmp    %edx,%eax
    1646:	73 18                	jae    1660 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    1648:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    164a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    164c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    164e:	72 f0                	jb     1640 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1650:	39 d0                	cmp    %edx,%eax
    1652:	72 f4                	jb     1648 <free+0x28>
    1654:	39 d1                	cmp    %edx,%ecx
    1656:	73 f0                	jae    1648 <free+0x28>
    1658:	90                   	nop
    1659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    1660:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1663:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1666:	39 d7                	cmp    %edx,%edi
    1668:	74 19                	je     1683 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    166a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    166d:	8b 50 04             	mov    0x4(%eax),%edx
    1670:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1673:	39 f1                	cmp    %esi,%ecx
    1675:	74 23                	je     169a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1677:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1679:	a3 9c 1a 00 00       	mov    %eax,0x1a9c
}
    167e:	5b                   	pop    %ebx
    167f:	5e                   	pop    %esi
    1680:	5f                   	pop    %edi
    1681:	5d                   	pop    %ebp
    1682:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    1683:	03 72 04             	add    0x4(%edx),%esi
    1686:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1689:	8b 10                	mov    (%eax),%edx
    168b:	8b 12                	mov    (%edx),%edx
    168d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1690:	8b 50 04             	mov    0x4(%eax),%edx
    1693:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1696:	39 f1                	cmp    %esi,%ecx
    1698:	75 dd                	jne    1677 <free+0x57>
    p->s.size += bp->s.size;
    169a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    169d:	a3 9c 1a 00 00       	mov    %eax,0x1a9c
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    16a2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16a5:	8b 53 f8             	mov    -0x8(%ebx),%edx
    16a8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    16aa:	5b                   	pop    %ebx
    16ab:	5e                   	pop    %esi
    16ac:	5f                   	pop    %edi
    16ad:	5d                   	pop    %ebp
    16ae:	c3                   	ret    
    16af:	90                   	nop

000016b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    16b0:	55                   	push   %ebp
    16b1:	89 e5                	mov    %esp,%ebp
    16b3:	57                   	push   %edi
    16b4:	56                   	push   %esi
    16b5:	53                   	push   %ebx
    16b6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    16bc:	8b 15 9c 1a 00 00    	mov    0x1a9c,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16c2:	8d 78 07             	lea    0x7(%eax),%edi
    16c5:	c1 ef 03             	shr    $0x3,%edi
    16c8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    16cb:	85 d2                	test   %edx,%edx
    16cd:	0f 84 a3 00 00 00    	je     1776 <malloc+0xc6>
    16d3:	8b 02                	mov    (%edx),%eax
    16d5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    16d8:	39 cf                	cmp    %ecx,%edi
    16da:	76 74                	jbe    1750 <malloc+0xa0>
    16dc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    16e2:	be 00 10 00 00       	mov    $0x1000,%esi
    16e7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    16ee:	0f 43 f7             	cmovae %edi,%esi
    16f1:	ba 00 80 00 00       	mov    $0x8000,%edx
    16f6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    16fc:	0f 46 da             	cmovbe %edx,%ebx
    16ff:	eb 10                	jmp    1711 <malloc+0x61>
    1701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1708:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    170a:	8b 48 04             	mov    0x4(%eax),%ecx
    170d:	39 cf                	cmp    %ecx,%edi
    170f:	76 3f                	jbe    1750 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1711:	39 05 9c 1a 00 00    	cmp    %eax,0x1a9c
    1717:	89 c2                	mov    %eax,%edx
    1719:	75 ed                	jne    1708 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    171b:	83 ec 0c             	sub    $0xc,%esp
    171e:	53                   	push   %ebx
    171f:	e8 96 fc ff ff       	call   13ba <sbrk>
  if(p == (char*)-1)
    1724:	83 c4 10             	add    $0x10,%esp
    1727:	83 f8 ff             	cmp    $0xffffffff,%eax
    172a:	74 1c                	je     1748 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    172c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    172f:	83 ec 0c             	sub    $0xc,%esp
    1732:	83 c0 08             	add    $0x8,%eax
    1735:	50                   	push   %eax
    1736:	e8 e5 fe ff ff       	call   1620 <free>
  return freep;
    173b:	8b 15 9c 1a 00 00    	mov    0x1a9c,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1741:	83 c4 10             	add    $0x10,%esp
    1744:	85 d2                	test   %edx,%edx
    1746:	75 c0                	jne    1708 <malloc+0x58>
        return 0;
    1748:	31 c0                	xor    %eax,%eax
    174a:	eb 1c                	jmp    1768 <malloc+0xb8>
    174c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1750:	39 cf                	cmp    %ecx,%edi
    1752:	74 1c                	je     1770 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1754:	29 f9                	sub    %edi,%ecx
    1756:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1759:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    175c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    175f:	89 15 9c 1a 00 00    	mov    %edx,0x1a9c
      return (void*)(p + 1);
    1765:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1768:	8d 65 f4             	lea    -0xc(%ebp),%esp
    176b:	5b                   	pop    %ebx
    176c:	5e                   	pop    %esi
    176d:	5f                   	pop    %edi
    176e:	5d                   	pop    %ebp
    176f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1770:	8b 08                	mov    (%eax),%ecx
    1772:	89 0a                	mov    %ecx,(%edx)
    1774:	eb e9                	jmp    175f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1776:	c7 05 9c 1a 00 00 a0 	movl   $0x1aa0,0x1a9c
    177d:	1a 00 00 
    1780:	c7 05 a0 1a 00 00 a0 	movl   $0x1aa0,0x1aa0
    1787:	1a 00 00 
    base.s.size = 0;
    178a:	b8 a0 1a 00 00       	mov    $0x1aa0,%eax
    178f:	c7 05 a4 1a 00 00 00 	movl   $0x0,0x1aa4
    1796:	00 00 00 
    1799:	e9 3e ff ff ff       	jmp    16dc <malloc+0x2c>
