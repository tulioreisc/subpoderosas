
_kill: formato do arquivo elf32-i386


Desmontagem da seção .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	57                   	push   %edi
    100e:	56                   	push   %esi
    100f:	53                   	push   %ebx
    1010:	51                   	push   %ecx
    1011:	bb 01 00 00 00       	mov    $0x1,%ebx
    1016:	83 ec 08             	sub    $0x8,%esp
    1019:	8b 31                	mov    (%ecx),%esi
    101b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
    101e:	83 fe 01             	cmp    $0x1,%esi
    1021:	7e 27                	jle    104a <main+0x4a>
    1023:	90                   	nop
    1024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
    1028:	83 ec 0c             	sub    $0xc,%esp
    102b:	ff 34 9f             	pushl  (%edi,%ebx,4)

  if(argc < 2){
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    102e:	83 c3 01             	add    $0x1,%ebx
    kill(atoi(argv[i]));
    1031:	e8 fa 01 00 00       	call   1230 <atoi>
    1036:	89 04 24             	mov    %eax,(%esp)
    1039:	e8 94 02 00 00       	call   12d2 <kill>

  if(argc < 2){
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    103e:	83 c4 10             	add    $0x10,%esp
    1041:	39 de                	cmp    %ebx,%esi
    1043:	75 e3                	jne    1028 <main+0x28>
    kill(atoi(argv[i]));
  exit();
    1045:	e8 58 02 00 00       	call   12a2 <exit>
main(int argc, char **argv)
{
  int i;

  if(argc < 2){
    printf(2, "usage: kill pid...\n");
    104a:	50                   	push   %eax
    104b:	50                   	push   %eax
    104c:	68 10 17 00 00       	push   $0x1710
    1051:	6a 02                	push   $0x2
    1053:	e8 98 03 00 00       	call   13f0 <printf>
    exit();
    1058:	e8 45 02 00 00       	call   12a2 <exit>
    105d:	66 90                	xchg   %ax,%ax
    105f:	90                   	nop

00001060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	53                   	push   %ebx
    1064:	8b 45 08             	mov    0x8(%ebp),%eax
    1067:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    106a:	89 c2                	mov    %eax,%edx
    106c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1070:	83 c1 01             	add    $0x1,%ecx
    1073:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1077:	83 c2 01             	add    $0x1,%edx
    107a:	84 db                	test   %bl,%bl
    107c:	88 5a ff             	mov    %bl,-0x1(%edx)
    107f:	75 ef                	jne    1070 <strcpy+0x10>
    ;
  return os;
}
    1081:	5b                   	pop    %ebx
    1082:	5d                   	pop    %ebp
    1083:	c3                   	ret    
    1084:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    108a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	56                   	push   %esi
    1094:	53                   	push   %ebx
    1095:	8b 55 08             	mov    0x8(%ebp),%edx
    1098:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    109b:	0f b6 02             	movzbl (%edx),%eax
    109e:	0f b6 19             	movzbl (%ecx),%ebx
    10a1:	84 c0                	test   %al,%al
    10a3:	75 1e                	jne    10c3 <strcmp+0x33>
    10a5:	eb 29                	jmp    10d0 <strcmp+0x40>
    10a7:	89 f6                	mov    %esi,%esi
    10a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    10b0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10b3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    10b6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10b9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    10bd:	84 c0                	test   %al,%al
    10bf:	74 0f                	je     10d0 <strcmp+0x40>
    10c1:	89 f1                	mov    %esi,%ecx
    10c3:	38 d8                	cmp    %bl,%al
    10c5:	74 e9                	je     10b0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    10c7:	29 d8                	sub    %ebx,%eax
}
    10c9:	5b                   	pop    %ebx
    10ca:	5e                   	pop    %esi
    10cb:	5d                   	pop    %ebp
    10cc:	c3                   	ret    
    10cd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10d0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    10d2:	29 d8                	sub    %ebx,%eax
}
    10d4:	5b                   	pop    %ebx
    10d5:	5e                   	pop    %esi
    10d6:	5d                   	pop    %ebp
    10d7:	c3                   	ret    
    10d8:	90                   	nop
    10d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000010e0 <strlen>:

uint
strlen(char *s)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    10e6:	80 39 00             	cmpb   $0x0,(%ecx)
    10e9:	74 12                	je     10fd <strlen+0x1d>
    10eb:	31 d2                	xor    %edx,%edx
    10ed:	8d 76 00             	lea    0x0(%esi),%esi
    10f0:	83 c2 01             	add    $0x1,%edx
    10f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    10f7:	89 d0                	mov    %edx,%eax
    10f9:	75 f5                	jne    10f0 <strlen+0x10>
    ;
  return n;
}
    10fb:	5d                   	pop    %ebp
    10fc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    10fd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    10ff:	5d                   	pop    %ebp
    1100:	c3                   	ret    
    1101:	eb 0d                	jmp    1110 <memset>
    1103:	90                   	nop
    1104:	90                   	nop
    1105:	90                   	nop
    1106:	90                   	nop
    1107:	90                   	nop
    1108:	90                   	nop
    1109:	90                   	nop
    110a:	90                   	nop
    110b:	90                   	nop
    110c:	90                   	nop
    110d:	90                   	nop
    110e:	90                   	nop
    110f:	90                   	nop

