
_stressfs: formato do arquivo elf32-i386


Desmontagem da seção .text:

00001000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
    1007:	b8 30 00 00 00       	mov    $0x30,%eax
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
    100c:	ff 71 fc             	pushl  -0x4(%ecx)
    100f:	55                   	push   %ebp
    1010:	89 e5                	mov    %esp,%ebp
    1012:	57                   	push   %edi
    1013:	56                   	push   %esi
    1014:	53                   	push   %ebx
    1015:	51                   	push   %ecx
  int fd, i;
  char path[] = "stressfs0";
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
    1016:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi

  for(i = 0; i < 4; i++)
    101c:	31 db                	xor    %ebx,%ebx
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
    101e:	81 ec 20 02 00 00    	sub    $0x220,%esp
  int fd, i;
  char path[] = "stressfs0";
    1024:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
    102b:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
    1032:	74 72 65 
  char data[512];

  printf(1, "stressfs starting\n");
    1035:	68 f0 17 00 00       	push   $0x17f0
    103a:	6a 01                	push   $0x1

int
main(int argc, char *argv[])
{
  int fd, i;
  char path[] = "stressfs0";
    103c:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
    1043:	73 66 73 
  char data[512];

  printf(1, "stressfs starting\n");
    1046:	e8 85 04 00 00       	call   14d0 <printf>
  memset(data, 'a', sizeof(data));
    104b:	83 c4 0c             	add    $0xc,%esp
    104e:	68 00 02 00 00       	push   $0x200
    1053:	6a 61                	push   $0x61
    1055:	56                   	push   %esi
    1056:	e8 95 01 00 00       	call   11f0 <memset>
    105b:	83 c4 10             	add    $0x10,%esp

  for(i = 0; i < 4; i++)
    if(fork() > 0)
    105e:	e8 17 03 00 00       	call   137a <fork>
    1063:	85 c0                	test   %eax,%eax
    1065:	0f 8f bf 00 00 00    	jg     112a <main+0x12a>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
    106b:	83 c3 01             	add    $0x1,%ebx
    106e:	83 fb 04             	cmp    $0x4,%ebx
    1071:	75 eb                	jne    105e <main+0x5e>
    1073:	bf 04 00 00 00       	mov    $0x4,%edi
    if(fork() > 0)
      break;

  printf(1, "write %d\n", i);
    1078:	83 ec 04             	sub    $0x4,%esp
    107b:	53                   	push   %ebx
    107c:	68 03 18 00 00       	push   $0x1803

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
    1081:	bb 14 00 00 00       	mov    $0x14,%ebx

  for(i = 0; i < 4; i++)
    if(fork() > 0)
      break;

  printf(1, "write %d\n", i);
    1086:	6a 01                	push   $0x1
    1088:	e8 43 04 00 00       	call   14d0 <printf>

  path[8] += i;
    108d:	89 f8                	mov    %edi,%eax
    108f:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
    1095:	5f                   	pop    %edi
    1096:	58                   	pop    %eax
    1097:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
    109d:	68 02 02 00 00       	push   $0x202
    10a2:	50                   	push   %eax
    10a3:	e8 1a 03 00 00       	call   13c2 <open>
    10a8:	83 c4 10             	add    $0x10,%esp
    10ab:	89 c7                	mov    %eax,%edi
    10ad:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 20; i++)
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
    10b0:	83 ec 04             	sub    $0x4,%esp
    10b3:	68 00 02 00 00       	push   $0x200
    10b8:	56                   	push   %esi
    10b9:	57                   	push   %edi
    10ba:	e8 e3 02 00 00       	call   13a2 <write>

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
    10bf:	83 c4 10             	add    $0x10,%esp
    10c2:	83 eb 01             	sub    $0x1,%ebx
    10c5:	75 e9                	jne    10b0 <main+0xb0>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
    10c7:	83 ec 0c             	sub    $0xc,%esp
    10ca:	57                   	push   %edi
    10cb:	e8 da 02 00 00       	call   13aa <close>

  printf(1, "read\n");
    10d0:	58                   	pop    %eax
    10d1:	5a                   	pop    %edx
    10d2:	68 0d 18 00 00       	push   $0x180d
    10d7:	6a 01                	push   $0x1
    10d9:	e8 f2 03 00 00       	call   14d0 <printf>

  fd = open(path, O_RDONLY);
    10de:	59                   	pop    %ecx
    10df:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
    10e5:	5b                   	pop    %ebx
    10e6:	6a 00                	push   $0x0
    10e8:	50                   	push   %eax
    10e9:	bb 14 00 00 00       	mov    $0x14,%ebx
    10ee:	e8 cf 02 00 00       	call   13c2 <open>
    10f3:	83 c4 10             	add    $0x10,%esp
    10f6:	89 c7                	mov    %eax,%edi
    10f8:	90                   	nop
    10f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
    1100:	83 ec 04             	sub    $0x4,%esp
    1103:	68 00 02 00 00       	push   $0x200
    1108:	56                   	push   %esi
    1109:	57                   	push   %edi
    110a:	e8 8b 02 00 00       	call   139a <read>
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
    110f:	83 c4 10             	add    $0x10,%esp
    1112:	83 eb 01             	sub    $0x1,%ebx
    1115:	75 e9                	jne    1100 <main+0x100>
    read(fd, data, sizeof(data));
  close(fd);
    1117:	83 ec 0c             	sub    $0xc,%esp
    111a:	57                   	push   %edi
    111b:	e8 8a 02 00 00       	call   13aa <close>

  wait();
    1120:	e8 65 02 00 00       	call   138a <wait>

  exit();
    1125:	e8 58 02 00 00       	call   1382 <exit>
    112a:	89 df                	mov    %ebx,%edi
    112c:	e9 47 ff ff ff       	jmp    1078 <main+0x78>
    1131:	66 90                	xchg   %ax,%ax
    1133:	66 90                	xchg   %ax,%ax
    1135:	66 90                	xchg   %ax,%ax
    1137:	66 90                	xchg   %ax,%ax
    1139:	66 90                	xchg   %ax,%ax
    113b:	66 90                	xchg   %ax,%ax
    113d:	66 90                	xchg   %ax,%ax
    113f:	90                   	nop

