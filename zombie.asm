
_zombie: formato do arquivo elf32-i386


Desmontagem da seção .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

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
  if(fork() > 0)
    1011:	e8 54 02 00 00       	call   126a <fork>
    1016:	85 c0                	test   %eax,%eax
    1018:	7e 0d                	jle    1027 <main+0x27>
    sleep(5);  // Let child exit before parent.
    101a:	83 ec 0c             	sub    $0xc,%esp
    101d:	6a 05                	push   $0x5
    101f:	e8 de 02 00 00       	call   1302 <sleep>
    1024:	83 c4 10             	add    $0x10,%esp
  exit();
    1027:	e8 46 02 00 00       	call   1272 <exit>
    102c:	66 90                	xchg   %ax,%ax
    102e:	66 90                	xchg   %ax,%ax

00001030 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1030:	55                   	push   %ebp
    1031:	89 e5                	mov    %esp,%ebp
    1033:	53                   	push   %ebx
    1034:	8b 45 08             	mov    0x8(%ebp),%eax
    1037:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    103a:	89 c2                	mov    %eax,%edx
    103c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1040:	83 c1 01             	add    $0x1,%ecx
    1043:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1047:	83 c2 01             	add    $0x1,%edx
    104a:	84 db                	test   %bl,%bl
    104c:	88 5a ff             	mov    %bl,-0x1(%edx)
    104f:	75 ef                	jne    1040 <strcpy+0x10>
    ;
  return os;
}
    1051:	5b                   	pop    %ebx
    1052:	5d                   	pop    %ebp
    1053:	c3                   	ret    
    1054:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    105a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	56                   	push   %esi
    1064:	53                   	push   %ebx
    1065:	8b 55 08             	mov    0x8(%ebp),%edx
    1068:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    106b:	0f b6 02             	movzbl (%edx),%eax
    106e:	0f b6 19             	movzbl (%ecx),%ebx
    1071:	84 c0                	test   %al,%al
    1073:	75 1e                	jne    1093 <strcmp+0x33>
    1075:	eb 29                	jmp    10a0 <strcmp+0x40>
    1077:	89 f6                	mov    %esi,%esi
    1079:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1080:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1083:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1086:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1089:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    108d:	84 c0                	test   %al,%al
    108f:	74 0f                	je     10a0 <strcmp+0x40>
    1091:	89 f1                	mov    %esi,%ecx
    1093:	38 d8                	cmp    %bl,%al
    1095:	74 e9                	je     1080 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1097:	29 d8                	sub    %ebx,%eax
}
    1099:	5b                   	pop    %ebx
    109a:	5e                   	pop    %esi
    109b:	5d                   	pop    %ebp
    109c:	c3                   	ret    
    109d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10a0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    10a2:	29 d8                	sub    %ebx,%eax
}
    10a4:	5b                   	pop    %ebx
    10a5:	5e                   	pop    %esi
    10a6:	5d                   	pop    %ebp
    10a7:	c3                   	ret    
    10a8:	90                   	nop
    10a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000010b0 <strlen>:

uint
strlen(char *s)
{
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    10b6:	80 39 00             	cmpb   $0x0,(%ecx)
    10b9:	74 12                	je     10cd <strlen+0x1d>
    10bb:	31 d2                	xor    %edx,%edx
    10bd:	8d 76 00             	lea    0x0(%esi),%esi
    10c0:	83 c2 01             	add    $0x1,%edx
    10c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    10c7:	89 d0                	mov    %edx,%eax
    10c9:	75 f5                	jne    10c0 <strlen+0x10>
    ;
  return n;
}
    10cb:	5d                   	pop    %ebp
    10cc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    10cd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    10cf:	5d                   	pop    %ebp
    10d0:	c3                   	ret    
    10d1:	eb 0d                	jmp    10e0 <memset>
    10d3:	90                   	nop
    10d4:	90                   	nop
    10d5:	90                   	nop
    10d6:	90                   	nop
    10d7:	90                   	nop
    10d8:	90                   	nop
    10d9:	90                   	nop
    10da:	90                   	nop
    10db:	90                   	nop
    10dc:	90                   	nop
    10dd:	90                   	nop
    10de:	90                   	nop
    10df:	90                   	nop