00001110 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	57                   	push   %edi
    1114:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1117:	8b 4d 10             	mov    0x10(%ebp),%ecx
    111a:	8b 45 0c             	mov    0xc(%ebp),%eax
    111d:	89 d7                	mov    %edx,%edi
    111f:	fc                   	cld    
    1120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1122:	89 d0                	mov    %edx,%eax
    1124:	5f                   	pop    %edi
    1125:	5d                   	pop    %ebp
    1126:	c3                   	ret    
    1127:	89 f6                	mov    %esi,%esi
    1129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001130 <strchr>:

char*
strchr(const char *s, char c)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	53                   	push   %ebx
    1134:	8b 45 08             	mov    0x8(%ebp),%eax
    1137:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    113a:	0f b6 10             	movzbl (%eax),%edx
    113d:	84 d2                	test   %dl,%dl
    113f:	74 1d                	je     115e <strchr+0x2e>
    if(*s == c)
    1141:	38 d3                	cmp    %dl,%bl
    1143:	89 d9                	mov    %ebx,%ecx
    1145:	75 0d                	jne    1154 <strchr+0x24>
    1147:	eb 17                	jmp    1160 <strchr+0x30>
    1149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1150:	38 ca                	cmp    %cl,%dl
    1152:	74 0c                	je     1160 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1154:	83 c0 01             	add    $0x1,%eax
    1157:	0f b6 10             	movzbl (%eax),%edx
    115a:	84 d2                	test   %dl,%dl
    115c:	75 f2                	jne    1150 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    115e:	31 c0                	xor    %eax,%eax
}
    1160:	5b                   	pop    %ebx
    1161:	5d                   	pop    %ebp
    1162:	c3                   	ret    
    1163:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001170 <gets>:

char*
gets(char *buf, int max)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	57                   	push   %edi
    1174:	56                   	push   %esi
    1175:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1176:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    1178:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    117b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    117e:	eb 29                	jmp    11a9 <gets+0x39>
    cc = read(0, &c, 1);
    1180:	83 ec 04             	sub    $0x4,%esp
    1183:	6a 01                	push   $0x1
    1185:	57                   	push   %edi
    1186:	6a 00                	push   $0x0
    1188:	e8 2d 01 00 00       	call   12ba <read>
    if(cc < 1)
    118d:	83 c4 10             	add    $0x10,%esp
    1190:	85 c0                	test   %eax,%eax
    1192:	7e 1d                	jle    11b1 <gets+0x41>
      break;
    buf[i++] = c;
    1194:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1198:	8b 55 08             	mov    0x8(%ebp),%edx
    119b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    119d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    119f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    11a3:	74 1b                	je     11c0 <gets+0x50>
    11a5:	3c 0d                	cmp    $0xd,%al
    11a7:	74 17                	je     11c0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11a9:	8d 5e 01             	lea    0x1(%esi),%ebx
    11ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11af:	7c cf                	jl     1180 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    11b1:	8b 45 08             	mov    0x8(%ebp),%eax
    11b4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    11b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11bb:	5b                   	pop    %ebx
    11bc:	5e                   	pop    %esi
    11bd:	5f                   	pop    %edi
    11be:	5d                   	pop    %ebp
    11bf:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    11c0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11c3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    11c5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    11c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11cc:	5b                   	pop    %ebx
    11cd:	5e                   	pop    %esi
    11ce:	5f                   	pop    %edi
    11cf:	5d                   	pop    %ebp
    11d0:	c3                   	ret    
    11d1:	eb 0d                	jmp    11e0 <stat>
    11d3:	90                   	nop
    11d4:	90                   	nop
    11d5:	90                   	nop
    11d6:	90                   	nop
    11d7:	90                   	nop
    11d8:	90                   	nop
    11d9:	90                   	nop
    11da:	90                   	nop
    11db:	90                   	nop
    11dc:	90                   	nop
    11dd:	90                   	nop
    11de:	90                   	nop
    11df:	90                   	nop