00001140 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	53                   	push   %ebx
    1144:	8b 45 08             	mov    0x8(%ebp),%eax
    1147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    114a:	89 c2                	mov    %eax,%edx
    114c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1150:	83 c1 01             	add    $0x1,%ecx
    1153:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1157:	83 c2 01             	add    $0x1,%edx
    115a:	84 db                	test   %bl,%bl
    115c:	88 5a ff             	mov    %bl,-0x1(%edx)
    115f:	75 ef                	jne    1150 <strcpy+0x10>
    ;
  return os;
}
    1161:	5b                   	pop    %ebx
    1162:	5d                   	pop    %ebp
    1163:	c3                   	ret    
    1164:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    116a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	56                   	push   %esi
    1174:	53                   	push   %ebx
    1175:	8b 55 08             	mov    0x8(%ebp),%edx
    1178:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    117b:	0f b6 02             	movzbl (%edx),%eax
    117e:	0f b6 19             	movzbl (%ecx),%ebx
    1181:	84 c0                	test   %al,%al
    1183:	75 1e                	jne    11a3 <strcmp+0x33>
    1185:	eb 29                	jmp    11b0 <strcmp+0x40>
    1187:	89 f6                	mov    %esi,%esi
    1189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1190:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1193:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1196:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1199:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    119d:	84 c0                	test   %al,%al
    119f:	74 0f                	je     11b0 <strcmp+0x40>
    11a1:	89 f1                	mov    %esi,%ecx
    11a3:	38 d8                	cmp    %bl,%al
    11a5:	74 e9                	je     1190 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    11a7:	29 d8                	sub    %ebx,%eax
}
    11a9:	5b                   	pop    %ebx
    11aa:	5e                   	pop    %esi
    11ab:	5d                   	pop    %ebp
    11ac:	c3                   	ret    
    11ad:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    11b0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    11b2:	29 d8                	sub    %ebx,%eax
}
    11b4:	5b                   	pop    %ebx
    11b5:	5e                   	pop    %esi
    11b6:	5d                   	pop    %ebp
    11b7:	c3                   	ret    
    11b8:	90                   	nop
    11b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000011c0 <strlen>:

uint
strlen(char *s)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    11c6:	80 39 00             	cmpb   $0x0,(%ecx)
    11c9:	74 12                	je     11dd <strlen+0x1d>
    11cb:	31 d2                	xor    %edx,%edx
    11cd:	8d 76 00             	lea    0x0(%esi),%esi
    11d0:	83 c2 01             	add    $0x1,%edx
    11d3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    11d7:	89 d0                	mov    %edx,%eax
    11d9:	75 f5                	jne    11d0 <strlen+0x10>
    ;
  return n;
}
    11db:	5d                   	pop    %ebp
    11dc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    11dd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    11df:	5d                   	pop    %ebp
    11e0:	c3                   	ret    
    11e1:	eb 0d                	jmp    11f0 <memset>
    11e3:	90                   	nop
    11e4:	90                   	nop
    11e5:	90                   	nop
    11e6:	90                   	nop
    11e7:	90                   	nop
    11e8:	90                   	nop
    11e9:	90                   	nop
    11ea:	90                   	nop
    11eb:	90                   	nop
    11ec:	90                   	nop
    11ed:	90                   	nop
    11ee:	90                   	nop
    11ef:	90                   	nop