000010e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	57                   	push   %edi
    10e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    10e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    10ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    10ed:	89 d7                	mov    %edx,%edi
    10ef:	fc                   	cld    
    10f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    10f2:	89 d0                	mov    %edx,%eax
    10f4:	5f                   	pop    %edi
    10f5:	5d                   	pop    %ebp
    10f6:	c3                   	ret    
    10f7:	89 f6                	mov    %esi,%esi
    10f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001100 <strchr>:

char*
strchr(const char *s, char c)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	53                   	push   %ebx
    1104:	8b 45 08             	mov    0x8(%ebp),%eax
    1107:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    110a:	0f b6 10             	movzbl (%eax),%edx
    110d:	84 d2                	test   %dl,%dl
    110f:	74 1d                	je     112e <strchr+0x2e>
    if(*s == c)
    1111:	38 d3                	cmp    %dl,%bl
    1113:	89 d9                	mov    %ebx,%ecx
    1115:	75 0d                	jne    1124 <strchr+0x24>
    1117:	eb 17                	jmp    1130 <strchr+0x30>
    1119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1120:	38 ca                	cmp    %cl,%dl
    1122:	74 0c                	je     1130 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1124:	83 c0 01             	add    $0x1,%eax
    1127:	0f b6 10             	movzbl (%eax),%edx
    112a:	84 d2                	test   %dl,%dl
    112c:	75 f2                	jne    1120 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    112e:	31 c0                	xor    %eax,%eax
}
    1130:	5b                   	pop    %ebx
    1131:	5d                   	pop    %ebp
    1132:	c3                   	ret    
    1133:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001140 <gets>:

char*
gets(char *buf, int max)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	57                   	push   %edi
    1144:	56                   	push   %esi
    1145:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1146:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    1148:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    114b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    114e:	eb 29                	jmp    1179 <gets+0x39>
    cc = read(0, &c, 1);
    1150:	83 ec 04             	sub    $0x4,%esp
    1153:	6a 01                	push   $0x1
    1155:	57                   	push   %edi
    1156:	6a 00                	push   $0x0
    1158:	e8 2d 01 00 00       	call   128a <read>
    if(cc < 1)
    115d:	83 c4 10             	add    $0x10,%esp
    1160:	85 c0                	test   %eax,%eax
    1162:	7e 1d                	jle    1181 <gets+0x41>
      break;
    buf[i++] = c;
    1164:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1168:	8b 55 08             	mov    0x8(%ebp),%edx
    116b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    116d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    116f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    1173:	74 1b                	je     1190 <gets+0x50>
    1175:	3c 0d                	cmp    $0xd,%al
    1177:	74 17                	je     1190 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1179:	8d 5e 01             	lea    0x1(%esi),%ebx
    117c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    117f:	7c cf                	jl     1150 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1181:	8b 45 08             	mov    0x8(%ebp),%eax
    1184:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1188:	8d 65 f4             	lea    -0xc(%ebp),%esp
    118b:	5b                   	pop    %ebx
    118c:	5e                   	pop    %esi
    118d:	5f                   	pop    %edi
    118e:	5d                   	pop    %ebp
    118f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1190:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1193:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1195:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1199:	8d 65 f4             	lea    -0xc(%ebp),%esp
    119c:	5b                   	pop    %ebx
    119d:	5e                   	pop    %esi
    119e:	5f                   	pop    %edi
    119f:	5d                   	pop    %ebp
    11a0:	c3                   	ret    
    11a1:	eb 0d                	jmp    11b0 <stat>
    11a3:	90                   	nop
    11a4:	90                   	nop
    11a5:	90                   	nop
    11a6:	90                   	nop
    11a7:	90                   	nop
    11a8:	90                   	nop
    11a9:	90                   	nop
    11aa:	90                   	nop
    11ab:	90                   	nop
    11ac:	90                   	nop
    11ad:	90                   	nop
    11ae:	90                   	nop
    11af:	90                   	nop