000011e0 <stat>:

int
stat(char *n, struct stat *st)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	56                   	push   %esi
    11e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11e5:	83 ec 08             	sub    $0x8,%esp
    11e8:	6a 00                	push   $0x0
    11ea:	ff 75 08             	pushl  0x8(%ebp)
    11ed:	e8 f0 00 00 00       	call   12e2 <open>
  if(fd < 0)
    11f2:	83 c4 10             	add    $0x10,%esp
    11f5:	85 c0                	test   %eax,%eax
    11f7:	78 27                	js     1220 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    11f9:	83 ec 08             	sub    $0x8,%esp
    11fc:	ff 75 0c             	pushl  0xc(%ebp)
    11ff:	89 c3                	mov    %eax,%ebx
    1201:	50                   	push   %eax
    1202:	e8 f3 00 00 00       	call   12fa <fstat>
    1207:	89 c6                	mov    %eax,%esi
  close(fd);
    1209:	89 1c 24             	mov    %ebx,(%esp)
    120c:	e8 b9 00 00 00       	call   12ca <close>
  return r;
    1211:	83 c4 10             	add    $0x10,%esp
    1214:	89 f0                	mov    %esi,%eax
}
    1216:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1219:	5b                   	pop    %ebx
    121a:	5e                   	pop    %esi
    121b:	5d                   	pop    %ebp
    121c:	c3                   	ret    
    121d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    1220:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1225:	eb ef                	jmp    1216 <stat+0x36>
    1227:	89 f6                	mov    %esi,%esi
    1229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001230 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	53                   	push   %ebx
    1234:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1237:	0f be 11             	movsbl (%ecx),%edx
    123a:	8d 42 d0             	lea    -0x30(%edx),%eax
    123d:	3c 09                	cmp    $0x9,%al
    123f:	b8 00 00 00 00       	mov    $0x0,%eax
    1244:	77 1f                	ja     1265 <atoi+0x35>
    1246:	8d 76 00             	lea    0x0(%esi),%esi
    1249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1250:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1253:	83 c1 01             	add    $0x1,%ecx
    1256:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    125a:	0f be 11             	movsbl (%ecx),%edx
    125d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1260:	80 fb 09             	cmp    $0x9,%bl
    1263:	76 eb                	jbe    1250 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    1265:	5b                   	pop    %ebx
    1266:	5d                   	pop    %ebp
    1267:	c3                   	ret    
    1268:	90                   	nop
    1269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001270 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1270:	55                   	push   %ebp
    1271:	89 e5                	mov    %esp,%ebp
    1273:	56                   	push   %esi
    1274:	53                   	push   %ebx
    1275:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1278:	8b 45 08             	mov    0x8(%ebp),%eax
    127b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    127e:	85 db                	test   %ebx,%ebx
    1280:	7e 14                	jle    1296 <memmove+0x26>
    1282:	31 d2                	xor    %edx,%edx
    1284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1288:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    128c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    128f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1292:	39 da                	cmp    %ebx,%edx
    1294:	75 f2                	jne    1288 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    1296:	5b                   	pop    %ebx
    1297:	5e                   	pop    %esi
    1298:	5d                   	pop    %ebp
    1299:	c3                   	ret    