000011f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	57                   	push   %edi
    11f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11fa:	8b 45 0c             	mov    0xc(%ebp),%eax
    11fd:	89 d7                	mov    %edx,%edi
    11ff:	fc                   	cld    
    1200:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1202:	89 d0                	mov    %edx,%eax
    1204:	5f                   	pop    %edi
    1205:	5d                   	pop    %ebp
    1206:	c3                   	ret    
    1207:	89 f6                	mov    %esi,%esi
    1209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001210 <strchr>:

char*
strchr(const char *s, char c)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	53                   	push   %ebx
    1214:	8b 45 08             	mov    0x8(%ebp),%eax
    1217:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    121a:	0f b6 10             	movzbl (%eax),%edx
    121d:	84 d2                	test   %dl,%dl
    121f:	74 1d                	je     123e <strchr+0x2e>
    if(*s == c)
    1221:	38 d3                	cmp    %dl,%bl
    1223:	89 d9                	mov    %ebx,%ecx
    1225:	75 0d                	jne    1234 <strchr+0x24>
    1227:	eb 17                	jmp    1240 <strchr+0x30>
    1229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1230:	38 ca                	cmp    %cl,%dl
    1232:	74 0c                	je     1240 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1234:	83 c0 01             	add    $0x1,%eax
    1237:	0f b6 10             	movzbl (%eax),%edx
    123a:	84 d2                	test   %dl,%dl
    123c:	75 f2                	jne    1230 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    123e:	31 c0                	xor    %eax,%eax
}
    1240:	5b                   	pop    %ebx
    1241:	5d                   	pop    %ebp
    1242:	c3                   	ret    
    1243:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001250 <gets>:

char*
gets(char *buf, int max)
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	57                   	push   %edi
    1254:	56                   	push   %esi
    1255:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1256:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    1258:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    125b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    125e:	eb 29                	jmp    1289 <gets+0x39>
    cc = read(0, &c, 1);
    1260:	83 ec 04             	sub    $0x4,%esp
    1263:	6a 01                	push   $0x1
    1265:	57                   	push   %edi
    1266:	6a 00                	push   $0x0
    1268:	e8 2d 01 00 00       	call   139a <read>
    if(cc < 1)
    126d:	83 c4 10             	add    $0x10,%esp
    1270:	85 c0                	test   %eax,%eax
    1272:	7e 1d                	jle    1291 <gets+0x41>
      break;
    buf[i++] = c;
    1274:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1278:	8b 55 08             	mov    0x8(%ebp),%edx
    127b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    127d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    127f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    1283:	74 1b                	je     12a0 <gets+0x50>
    1285:	3c 0d                	cmp    $0xd,%al
    1287:	74 17                	je     12a0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1289:	8d 5e 01             	lea    0x1(%esi),%ebx
    128c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    128f:	7c cf                	jl     1260 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1291:	8b 45 08             	mov    0x8(%ebp),%eax
    1294:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1298:	8d 65 f4             	lea    -0xc(%ebp),%esp
    129b:	5b                   	pop    %ebx
    129c:	5e                   	pop    %esi
    129d:	5f                   	pop    %edi
    129e:	5d                   	pop    %ebp
    129f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    12a0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    12a3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    12a5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    12a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12ac:	5b                   	pop    %ebx
    12ad:	5e                   	pop    %esi
    12ae:	5f                   	pop    %edi
    12af:	5d                   	pop    %ebp
    12b0:	c3                   	ret    
    12b1:	eb 0d                	jmp    12c0 <stat>
    12b3:	90                   	nop
    12b4:	90                   	nop
    12b5:	90                   	nop
    12b6:	90                   	nop
    12b7:	90                   	nop
    12b8:	90                   	nop
    12b9:	90                   	nop
    12ba:	90                   	nop
    12bb:	90                   	nop
    12bc:	90                   	nop
    12bd:	90                   	nop
    12be:	90                   	nop
    12bf:	90                   	nop

000012c0 <stat>:

int
stat(char *n, struct stat *st)
{
    12c0:	55                   	push   %ebp
    12c1:	89 e5                	mov    %esp,%ebp
    12c3:	56                   	push   %esi
    12c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    12c5:	83 ec 08             	sub    $0x8,%esp
    12c8:	6a 00                	push   $0x0
    12ca:	ff 75 08             	pushl  0x8(%ebp)
    12cd:	e8 f0 00 00 00       	call   13c2 <open>
  if(fd < 0)
    12d2:	83 c4 10             	add    $0x10,%esp
    12d5:	85 c0                	test   %eax,%eax
    12d7:	78 27                	js     1300 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    12d9:	83 ec 08             	sub    $0x8,%esp
    12dc:	ff 75 0c             	pushl  0xc(%ebp)
    12df:	89 c3                	mov    %eax,%ebx
    12e1:	50                   	push   %eax
    12e2:	e8 f3 00 00 00       	call   13da <fstat>
    12e7:	89 c6                	mov    %eax,%esi
  close(fd);
    12e9:	89 1c 24             	mov    %ebx,(%esp)
    12ec:	e8 b9 00 00 00       	call   13aa <close>
  return r;
    12f1:	83 c4 10             	add    $0x10,%esp
    12f4:	89 f0                	mov    %esi,%eax
}
    12f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12f9:	5b                   	pop    %ebx
    12fa:	5e                   	pop    %esi
    12fb:	5d                   	pop    %ebp
    12fc:	c3                   	ret    
    12fd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    1300:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1305:	eb ef                	jmp    12f6 <stat+0x36>
    1307:	89 f6                	mov    %esi,%esi
    1309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001310 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	53                   	push   %ebx
    1314:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1317:	0f be 11             	movsbl (%ecx),%edx
    131a:	8d 42 d0             	lea    -0x30(%edx),%eax
    131d:	3c 09                	cmp    $0x9,%al
    131f:	b8 00 00 00 00       	mov    $0x0,%eax
    1324:	77 1f                	ja     1345 <atoi+0x35>
    1326:	8d 76 00             	lea    0x0(%esi),%esi
    1329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1330:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1333:	83 c1 01             	add    $0x1,%ecx
    1336:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    133a:	0f be 11             	movsbl (%ecx),%edx
    133d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1340:	80 fb 09             	cmp    $0x9,%bl
    1343:	76 eb                	jbe    1330 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    1345:	5b                   	pop    %ebx
    1346:	5d                   	pop    %ebp
    1347:	c3                   	ret    
    1348:	90                   	nop
    1349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001350 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1350:	55                   	push   %ebp
    1351:	89 e5                	mov    %esp,%ebp
    1353:	56                   	push   %esi
    1354:	53                   	push   %ebx
    1355:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1358:	8b 45 08             	mov    0x8(%ebp),%eax
    135b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    135e:	85 db                	test   %ebx,%ebx
    1360:	7e 14                	jle    1376 <memmove+0x26>
    1362:	31 d2                	xor    %edx,%edx
    1364:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1368:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    136c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    136f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1372:	39 da                	cmp    %ebx,%edx
    1374:	75 f2                	jne    1368 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    1376:	5b                   	pop    %ebx
    1377:	5e                   	pop    %esi
    1378:	5d                   	pop    %ebp
    1379:	c3                   	ret    

0000137a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    137a:	b8 01 00 00 00       	mov    $0x1,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    

00001382 <exit>:
SYSCALL(exit)
    1382:	b8 02 00 00 00       	mov    $0x2,%eax
    1387:	cd 40                	int    $0x40
    1389:	c3                   	ret    

0000138a <wait>:
SYSCALL(wait)
    138a:	b8 03 00 00 00       	mov    $0x3,%eax
    138f:	cd 40                	int    $0x40
    1391:	c3                   	ret    

00001392 <pipe>:
SYSCALL(pipe)
    1392:	b8 04 00 00 00       	mov    $0x4,%eax
    1397:	cd 40                	int    $0x40
    1399:	c3                   	ret    

0000139a <read>:
SYSCALL(read)
    139a:	b8 05 00 00 00       	mov    $0x5,%eax
    139f:	cd 40                	int    $0x40
    13a1:	c3                   	ret    

000013a2 <write>:
SYSCALL(write)
    13a2:	b8 10 00 00 00       	mov    $0x10,%eax
    13a7:	cd 40                	int    $0x40
    13a9:	c3                   	ret    

000013aa <close>:
SYSCALL(close)
    13aa:	b8 15 00 00 00       	mov    $0x15,%eax
    13af:	cd 40                	int    $0x40
    13b1:	c3                   	ret    

000013b2 <kill>:
SYSCALL(kill)
    13b2:	b8 06 00 00 00       	mov    $0x6,%eax
    13b7:	cd 40                	int    $0x40
    13b9:	c3                   	ret    

000013ba <exec>:
SYSCALL(exec)
    13ba:	b8 07 00 00 00       	mov    $0x7,%eax
    13bf:	cd 40                	int    $0x40
    13c1:	c3                   	ret    