000011b0 <stat>:

int
stat(char *n, struct stat *st)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	56                   	push   %esi
    11b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11b5:	83 ec 08             	sub    $0x8,%esp
    11b8:	6a 00                	push   $0x0
    11ba:	ff 75 08             	pushl  0x8(%ebp)
    11bd:	e8 f0 00 00 00       	call   12b2 <open>
  if(fd < 0)
    11c2:	83 c4 10             	add    $0x10,%esp
    11c5:	85 c0                	test   %eax,%eax
    11c7:	78 27                	js     11f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    11c9:	83 ec 08             	sub    $0x8,%esp
    11cc:	ff 75 0c             	pushl  0xc(%ebp)
    11cf:	89 c3                	mov    %eax,%ebx
    11d1:	50                   	push   %eax
    11d2:	e8 f3 00 00 00       	call   12ca <fstat>
    11d7:	89 c6                	mov    %eax,%esi
  close(fd);
    11d9:	89 1c 24             	mov    %ebx,(%esp)
    11dc:	e8 b9 00 00 00       	call   129a <close>
  return r;
    11e1:	83 c4 10             	add    $0x10,%esp
    11e4:	89 f0                	mov    %esi,%eax
}
    11e6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    11e9:	5b                   	pop    %ebx
    11ea:	5e                   	pop    %esi
    11eb:	5d                   	pop    %ebp
    11ec:	c3                   	ret    
    11ed:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    11f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    11f5:	eb ef                	jmp    11e6 <stat+0x36>
    11f7:	89 f6                	mov    %esi,%esi
    11f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001200 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	53                   	push   %ebx
    1204:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1207:	0f be 11             	movsbl (%ecx),%edx
    120a:	8d 42 d0             	lea    -0x30(%edx),%eax
    120d:	3c 09                	cmp    $0x9,%al
    120f:	b8 00 00 00 00       	mov    $0x0,%eax
    1214:	77 1f                	ja     1235 <atoi+0x35>
    1216:	8d 76 00             	lea    0x0(%esi),%esi
    1219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1220:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1223:	83 c1 01             	add    $0x1,%ecx
    1226:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    122a:	0f be 11             	movsbl (%ecx),%edx
    122d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1230:	80 fb 09             	cmp    $0x9,%bl
    1233:	76 eb                	jbe    1220 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    1235:	5b                   	pop    %ebx
    1236:	5d                   	pop    %ebp
    1237:	c3                   	ret    
    1238:	90                   	nop
    1239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001240 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	56                   	push   %esi
    1244:	53                   	push   %ebx
    1245:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1248:	8b 45 08             	mov    0x8(%ebp),%eax
    124b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    124e:	85 db                	test   %ebx,%ebx
    1250:	7e 14                	jle    1266 <memmove+0x26>
    1252:	31 d2                	xor    %edx,%edx
    1254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1258:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    125c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    125f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1262:	39 da                	cmp    %ebx,%edx
    1264:	75 f2                	jne    1258 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    1266:	5b                   	pop    %ebx
    1267:	5e                   	pop    %esi
    1268:	5d                   	pop    %ebp
    1269:	c3                   	ret    

0000126a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    126a:	b8 01 00 00 00       	mov    $0x1,%eax
    126f:	cd 40                	int    $0x40
    1271:	c3                   	ret    

00001272 <exit>:
SYSCALL(exit)
    1272:	b8 02 00 00 00       	mov    $0x2,%eax
    1277:	cd 40                	int    $0x40
    1279:	c3                   	ret    

0000127a <wait>:
SYSCALL(wait)
    127a:	b8 03 00 00 00       	mov    $0x3,%eax
    127f:	cd 40                	int    $0x40
    1281:	c3                   	ret    