0000129a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    129a:	b8 01 00 00 00       	mov    $0x1,%eax
    129f:	cd 40                	int    $0x40
    12a1:	c3                   	ret    

000012a2 <exit>:
SYSCALL(exit)
    12a2:	b8 02 00 00 00       	mov    $0x2,%eax
    12a7:	cd 40                	int    $0x40
    12a9:	c3                   	ret    

000012aa <wait>:
SYSCALL(wait)
    12aa:	b8 03 00 00 00       	mov    $0x3,%eax
    12af:	cd 40                	int    $0x40
    12b1:	c3                   	ret    

000012b2 <pipe>:
SYSCALL(pipe)
    12b2:	b8 04 00 00 00       	mov    $0x4,%eax
    12b7:	cd 40                	int    $0x40
    12b9:	c3                   	ret    

000012ba <read>:
SYSCALL(read)
    12ba:	b8 05 00 00 00       	mov    $0x5,%eax
    12bf:	cd 40                	int    $0x40
    12c1:	c3                   	ret    

000012c2 <write>:
SYSCALL(write)
    12c2:	b8 10 00 00 00       	mov    $0x10,%eax
    12c7:	cd 40                	int    $0x40
    12c9:	c3                   	ret    

000012ca <close>:
SYSCALL(close)
    12ca:	b8 15 00 00 00       	mov    $0x15,%eax
    12cf:	cd 40                	int    $0x40
    12d1:	c3                   	ret    

000012d2 <kill>:
SYSCALL(kill)
    12d2:	b8 06 00 00 00       	mov    $0x6,%eax
    12d7:	cd 40                	int    $0x40
    12d9:	c3                   	ret    

000012da <exec>:
SYSCALL(exec)
    12da:	b8 07 00 00 00       	mov    $0x7,%eax
    12df:	cd 40                	int    $0x40
    12e1:	c3                   	ret    

000012e2 <open>:
SYSCALL(open)
    12e2:	b8 0f 00 00 00       	mov    $0xf,%eax
    12e7:	cd 40                	int    $0x40
    12e9:	c3                   	ret    

000012ea <mknod>:
SYSCALL(mknod)
    12ea:	b8 11 00 00 00       	mov    $0x11,%eax
    12ef:	cd 40                	int    $0x40
    12f1:	c3                   	ret    

000012f2 <unlink>:
SYSCALL(unlink)
    12f2:	b8 12 00 00 00       	mov    $0x12,%eax
    12f7:	cd 40                	int    $0x40
    12f9:	c3                   	ret    

000012fa <fstat>:
SYSCALL(fstat)
    12fa:	b8 08 00 00 00       	mov    $0x8,%eax
    12ff:	cd 40                	int    $0x40
    1301:	c3                   	ret    

00001302 <link>:
SYSCALL(link)
    1302:	b8 13 00 00 00       	mov    $0x13,%eax
    1307:	cd 40                	int    $0x40
    1309:	c3                   	ret    

0000130a <mkdir>:
SYSCALL(mkdir)
    130a:	b8 14 00 00 00       	mov    $0x14,%eax
    130f:	cd 40                	int    $0x40
    1311:	c3                   	ret    

00001312 <chdir>:
SYSCALL(chdir)
    1312:	b8 09 00 00 00       	mov    $0x9,%eax
    1317:	cd 40                	int    $0x40
    1319:	c3                   	ret    

0000131a <dup>:
SYSCALL(dup)
    131a:	b8 0a 00 00 00       	mov    $0xa,%eax
    131f:	cd 40                	int    $0x40
    1321:	c3                   	ret    

00001322 <getpid>:
SYSCALL(getpid)
    1322:	b8 0b 00 00 00       	mov    $0xb,%eax
    1327:	cd 40                	int    $0x40
    1329:	c3                   	ret    