000013c2 <open>:
SYSCALL(open)
    13c2:	b8 0f 00 00 00       	mov    $0xf,%eax
    13c7:	cd 40                	int    $0x40
    13c9:	c3                   	ret    

000013ca <mknod>:
SYSCALL(mknod)
    13ca:	b8 11 00 00 00       	mov    $0x11,%eax
    13cf:	cd 40                	int    $0x40
    13d1:	c3                   	ret    

000013d2 <unlink>:
SYSCALL(unlink)
    13d2:	b8 12 00 00 00       	mov    $0x12,%eax
    13d7:	cd 40                	int    $0x40
    13d9:	c3                   	ret    

000013da <fstat>:
SYSCALL(fstat)
    13da:	b8 08 00 00 00       	mov    $0x8,%eax
    13df:	cd 40                	int    $0x40
    13e1:	c3                   	ret    

000013e2 <link>:
SYSCALL(link)
    13e2:	b8 13 00 00 00       	mov    $0x13,%eax
    13e7:	cd 40                	int    $0x40
    13e9:	c3                   	ret    

000013ea <mkdir>:
SYSCALL(mkdir)
    13ea:	b8 14 00 00 00       	mov    $0x14,%eax
    13ef:	cd 40                	int    $0x40
    13f1:	c3                   	ret    

000013f2 <chdir>:
SYSCALL(chdir)
    13f2:	b8 09 00 00 00       	mov    $0x9,%eax
    13f7:	cd 40                	int    $0x40
    13f9:	c3                   	ret    

000013fa <dup>:
SYSCALL(dup)
    13fa:	b8 0a 00 00 00       	mov    $0xa,%eax
    13ff:	cd 40                	int    $0x40
    1401:	c3                   	ret    

00001402 <getpid>:
SYSCALL(getpid)
    1402:	b8 0b 00 00 00       	mov    $0xb,%eax
    1407:	cd 40                	int    $0x40
    1409:	c3                   	ret    

0000140a <sbrk>:
SYSCALL(sbrk)
    140a:	b8 0c 00 00 00       	mov    $0xc,%eax
    140f:	cd 40                	int    $0x40
    1411:	c3                   	ret    

00001412 <sleep>:
SYSCALL(sleep)
    1412:	b8 0d 00 00 00       	mov    $0xd,%eax
    1417:	cd 40                	int    $0x40
    1419:	c3                   	ret    

0000141a <uptime>:
SYSCALL(uptime)
    141a:	b8 0e 00 00 00       	mov    $0xe,%eax
    141f:	cd 40                	int    $0x40
    1421:	c3                   	ret    
    1422:	66 90                	xchg   %ax,%ax
    1424:	66 90                	xchg   %ax,%ax
    1426:	66 90                	xchg   %ax,%ax
    1428:	66 90                	xchg   %ax,%ax
    142a:	66 90                	xchg   %ax,%ax
    142c:	66 90                	xchg   %ax,%ax
    142e:	66 90                	xchg   %ax,%ax