00001282 <pipe>:
SYSCALL(pipe)
    1282:	b8 04 00 00 00       	mov    $0x4,%eax
    1287:	cd 40                	int    $0x40
    1289:	c3                   	ret    

0000128a <read>:
SYSCALL(read)
    128a:	b8 05 00 00 00       	mov    $0x5,%eax
    128f:	cd 40                	int    $0x40
    1291:	c3                   	ret    

00001292 <write>:
SYSCALL(write)
    1292:	b8 10 00 00 00       	mov    $0x10,%eax
    1297:	cd 40                	int    $0x40
    1299:	c3                   	ret    

0000129a <close>:
SYSCALL(close)
    129a:	b8 15 00 00 00       	mov    $0x15,%eax
    129f:	cd 40                	int    $0x40
    12a1:	c3                   	ret    

000012a2 <kill>:
SYSCALL(kill)
    12a2:	b8 06 00 00 00       	mov    $0x6,%eax
    12a7:	cd 40                	int    $0x40
    12a9:	c3                   	ret    

000012aa <exec>:
SYSCALL(exec)
    12aa:	b8 07 00 00 00       	mov    $0x7,%eax
    12af:	cd 40                	int    $0x40
    12b1:	c3                   	ret    

000012b2 <open>:
SYSCALL(open)
    12b2:	b8 0f 00 00 00       	mov    $0xf,%eax
    12b7:	cd 40                	int    $0x40
    12b9:	c3                   	ret    

000012ba <mknod>:
SYSCALL(mknod)
    12ba:	b8 11 00 00 00       	mov    $0x11,%eax
    12bf:	cd 40                	int    $0x40
    12c1:	c3                   	ret    

000012c2 <unlink>:
SYSCALL(unlink)
    12c2:	b8 12 00 00 00       	mov    $0x12,%eax
    12c7:	cd 40                	int    $0x40
    12c9:	c3                   	ret    

000012ca <fstat>:
SYSCALL(fstat)
    12ca:	b8 08 00 00 00       	mov    $0x8,%eax
    12cf:	cd 40                	int    $0x40
    12d1:	c3                   	ret    

000012d2 <link>:
SYSCALL(link)
    12d2:	b8 13 00 00 00       	mov    $0x13,%eax
    12d7:	cd 40                	int    $0x40
    12d9:	c3                   	ret    

000012da <mkdir>:
SYSCALL(mkdir)
    12da:	b8 14 00 00 00       	mov    $0x14,%eax
    12df:	cd 40                	int    $0x40
    12e1:	c3                   	ret    

000012e2 <chdir>:
SYSCALL(chdir)
    12e2:	b8 09 00 00 00       	mov    $0x9,%eax
    12e7:	cd 40                	int    $0x40
    12e9:	c3                   	ret    

000012ea <dup>:
SYSCALL(dup)
    12ea:	b8 0a 00 00 00       	mov    $0xa,%eax
    12ef:	cd 40                	int    $0x40
    12f1:	c3                   	ret    

000012f2 <getpid>:
SYSCALL(getpid)
    12f2:	b8 0b 00 00 00       	mov    $0xb,%eax
    12f7:	cd 40                	int    $0x40
    12f9:	c3                   	ret    

000012fa <sbrk>:
SYSCALL(sbrk)
    12fa:	b8 0c 00 00 00       	mov    $0xc,%eax
    12ff:	cd 40                	int    $0x40
    1301:	c3                   	ret    

00001302 <sleep>:
SYSCALL(sleep)
    1302:	b8 0d 00 00 00       	mov    $0xd,%eax
    1307:	cd 40                	int    $0x40
    1309:	c3                   	ret    

0000130a <uptime>:
SYSCALL(uptime)
    130a:	b8 0e 00 00 00       	mov    $0xe,%eax
    130f:	cd 40                	int    $0x40
    1311:	c3                   	ret    
    1312:	66 90                	xchg   %ax,%ax
    1314:	66 90                	xchg   %ax,%ax
    1316:	66 90                	xchg   %ax,%ax
    1318:	66 90                	xchg   %ax,%ax
    131a:	66 90                	xchg   %ax,%ax
    131c:	66 90                	xchg   %ax,%ax
    131e:	66 90                	xchg   %ax,%ax