0000132a <sbrk>:
SYSCALL(sbrk)
    132a:	b8 0c 00 00 00       	mov    $0xc,%eax
    132f:	cd 40                	int    $0x40
    1331:	c3                   	ret    

00001332 <sleep>:
SYSCALL(sleep)
    1332:	b8 0d 00 00 00       	mov    $0xd,%eax
    1337:	cd 40                	int    $0x40
    1339:	c3                   	ret    

0000133a <uptime>:
SYSCALL(uptime)
    133a:	b8 0e 00 00 00       	mov    $0xe,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    
    1342:	66 90                	xchg   %ax,%ax
    1344:	66 90                	xchg   %ax,%ax
    1346:	66 90                	xchg   %ax,%ax
    1348:	66 90                	xchg   %ax,%ax
    134a:	66 90                	xchg   %ax,%ax
    134c:	66 90                	xchg   %ax,%ax
    134e:	66 90                	xchg   %ax,%ax

00001350 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1350:	55                   	push   %ebp
    1351:	89 e5                	mov    %esp,%ebp
    1353:	57                   	push   %edi
    1354:	56                   	push   %esi
    1355:	53                   	push   %ebx
    1356:	89 c6                	mov    %eax,%esi
    1358:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    135b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    135e:	85 db                	test   %ebx,%ebx
    1360:	74 7e                	je     13e0 <printint+0x90>
    1362:	89 d0                	mov    %edx,%eax
    1364:	c1 e8 1f             	shr    $0x1f,%eax
    1367:	84 c0                	test   %al,%al
    1369:	74 75                	je     13e0 <printint+0x90>
    neg = 1;
    x = -xx;
    136b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    136d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    1374:	f7 d8                	neg    %eax
    1376:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1379:	31 ff                	xor    %edi,%edi
    137b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    137e:	89 ce                	mov    %ecx,%esi
    1380:	eb 08                	jmp    138a <printint+0x3a>
    1382:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1388:	89 cf                	mov    %ecx,%edi
    138a:	31 d2                	xor    %edx,%edx
    138c:	8d 4f 01             	lea    0x1(%edi),%ecx
    138f:	f7 f6                	div    %esi
    1391:	0f b6 92 2c 17 00 00 	movzbl 0x172c(%edx),%edx
  }while((x /= base) != 0);
    1398:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    139a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    139d:	75 e9                	jne    1388 <printint+0x38>
  if(neg)
    139f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    13a2:	8b 75 c0             	mov    -0x40(%ebp),%esi
    13a5:	85 c0                	test   %eax,%eax
    13a7:	74 08                	je     13b1 <printint+0x61>
    buf[i++] = '-';
    13a9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    13ae:	8d 4f 02             	lea    0x2(%edi),%ecx
    13b1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    13b5:	8d 76 00             	lea    0x0(%esi),%esi
    13b8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    13bb:	83 ec 04             	sub    $0x4,%esp
    13be:	83 ef 01             	sub    $0x1,%edi
    13c1:	6a 01                	push   $0x1
    13c3:	53                   	push   %ebx
    13c4:	56                   	push   %esi
    13c5:	88 45 d7             	mov    %al,-0x29(%ebp)
    13c8:	e8 f5 fe ff ff       	call   12c2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    13cd:	83 c4 10             	add    $0x10,%esp
    13d0:	39 df                	cmp    %ebx,%edi
    13d2:	75 e4                	jne    13b8 <printint+0x68>
    putc(fd, buf[i]);
}
    13d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13d7:	5b                   	pop    %ebx
    13d8:	5e                   	pop    %esi
    13d9:	5f                   	pop    %edi
    13da:	5d                   	pop    %ebp
    13db:	c3                   	ret    
    13dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    13e0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    13e2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    13e9:	eb 8b                	jmp    1376 <printint+0x26>
    13eb:	90                   	nop
    13ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000013f0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	57                   	push   %edi
    13f4:	56                   	push   %esi
    13f5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13f6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    13f9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13fc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    13ff:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1402:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1405:	0f b6 1e             	movzbl (%esi),%ebx
    1408:	83 c6 01             	add    $0x1,%esi
    140b:	84 db                	test   %bl,%bl
    140d:	0f 84 b0 00 00 00    	je     14c3 <printf+0xd3>
    1413:	31 d2                	xor    %edx,%edx
    1415:	eb 39                	jmp    1450 <printf+0x60>
    1417:	89 f6                	mov    %esi,%esi
    1419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1420:	83 f8 25             	cmp    $0x25,%eax
    1423:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    1426:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    142b:	74 18                	je     1445 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    142d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1430:	83 ec 04             	sub    $0x4,%esp
    1433:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    1436:	6a 01                	push   $0x1
    1438:	50                   	push   %eax
    1439:	57                   	push   %edi
    143a:	e8 83 fe ff ff       	call   12c2 <write>
    143f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1442:	83 c4 10             	add    $0x10,%esp
    1445:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1448:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    144c:	84 db                	test   %bl,%bl
    144e:	74 73                	je     14c3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    1450:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    1452:	0f be cb             	movsbl %bl,%ecx
    1455:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1458:	74 c6                	je     1420 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    145a:	83 fa 25             	cmp    $0x25,%edx
    145d:	75 e6                	jne    1445 <printf+0x55>
      if(c == 'd'){
    145f:	83 f8 64             	cmp    $0x64,%eax
    1462:	0f 84 f8 00 00 00    	je     1560 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1468:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    146e:	83 f9 70             	cmp    $0x70,%ecx
    1471:	74 5d                	je     14d0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1473:	83 f8 73             	cmp    $0x73,%eax
    1476:	0f 84 84 00 00 00    	je     1500 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    147c:	83 f8 63             	cmp    $0x63,%eax
    147f:	0f 84 ea 00 00 00    	je     156f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1485:	83 f8 25             	cmp    $0x25,%eax
    1488:	0f 84 c2 00 00 00    	je     1550 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    148e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1491:	83 ec 04             	sub    $0x4,%esp
    1494:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1498:	6a 01                	push   $0x1
    149a:	50                   	push   %eax
    149b:	57                   	push   %edi
    149c:	e8 21 fe ff ff       	call   12c2 <write>
    14a1:	83 c4 0c             	add    $0xc,%esp
    14a4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    14a7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    14aa:	6a 01                	push   $0x1
    14ac:	50                   	push   %eax
    14ad:	57                   	push   %edi
    14ae:	83 c6 01             	add    $0x1,%esi
    14b1:	e8 0c fe ff ff       	call   12c2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14b6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14ba:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    14bd:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14bf:	84 db                	test   %bl,%bl
    14c1:	75 8d                	jne    1450 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    14c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14c6:	5b                   	pop    %ebx
    14c7:	5e                   	pop    %esi
    14c8:	5f                   	pop    %edi
    14c9:	5d                   	pop    %ebp
    14ca:	c3                   	ret    
    14cb:	90                   	nop
    14cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    14d0:	83 ec 0c             	sub    $0xc,%esp
    14d3:	b9 10 00 00 00       	mov    $0x10,%ecx
    14d8:	6a 00                	push   $0x0
    14da:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    14dd:	89 f8                	mov    %edi,%eax
    14df:	8b 13                	mov    (%ebx),%edx
    14e1:	e8 6a fe ff ff       	call   1350 <printint>
        ap++;
    14e6:	89 d8                	mov    %ebx,%eax
    14e8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    14eb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    14ed:	83 c0 04             	add    $0x4,%eax
    14f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14f3:	e9 4d ff ff ff       	jmp    1445 <printf+0x55>
    14f8:	90                   	nop
    14f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    1500:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1503:	8b 18                	mov    (%eax),%ebx
        ap++;
    1505:	83 c0 04             	add    $0x4,%eax
    1508:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    150b:	b8 24 17 00 00       	mov    $0x1724,%eax
    1510:	85 db                	test   %ebx,%ebx
    1512:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    1515:	0f b6 03             	movzbl (%ebx),%eax
    1518:	84 c0                	test   %al,%al
    151a:	74 23                	je     153f <printf+0x14f>
    151c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1520:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1523:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1526:	83 ec 04             	sub    $0x4,%esp
    1529:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    152b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    152e:	50                   	push   %eax
    152f:	57                   	push   %edi
    1530:	e8 8d fd ff ff       	call   12c2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1535:	0f b6 03             	movzbl (%ebx),%eax
    1538:	83 c4 10             	add    $0x10,%esp
    153b:	84 c0                	test   %al,%al
    153d:	75 e1                	jne    1520 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    153f:	31 d2                	xor    %edx,%edx
    1541:	e9 ff fe ff ff       	jmp    1445 <printf+0x55>
    1546:	8d 76 00             	lea    0x0(%esi),%esi
    1549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1550:	83 ec 04             	sub    $0x4,%esp
    1553:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    1556:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1559:	6a 01                	push   $0x1
    155b:	e9 4c ff ff ff       	jmp    14ac <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    1560:	83 ec 0c             	sub    $0xc,%esp
    1563:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1568:	6a 01                	push   $0x1
    156a:	e9 6b ff ff ff       	jmp    14da <printf+0xea>
    156f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1572:	83 ec 04             	sub    $0x4,%esp
    1575:	8b 03                	mov    (%ebx),%eax
    1577:	6a 01                	push   $0x1
    1579:	88 45 e4             	mov    %al,-0x1c(%ebp)
    157c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    157f:	50                   	push   %eax
    1580:	57                   	push   %edi
    1581:	e8 3c fd ff ff       	call   12c2 <write>
    1586:	e9 5b ff ff ff       	jmp    14e6 <printf+0xf6>
    158b:	66 90                	xchg   %ax,%ax
    158d:	66 90                	xchg   %ax,%ax
    158f:	90                   	nop

00001590 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1590:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1591:	a1 d0 29 00 00       	mov    0x29d0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    1596:	89 e5                	mov    %esp,%ebp
    1598:	57                   	push   %edi
    1599:	56                   	push   %esi
    159a:	53                   	push   %ebx
    159b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    159e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    15a0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15a3:	39 c8                	cmp    %ecx,%eax
    15a5:	73 19                	jae    15c0 <free+0x30>
    15a7:	89 f6                	mov    %esi,%esi
    15a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    15b0:	39 d1                	cmp    %edx,%ecx
    15b2:	72 1c                	jb     15d0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15b4:	39 d0                	cmp    %edx,%eax
    15b6:	73 18                	jae    15d0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    15b8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15ba:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15bc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15be:	72 f0                	jb     15b0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15c0:	39 d0                	cmp    %edx,%eax
    15c2:	72 f4                	jb     15b8 <free+0x28>
    15c4:	39 d1                	cmp    %edx,%ecx
    15c6:	73 f0                	jae    15b8 <free+0x28>
    15c8:	90                   	nop
    15c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    15d0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15d3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    15d6:	39 d7                	cmp    %edx,%edi
    15d8:	74 19                	je     15f3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    15da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    15dd:	8b 50 04             	mov    0x4(%eax),%edx
    15e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    15e3:	39 f1                	cmp    %esi,%ecx
    15e5:	74 23                	je     160a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    15e7:	89 08                	mov    %ecx,(%eax)
  freep = p;
    15e9:	a3 d0 29 00 00       	mov    %eax,0x29d0
}
    15ee:	5b                   	pop    %ebx
    15ef:	5e                   	pop    %esi
    15f0:	5f                   	pop    %edi
    15f1:	5d                   	pop    %ebp
    15f2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    15f3:	03 72 04             	add    0x4(%edx),%esi
    15f6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    15f9:	8b 10                	mov    (%eax),%edx
    15fb:	8b 12                	mov    (%edx),%edx
    15fd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1600:	8b 50 04             	mov    0x4(%eax),%edx
    1603:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1606:	39 f1                	cmp    %esi,%ecx
    1608:	75 dd                	jne    15e7 <free+0x57>
    p->s.size += bp->s.size;
    160a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    160d:	a3 d0 29 00 00       	mov    %eax,0x29d0
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    1612:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1615:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1618:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    161a:	5b                   	pop    %ebx
    161b:	5e                   	pop    %esi
    161c:	5f                   	pop    %edi
    161d:	5d                   	pop    %ebp
    161e:	c3                   	ret    
    161f:	90                   	nop