00001430 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	57                   	push   %edi
    1434:	56                   	push   %esi
    1435:	53                   	push   %ebx
    1436:	89 c6                	mov    %eax,%esi
    1438:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    143b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    143e:	85 db                	test   %ebx,%ebx
    1440:	74 7e                	je     14c0 <printint+0x90>
    1442:	89 d0                	mov    %edx,%eax
    1444:	c1 e8 1f             	shr    $0x1f,%eax
    1447:	84 c0                	test   %al,%al
    1449:	74 75                	je     14c0 <printint+0x90>
    neg = 1;
    x = -xx;
    144b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    144d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    1454:	f7 d8                	neg    %eax
    1456:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1459:	31 ff                	xor    %edi,%edi
    145b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    145e:	89 ce                	mov    %ecx,%esi
    1460:	eb 08                	jmp    146a <printint+0x3a>
    1462:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1468:	89 cf                	mov    %ecx,%edi
    146a:	31 d2                	xor    %edx,%edx
    146c:	8d 4f 01             	lea    0x1(%edi),%ecx
    146f:	f7 f6                	div    %esi
    1471:	0f b6 92 1c 18 00 00 	movzbl 0x181c(%edx),%edx
  }while((x /= base) != 0);
    1478:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    147a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    147d:	75 e9                	jne    1468 <printint+0x38>
  if(neg)
    147f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1482:	8b 75 c0             	mov    -0x40(%ebp),%esi
    1485:	85 c0                	test   %eax,%eax
    1487:	74 08                	je     1491 <printint+0x61>
    buf[i++] = '-';
    1489:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    148e:	8d 4f 02             	lea    0x2(%edi),%ecx
    1491:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    1495:	8d 76 00             	lea    0x0(%esi),%esi
    1498:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    149b:	83 ec 04             	sub    $0x4,%esp
    149e:	83 ef 01             	sub    $0x1,%edi
    14a1:	6a 01                	push   $0x1
    14a3:	53                   	push   %ebx
    14a4:	56                   	push   %esi
    14a5:	88 45 d7             	mov    %al,-0x29(%ebp)
    14a8:	e8 f5 fe ff ff       	call   13a2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    14ad:	83 c4 10             	add    $0x10,%esp
    14b0:	39 df                	cmp    %ebx,%edi
    14b2:	75 e4                	jne    1498 <printint+0x68>
    putc(fd, buf[i]);
}
    14b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14b7:	5b                   	pop    %ebx
    14b8:	5e                   	pop    %esi
    14b9:	5f                   	pop    %edi
    14ba:	5d                   	pop    %ebp
    14bb:	c3                   	ret    
    14bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    14c0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    14c2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    14c9:	eb 8b                	jmp    1456 <printint+0x26>
    14cb:	90                   	nop
    14cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000014d0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14d0:	55                   	push   %ebp
    14d1:	89 e5                	mov    %esp,%ebp
    14d3:	57                   	push   %edi
    14d4:	56                   	push   %esi
    14d5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14d6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14d9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14dc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14df:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14e2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14e5:	0f b6 1e             	movzbl (%esi),%ebx
    14e8:	83 c6 01             	add    $0x1,%esi
    14eb:	84 db                	test   %bl,%bl
    14ed:	0f 84 b0 00 00 00    	je     15a3 <printf+0xd3>
    14f3:	31 d2                	xor    %edx,%edx
    14f5:	eb 39                	jmp    1530 <printf+0x60>
    14f7:	89 f6                	mov    %esi,%esi
    14f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1500:	83 f8 25             	cmp    $0x25,%eax
    1503:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    1506:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    150b:	74 18                	je     1525 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    150d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1510:	83 ec 04             	sub    $0x4,%esp
    1513:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    1516:	6a 01                	push   $0x1
    1518:	50                   	push   %eax
    1519:	57                   	push   %edi
    151a:	e8 83 fe ff ff       	call   13a2 <write>
    151f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1522:	83 c4 10             	add    $0x10,%esp
    1525:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1528:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    152c:	84 db                	test   %bl,%bl
    152e:	74 73                	je     15a3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    1530:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    1532:	0f be cb             	movsbl %bl,%ecx
    1535:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1538:	74 c6                	je     1500 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    153a:	83 fa 25             	cmp    $0x25,%edx
    153d:	75 e6                	jne    1525 <printf+0x55>
      if(c == 'd'){
    153f:	83 f8 64             	cmp    $0x64,%eax
    1542:	0f 84 f8 00 00 00    	je     1640 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1548:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    154e:	83 f9 70             	cmp    $0x70,%ecx
    1551:	74 5d                	je     15b0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1553:	83 f8 73             	cmp    $0x73,%eax
    1556:	0f 84 84 00 00 00    	je     15e0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    155c:	83 f8 63             	cmp    $0x63,%eax
    155f:	0f 84 ea 00 00 00    	je     164f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1565:	83 f8 25             	cmp    $0x25,%eax
    1568:	0f 84 c2 00 00 00    	je     1630 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    156e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1571:	83 ec 04             	sub    $0x4,%esp
    1574:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1578:	6a 01                	push   $0x1
    157a:	50                   	push   %eax
    157b:	57                   	push   %edi
    157c:	e8 21 fe ff ff       	call   13a2 <write>
    1581:	83 c4 0c             	add    $0xc,%esp
    1584:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1587:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    158a:	6a 01                	push   $0x1
    158c:	50                   	push   %eax
    158d:	57                   	push   %edi
    158e:	83 c6 01             	add    $0x1,%esi
    1591:	e8 0c fe ff ff       	call   13a2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1596:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    159a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    159d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    159f:	84 db                	test   %bl,%bl
    15a1:	75 8d                	jne    1530 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    15a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15a6:	5b                   	pop    %ebx
    15a7:	5e                   	pop    %esi
    15a8:	5f                   	pop    %edi
    15a9:	5d                   	pop    %ebp
    15aa:	c3                   	ret    
    15ab:	90                   	nop
    15ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    15b0:	83 ec 0c             	sub    $0xc,%esp
    15b3:	b9 10 00 00 00       	mov    $0x10,%ecx
    15b8:	6a 00                	push   $0x0
    15ba:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    15bd:	89 f8                	mov    %edi,%eax
    15bf:	8b 13                	mov    (%ebx),%edx
    15c1:	e8 6a fe ff ff       	call   1430 <printint>
        ap++;
    15c6:	89 d8                	mov    %ebx,%eax
    15c8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    15cb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    15cd:	83 c0 04             	add    $0x4,%eax
    15d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    15d3:	e9 4d ff ff ff       	jmp    1525 <printf+0x55>
    15d8:	90                   	nop
    15d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    15e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15e3:	8b 18                	mov    (%eax),%ebx
        ap++;
    15e5:	83 c0 04             	add    $0x4,%eax
    15e8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    15eb:	b8 13 18 00 00       	mov    $0x1813,%eax
    15f0:	85 db                	test   %ebx,%ebx
    15f2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    15f5:	0f b6 03             	movzbl (%ebx),%eax
    15f8:	84 c0                	test   %al,%al
    15fa:	74 23                	je     161f <printf+0x14f>
    15fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1600:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1603:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1606:	83 ec 04             	sub    $0x4,%esp
    1609:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    160b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    160e:	50                   	push   %eax
    160f:	57                   	push   %edi
    1610:	e8 8d fd ff ff       	call   13a2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1615:	0f b6 03             	movzbl (%ebx),%eax
    1618:	83 c4 10             	add    $0x10,%esp
    161b:	84 c0                	test   %al,%al
    161d:	75 e1                	jne    1600 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    161f:	31 d2                	xor    %edx,%edx
    1621:	e9 ff fe ff ff       	jmp    1525 <printf+0x55>
    1626:	8d 76 00             	lea    0x0(%esi),%esi
    1629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1630:	83 ec 04             	sub    $0x4,%esp
    1633:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    1636:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1639:	6a 01                	push   $0x1
    163b:	e9 4c ff ff ff       	jmp    158c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    1640:	83 ec 0c             	sub    $0xc,%esp
    1643:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1648:	6a 01                	push   $0x1
    164a:	e9 6b ff ff ff       	jmp    15ba <printf+0xea>
    164f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1652:	83 ec 04             	sub    $0x4,%esp
    1655:	8b 03                	mov    (%ebx),%eax
    1657:	6a 01                	push   $0x1
    1659:	88 45 e4             	mov    %al,-0x1c(%ebp)
    165c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    165f:	50                   	push   %eax
    1660:	57                   	push   %edi
    1661:	e8 3c fd ff ff       	call   13a2 <write>
    1666:	e9 5b ff ff ff       	jmp    15c6 <printf+0xf6>
    166b:	66 90                	xchg   %ax,%ax
    166d:	66 90                	xchg   %ax,%ax
    166f:	90                   	nop

00001670 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1670:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1671:	a1 c0 1a 00 00       	mov    0x1ac0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    1676:	89 e5                	mov    %esp,%ebp
    1678:	57                   	push   %edi
    1679:	56                   	push   %esi
    167a:	53                   	push   %ebx
    167b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    167e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1680:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1683:	39 c8                	cmp    %ecx,%eax
    1685:	73 19                	jae    16a0 <free+0x30>
    1687:	89 f6                	mov    %esi,%esi
    1689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1690:	39 d1                	cmp    %edx,%ecx
    1692:	72 1c                	jb     16b0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1694:	39 d0                	cmp    %edx,%eax
    1696:	73 18                	jae    16b0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    1698:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    169a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    169c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    169e:	72 f0                	jb     1690 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16a0:	39 d0                	cmp    %edx,%eax
    16a2:	72 f4                	jb     1698 <free+0x28>
    16a4:	39 d1                	cmp    %edx,%ecx
    16a6:	73 f0                	jae    1698 <free+0x28>
    16a8:	90                   	nop
    16a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    16b0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16b3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16b6:	39 d7                	cmp    %edx,%edi
    16b8:	74 19                	je     16d3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    16ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    16bd:	8b 50 04             	mov    0x4(%eax),%edx
    16c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    16c3:	39 f1                	cmp    %esi,%ecx
    16c5:	74 23                	je     16ea <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    16c7:	89 08                	mov    %ecx,(%eax)
  freep = p;
    16c9:	a3 c0 1a 00 00       	mov    %eax,0x1ac0
}
    16ce:	5b                   	pop    %ebx
    16cf:	5e                   	pop    %esi
    16d0:	5f                   	pop    %edi
    16d1:	5d                   	pop    %ebp
    16d2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    16d3:	03 72 04             	add    0x4(%edx),%esi
    16d6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    16d9:	8b 10                	mov    (%eax),%edx
    16db:	8b 12                	mov    (%edx),%edx
    16dd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    16e0:	8b 50 04             	mov    0x4(%eax),%edx
    16e3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    16e6:	39 f1                	cmp    %esi,%ecx
    16e8:	75 dd                	jne    16c7 <free+0x57>
    p->s.size += bp->s.size;
    16ea:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    16ed:	a3 c0 1a 00 00       	mov    %eax,0x1ac0
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    16f2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16f5:	8b 53 f8             	mov    -0x8(%ebx),%edx
    16f8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    16fa:	5b                   	pop    %ebx
    16fb:	5e                   	pop    %esi
    16fc:	5f                   	pop    %edi
    16fd:	5d                   	pop    %ebp
    16fe:	c3                   	ret    
    16ff:	90                   	nop