00001320 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1320:	55                   	push   %ebp
    1321:	89 e5                	mov    %esp,%ebp
    1323:	57                   	push   %edi
    1324:	56                   	push   %esi
    1325:	53                   	push   %ebx
    1326:	89 c6                	mov    %eax,%esi
    1328:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    132b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    132e:	85 db                	test   %ebx,%ebx
    1330:	74 7e                	je     13b0 <printint+0x90>
    1332:	89 d0                	mov    %edx,%eax
    1334:	c1 e8 1f             	shr    $0x1f,%eax
    1337:	84 c0                	test   %al,%al
    1339:	74 75                	je     13b0 <printint+0x90>
    neg = 1;
    x = -xx;
    133b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    133d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    1344:	f7 d8                	neg    %eax
    1346:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1349:	31 ff                	xor    %edi,%edi
    134b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    134e:	89 ce                	mov    %ecx,%esi
    1350:	eb 08                	jmp    135a <printint+0x3a>
    1352:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1358:	89 cf                	mov    %ecx,%edi
    135a:	31 d2                	xor    %edx,%edx
    135c:	8d 4f 01             	lea    0x1(%edi),%ecx
    135f:	f7 f6                	div    %esi
    1361:	0f b6 92 e8 16 00 00 	movzbl 0x16e8(%edx),%edx
  }while((x /= base) != 0);
    1368:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    136a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    136d:	75 e9                	jne    1358 <printint+0x38>
  if(neg)
    136f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1372:	8b 75 c0             	mov    -0x40(%ebp),%esi
    1375:	85 c0                	test   %eax,%eax
    1377:	74 08                	je     1381 <printint+0x61>
    buf[i++] = '-';
    1379:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    137e:	8d 4f 02             	lea    0x2(%edi),%ecx
    1381:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    1385:	8d 76 00             	lea    0x0(%esi),%esi
    1388:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    138b:	83 ec 04             	sub    $0x4,%esp
    138e:	83 ef 01             	sub    $0x1,%edi
    1391:	6a 01                	push   $0x1
    1393:	53                   	push   %ebx
    1394:	56                   	push   %esi
    1395:	88 45 d7             	mov    %al,-0x29(%ebp)
    1398:	e8 f5 fe ff ff       	call   1292 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    139d:	83 c4 10             	add    $0x10,%esp
    13a0:	39 df                	cmp    %ebx,%edi
    13a2:	75 e4                	jne    1388 <printint+0x68>
    putc(fd, buf[i]);
}
    13a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13a7:	5b                   	pop    %ebx
    13a8:	5e                   	pop    %esi
    13a9:	5f                   	pop    %edi
    13aa:	5d                   	pop    %ebp
    13ab:	c3                   	ret    
    13ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    13b0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    13b2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    13b9:	eb 8b                	jmp    1346 <printint+0x26>
    13bb:	90                   	nop
    13bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000013c0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    13c0:	55                   	push   %ebp
    13c1:	89 e5                	mov    %esp,%ebp
    13c3:	57                   	push   %edi
    13c4:	56                   	push   %esi
    13c5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13c6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    13c9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13cc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    13cf:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13d2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    13d5:	0f b6 1e             	movzbl (%esi),%ebx
    13d8:	83 c6 01             	add    $0x1,%esi
    13db:	84 db                	test   %bl,%bl
    13dd:	0f 84 b0 00 00 00    	je     1493 <printf+0xd3>
    13e3:	31 d2                	xor    %edx,%edx
    13e5:	eb 39                	jmp    1420 <printf+0x60>
    13e7:	89 f6                	mov    %esi,%esi
    13e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    13f0:	83 f8 25             	cmp    $0x25,%eax
    13f3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    13f6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    13fb:	74 18                	je     1415 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    13fd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1400:	83 ec 04             	sub    $0x4,%esp
    1403:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    1406:	6a 01                	push   $0x1
    1408:	50                   	push   %eax
    1409:	57                   	push   %edi
    140a:	e8 83 fe ff ff       	call   1292 <write>
    140f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1412:	83 c4 10             	add    $0x10,%esp
    1415:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1418:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    141c:	84 db                	test   %bl,%bl
    141e:	74 73                	je     1493 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    1420:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    1422:	0f be cb             	movsbl %bl,%ecx
    1425:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1428:	74 c6                	je     13f0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    142a:	83 fa 25             	cmp    $0x25,%edx
    142d:	75 e6                	jne    1415 <printf+0x55>
      if(c == 'd'){
    142f:	83 f8 64             	cmp    $0x64,%eax
    1432:	0f 84 f8 00 00 00    	je     1530 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1438:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    143e:	83 f9 70             	cmp    $0x70,%ecx
    1441:	74 5d                	je     14a0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1443:	83 f8 73             	cmp    $0x73,%eax
    1446:	0f 84 84 00 00 00    	je     14d0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    144c:	83 f8 63             	cmp    $0x63,%eax
    144f:	0f 84 ea 00 00 00    	je     153f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1455:	83 f8 25             	cmp    $0x25,%eax
    1458:	0f 84 c2 00 00 00    	je     1520 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    145e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1461:	83 ec 04             	sub    $0x4,%esp
    1464:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1468:	6a 01                	push   $0x1
    146a:	50                   	push   %eax
    146b:	57                   	push   %edi
    146c:	e8 21 fe ff ff       	call   1292 <write>
    1471:	83 c4 0c             	add    $0xc,%esp
    1474:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1477:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    147a:	6a 01                	push   $0x1
    147c:	50                   	push   %eax
    147d:	57                   	push   %edi
    147e:	83 c6 01             	add    $0x1,%esi
    1481:	e8 0c fe ff ff       	call   1292 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1486:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    148a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    148d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    148f:	84 db                	test   %bl,%bl
    1491:	75 8d                	jne    1420 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1493:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1496:	5b                   	pop    %ebx
    1497:	5e                   	pop    %esi
    1498:	5f                   	pop    %edi
    1499:	5d                   	pop    %ebp
    149a:	c3                   	ret    
    149b:	90                   	nop
    149c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    14a0:	83 ec 0c             	sub    $0xc,%esp
    14a3:	b9 10 00 00 00       	mov    $0x10,%ecx
    14a8:	6a 00                	push   $0x0
    14aa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    14ad:	89 f8                	mov    %edi,%eax
    14af:	8b 13                	mov    (%ebx),%edx
    14b1:	e8 6a fe ff ff       	call   1320 <printint>
        ap++;
    14b6:	89 d8                	mov    %ebx,%eax
    14b8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    14bb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    14bd:	83 c0 04             	add    $0x4,%eax
    14c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14c3:	e9 4d ff ff ff       	jmp    1415 <printf+0x55>
    14c8:	90                   	nop
    14c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    14d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    14d3:	8b 18                	mov    (%eax),%ebx
        ap++;
    14d5:	83 c0 04             	add    $0x4,%eax
    14d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    14db:	b8 e0 16 00 00       	mov    $0x16e0,%eax
    14e0:	85 db                	test   %ebx,%ebx
    14e2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    14e5:	0f b6 03             	movzbl (%ebx),%eax
    14e8:	84 c0                	test   %al,%al
    14ea:	74 23                	je     150f <printf+0x14f>
    14ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    14f0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14f3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    14f6:	83 ec 04             	sub    $0x4,%esp
    14f9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    14fb:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14fe:	50                   	push   %eax
    14ff:	57                   	push   %edi
    1500:	e8 8d fd ff ff       	call   1292 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1505:	0f b6 03             	movzbl (%ebx),%eax
    1508:	83 c4 10             	add    $0x10,%esp
    150b:	84 c0                	test   %al,%al
    150d:	75 e1                	jne    14f0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    150f:	31 d2                	xor    %edx,%edx
    1511:	e9 ff fe ff ff       	jmp    1415 <printf+0x55>
    1516:	8d 76 00             	lea    0x0(%esi),%esi
    1519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1520:	83 ec 04             	sub    $0x4,%esp
    1523:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    1526:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1529:	6a 01                	push   $0x1
    152b:	e9 4c ff ff ff       	jmp    147c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    1530:	83 ec 0c             	sub    $0xc,%esp
    1533:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1538:	6a 01                	push   $0x1
    153a:	e9 6b ff ff ff       	jmp    14aa <printf+0xea>
    153f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1542:	83 ec 04             	sub    $0x4,%esp
    1545:	8b 03                	mov    (%ebx),%eax
    1547:	6a 01                	push   $0x1
    1549:	88 45 e4             	mov    %al,-0x1c(%ebp)
    154c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    154f:	50                   	push   %eax
    1550:	57                   	push   %edi
    1551:	e8 3c fd ff ff       	call   1292 <write>
    1556:	e9 5b ff ff ff       	jmp    14b6 <printf+0xf6>
    155b:	66 90                	xchg   %ax,%ax
    155d:	66 90                	xchg   %ax,%ax
    155f:	90                   	nop

00001560 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1560:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1561:	a1 80 29 00 00       	mov    0x2980,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    1566:	89 e5                	mov    %esp,%ebp
    1568:	57                   	push   %edi
    1569:	56                   	push   %esi
    156a:	53                   	push   %ebx
    156b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    156e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1570:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1573:	39 c8                	cmp    %ecx,%eax
    1575:	73 19                	jae    1590 <free+0x30>
    1577:	89 f6                	mov    %esi,%esi
    1579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1580:	39 d1                	cmp    %edx,%ecx
    1582:	72 1c                	jb     15a0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1584:	39 d0                	cmp    %edx,%eax
    1586:	73 18                	jae    15a0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    1588:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    158a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    158c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    158e:	72 f0                	jb     1580 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1590:	39 d0                	cmp    %edx,%eax
    1592:	72 f4                	jb     1588 <free+0x28>
    1594:	39 d1                	cmp    %edx,%ecx
    1596:	73 f0                	jae    1588 <free+0x28>
    1598:	90                   	nop
    1599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    15a0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15a3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    15a6:	39 d7                	cmp    %edx,%edi
    15a8:	74 19                	je     15c3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    15aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    15ad:	8b 50 04             	mov    0x4(%eax),%edx
    15b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    15b3:	39 f1                	cmp    %esi,%ecx
    15b5:	74 23                	je     15da <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    15b7:	89 08                	mov    %ecx,(%eax)
  freep = p;
    15b9:	a3 80 29 00 00       	mov    %eax,0x2980
}
    15be:	5b                   	pop    %ebx
    15bf:	5e                   	pop    %esi
    15c0:	5f                   	pop    %edi
    15c1:	5d                   	pop    %ebp
    15c2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    15c3:	03 72 04             	add    0x4(%edx),%esi
    15c6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    15c9:	8b 10                	mov    (%eax),%edx
    15cb:	8b 12                	mov    (%edx),%edx
    15cd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    15d0:	8b 50 04             	mov    0x4(%eax),%edx
    15d3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    15d6:	39 f1                	cmp    %esi,%ecx
    15d8:	75 dd                	jne    15b7 <free+0x57>
    p->s.size += bp->s.size;
    15da:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    15dd:	a3 80 29 00 00       	mov    %eax,0x2980
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    15e2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    15e5:	8b 53 f8             	mov    -0x8(%ebx),%edx
    15e8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    15ea:	5b                   	pop    %ebx
    15eb:	5e                   	pop    %esi
    15ec:	5f                   	pop    %edi
    15ed:	5d                   	pop    %ebp
    15ee:	c3                   	ret    
    15ef:	90                   	nop