00001620 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1620:	55                   	push   %ebp
    1621:	89 e5                	mov    %esp,%ebp
    1623:	57                   	push   %edi
    1624:	56                   	push   %esi
    1625:	53                   	push   %ebx
    1626:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1629:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    162c:	8b 15 d0 29 00 00    	mov    0x29d0,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1632:	8d 78 07             	lea    0x7(%eax),%edi
    1635:	c1 ef 03             	shr    $0x3,%edi
    1638:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    163b:	85 d2                	test   %edx,%edx
    163d:	0f 84 a3 00 00 00    	je     16e6 <malloc+0xc6>
    1643:	8b 02                	mov    (%edx),%eax
    1645:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1648:	39 cf                	cmp    %ecx,%edi
    164a:	76 74                	jbe    16c0 <malloc+0xa0>
    164c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1652:	be 00 10 00 00       	mov    $0x1000,%esi
    1657:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    165e:	0f 43 f7             	cmovae %edi,%esi
    1661:	ba 00 80 00 00       	mov    $0x8000,%edx
    1666:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    166c:	0f 46 da             	cmovbe %edx,%ebx
    166f:	eb 10                	jmp    1681 <malloc+0x61>
    1671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1678:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    167a:	8b 48 04             	mov    0x4(%eax),%ecx
    167d:	39 cf                	cmp    %ecx,%edi
    167f:	76 3f                	jbe    16c0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1681:	39 05 d0 29 00 00    	cmp    %eax,0x29d0
    1687:	89 c2                	mov    %eax,%edx
    1689:	75 ed                	jne    1678 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    168b:	83 ec 0c             	sub    $0xc,%esp
    168e:	53                   	push   %ebx
    168f:	e8 96 fc ff ff       	call   132a <sbrk>
  if(p == (char*)-1)
    1694:	83 c4 10             	add    $0x10,%esp
    1697:	83 f8 ff             	cmp    $0xffffffff,%eax
    169a:	74 1c                	je     16b8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    169c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    169f:	83 ec 0c             	sub    $0xc,%esp
    16a2:	83 c0 08             	add    $0x8,%eax
    16a5:	50                   	push   %eax
    16a6:	e8 e5 fe ff ff       	call   1590 <free>
  return freep;
    16ab:	8b 15 d0 29 00 00    	mov    0x29d0,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    16b1:	83 c4 10             	add    $0x10,%esp
    16b4:	85 d2                	test   %edx,%edx
    16b6:	75 c0                	jne    1678 <malloc+0x58>
        return 0;
    16b8:	31 c0                	xor    %eax,%eax
    16ba:	eb 1c                	jmp    16d8 <malloc+0xb8>
    16bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    16c0:	39 cf                	cmp    %ecx,%edi
    16c2:	74 1c                	je     16e0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    16c4:	29 f9                	sub    %edi,%ecx
    16c6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    16c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    16cc:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    16cf:	89 15 d0 29 00 00    	mov    %edx,0x29d0
      return (void*)(p + 1);
    16d5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    16d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    16db:	5b                   	pop    %ebx
    16dc:	5e                   	pop    %esi
    16dd:	5f                   	pop    %edi
    16de:	5d                   	pop    %ebp
    16df:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    16e0:	8b 08                	mov    (%eax),%ecx
    16e2:	89 0a                	mov    %ecx,(%edx)
    16e4:	eb e9                	jmp    16cf <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    16e6:	c7 05 d0 29 00 00 d4 	movl   $0x29d4,0x29d0
    16ed:	29 00 00 
    16f0:	c7 05 d4 29 00 00 d4 	movl   $0x29d4,0x29d4
    16f7:	29 00 00 
    base.s.size = 0;
    16fa:	b8 d4 29 00 00       	mov    $0x29d4,%eax
    16ff:	c7 05 d8 29 00 00 00 	movl   $0x0,0x29d8
    1706:	00 00 00 
    1709:	e9 3e ff ff ff       	jmp    164c <malloc+0x2c>