00001700 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1700:	55                   	push   %ebp
    1701:	89 e5                	mov    %esp,%ebp
    1703:	57                   	push   %edi
    1704:	56                   	push   %esi
    1705:	53                   	push   %ebx
    1706:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1709:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    170c:	8b 15 c0 1a 00 00    	mov    0x1ac0,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1712:	8d 78 07             	lea    0x7(%eax),%edi
    1715:	c1 ef 03             	shr    $0x3,%edi
    1718:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    171b:	85 d2                	test   %edx,%edx
    171d:	0f 84 a3 00 00 00    	je     17c6 <malloc+0xc6>
    1723:	8b 02                	mov    (%edx),%eax
    1725:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1728:	39 cf                	cmp    %ecx,%edi
    172a:	76 74                	jbe    17a0 <malloc+0xa0>
    172c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1732:	be 00 10 00 00       	mov    $0x1000,%esi
    1737:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    173e:	0f 43 f7             	cmovae %edi,%esi
    1741:	ba 00 80 00 00       	mov    $0x8000,%edx
    1746:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    174c:	0f 46 da             	cmovbe %edx,%ebx
    174f:	eb 10                	jmp    1761 <malloc+0x61>
    1751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1758:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    175a:	8b 48 04             	mov    0x4(%eax),%ecx
    175d:	39 cf                	cmp    %ecx,%edi
    175f:	76 3f                	jbe    17a0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1761:	39 05 c0 1a 00 00    	cmp    %eax,0x1ac0
    1767:	89 c2                	mov    %eax,%edx
    1769:	75 ed                	jne    1758 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    176b:	83 ec 0c             	sub    $0xc,%esp
    176e:	53                   	push   %ebx
    176f:	e8 96 fc ff ff       	call   140a <sbrk>
  if(p == (char*)-1)
    1774:	83 c4 10             	add    $0x10,%esp
    1777:	83 f8 ff             	cmp    $0xffffffff,%eax
    177a:	74 1c                	je     1798 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    177c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    177f:	83 ec 0c             	sub    $0xc,%esp
    1782:	83 c0 08             	add    $0x8,%eax
    1785:	50                   	push   %eax
    1786:	e8 e5 fe ff ff       	call   1670 <free>
  return freep;
    178b:	8b 15 c0 1a 00 00    	mov    0x1ac0,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1791:	83 c4 10             	add    $0x10,%esp
    1794:	85 d2                	test   %edx,%edx
    1796:	75 c0                	jne    1758 <malloc+0x58>
        return 0;
    1798:	31 c0                	xor    %eax,%eax
    179a:	eb 1c                	jmp    17b8 <malloc+0xb8>
    179c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    17a0:	39 cf                	cmp    %ecx,%edi
    17a2:	74 1c                	je     17c0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    17a4:	29 f9                	sub    %edi,%ecx
    17a6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    17a9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    17ac:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    17af:	89 15 c0 1a 00 00    	mov    %edx,0x1ac0
      return (void*)(p + 1);
    17b5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    17b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    17bb:	5b                   	pop    %ebx
    17bc:	5e                   	pop    %esi
    17bd:	5f                   	pop    %edi
    17be:	5d                   	pop    %ebp
    17bf:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    17c0:	8b 08                	mov    (%eax),%ecx
    17c2:	89 0a                	mov    %ecx,(%edx)
    17c4:	eb e9                	jmp    17af <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    17c6:	c7 05 c0 1a 00 00 c4 	movl   $0x1ac4,0x1ac0
    17cd:	1a 00 00 
    17d0:	c7 05 c4 1a 00 00 c4 	movl   $0x1ac4,0x1ac4
    17d7:	1a 00 00 
    base.s.size = 0;
    17da:	b8 c4 1a 00 00       	mov    $0x1ac4,%eax
    17df:	c7 05 c8 1a 00 00 00 	movl   $0x0,0x1ac8
    17e6:	00 00 00 
    17e9:	e9 3e ff ff ff       	jmp    172c <malloc+0x2c>