000015f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    15f0:	55                   	push   %ebp
    15f1:	89 e5                	mov    %esp,%ebp
    15f3:	57                   	push   %edi
    15f4:	56                   	push   %esi
    15f5:	53                   	push   %ebx
    15f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    15f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    15fc:	8b 15 80 29 00 00    	mov    0x2980,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1602:	8d 78 07             	lea    0x7(%eax),%edi
    1605:	c1 ef 03             	shr    $0x3,%edi
    1608:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    160b:	85 d2                	test   %edx,%edx
    160d:	0f 84 a3 00 00 00    	je     16b6 <malloc+0xc6>
    1613:	8b 02                	mov    (%edx),%eax
    1615:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1618:	39 cf                	cmp    %ecx,%edi
    161a:	76 74                	jbe    1690 <malloc+0xa0>
    161c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1622:	be 00 10 00 00       	mov    $0x1000,%esi
    1627:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    162e:	0f 43 f7             	cmovae %edi,%esi
    1631:	ba 00 80 00 00       	mov    $0x8000,%edx
    1636:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    163c:	0f 46 da             	cmovbe %edx,%ebx
    163f:	eb 10                	jmp    1651 <malloc+0x61>
    1641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1648:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    164a:	8b 48 04             	mov    0x4(%eax),%ecx
    164d:	39 cf                	cmp    %ecx,%edi
    164f:	76 3f                	jbe    1690 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1651:	39 05 80 29 00 00    	cmp    %eax,0x2980
    1657:	89 c2                	mov    %eax,%edx
    1659:	75 ed                	jne    1648 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    165b:	83 ec 0c             	sub    $0xc,%esp
    165e:	53                   	push   %ebx
    165f:	e8 96 fc ff ff       	call   12fa <sbrk>
  if(p == (char*)-1)
    1664:	83 c4 10             	add    $0x10,%esp
    1667:	83 f8 ff             	cmp    $0xffffffff,%eax
    166a:	74 1c                	je     1688 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    166c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    166f:	83 ec 0c             	sub    $0xc,%esp
    1672:	83 c0 08             	add    $0x8,%eax
    1675:	50                   	push   %eax
    1676:	e8 e5 fe ff ff       	call   1560 <free>
  return freep;
    167b:	8b 15 80 29 00 00    	mov    0x2980,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1681:	83 c4 10             	add    $0x10,%esp
    1684:	85 d2                	test   %edx,%edx
    1686:	75 c0                	jne    1648 <malloc+0x58>
        return 0;
    1688:	31 c0                	xor    %eax,%eax
    168a:	eb 1c                	jmp    16a8 <malloc+0xb8>
    168c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1690:	39 cf                	cmp    %ecx,%edi
    1692:	74 1c                	je     16b0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1694:	29 f9                	sub    %edi,%ecx
    1696:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1699:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    169c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    169f:	89 15 80 29 00 00    	mov    %edx,0x2980
      return (void*)(p + 1);
    16a5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    16a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    16ab:	5b                   	pop    %ebx
    16ac:	5e                   	pop    %esi
    16ad:	5f                   	pop    %edi
    16ae:	5d                   	pop    %ebp
    16af:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    16b0:	8b 08                	mov    (%eax),%ecx
    16b2:	89 0a                	mov    %ecx,(%edx)
    16b4:	eb e9                	jmp    169f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    16b6:	c7 05 80 29 00 00 84 	movl   $0x2984,0x2980
    16bd:	29 00 00 
    16c0:	c7 05 84 29 00 00 84 	movl   $0x2984,0x2984
    16c7:	29 00 00 
    base.s.size = 0;
    16ca:	b8 84 29 00 00       	mov    $0x2984,%eax
    16cf:	c7 05 88 29 00 00 00 	movl   $0x0,0x2988
    16d6:	00 00 00 
    16d9:	e9 3e ff ff ff       	jmp    161c <malloc+0x2c>
