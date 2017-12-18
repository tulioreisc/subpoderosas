
_wc: formato do arquivo elf32-i386


Desmontagem da seção .text:

00001000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
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
    1011:	be 01 00 00 00       	mov    $0x1,%esi
    1016:	83 ec 18             	sub    $0x18,%esp
    1019:	8b 01                	mov    (%ecx),%eax
    101b:	8b 59 04             	mov    0x4(%ecx),%ebx
    101e:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
    1021:	83 f8 01             	cmp    $0x1,%eax
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
    1024:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;

  if(argc <= 1){
    1027:	7e 56                	jle    107f <main+0x7f>
    1029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
    1030:	83 ec 08             	sub    $0x8,%esp
    1033:	6a 00                	push   $0x0
    1035:	ff 33                	pushl  (%ebx)
    1037:	e8 c6 03 00 00       	call   1402 <open>
    103c:	83 c4 10             	add    $0x10,%esp
    103f:	85 c0                	test   %eax,%eax
    1041:	89 c7                	mov    %eax,%edi
    1043:	78 26                	js     106b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
    1045:	83 ec 08             	sub    $0x8,%esp
    1048:	ff 33                	pushl  (%ebx)
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    104a:	83 c6 01             	add    $0x1,%esi
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
    104d:	50                   	push   %eax
    104e:	83 c3 04             	add    $0x4,%ebx
    1051:	e8 4a 00 00 00       	call   10a0 <wc>
    close(fd);
    1056:	89 3c 24             	mov    %edi,(%esp)
    1059:	e8 8c 03 00 00       	call   13ea <close>
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    105e:	83 c4 10             	add    $0x10,%esp
    1061:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
    1064:	75 ca                	jne    1030 <main+0x30>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
    1066:	e8 57 03 00 00       	call   13c2 <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
    106b:	50                   	push   %eax
    106c:	ff 33                	pushl  (%ebx)
    106e:	68 53 18 00 00       	push   $0x1853
    1073:	6a 01                	push   $0x1
    1075:	e8 96 04 00 00       	call   1510 <printf>
      exit();
    107a:	e8 43 03 00 00       	call   13c2 <exit>
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    wc(0, "");
    107f:	52                   	push   %edx
    1080:	52                   	push   %edx
    1081:	68 45 18 00 00       	push   $0x1845
    1086:	6a 00                	push   $0x0
    1088:	e8 13 00 00 00       	call   10a0 <wc>
    exit();
    108d:	e8 30 03 00 00       	call   13c2 <exit>
    1092:	66 90                	xchg   %ax,%ax
    1094:	66 90                	xchg   %ax,%ax
    1096:	66 90                	xchg   %ax,%ax
    1098:	66 90                	xchg   %ax,%ax
    109a:	66 90                	xchg   %ax,%ax
    109c:	66 90                	xchg   %ax,%ax
    109e:	66 90                	xchg   %ax,%ax

000010a0 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	57                   	push   %edi
    10a4:	56                   	push   %esi
    10a5:	53                   	push   %ebx
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
    10a6:	31 f6                	xor    %esi,%esi
wc(int fd, char *name)
{
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
    10a8:	31 db                	xor    %ebx,%ebx

char buf[512];

void
wc(int fd, char *name)
{
    10aa:	83 ec 1c             	sub    $0x1c,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
    10ad:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    10b4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    10bb:	90                   	nop
    10bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    10c0:	83 ec 04             	sub    $0x4,%esp
    10c3:	68 00 02 00 00       	push   $0x200
    10c8:	68 80 2b 00 00       	push   $0x2b80
    10cd:	ff 75 08             	pushl  0x8(%ebp)
    10d0:	e8 05 03 00 00       	call   13da <read>
    10d5:	83 c4 10             	add    $0x10,%esp
    10d8:	83 f8 00             	cmp    $0x0,%eax
    10db:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    10de:	7e 5f                	jle    113f <wc+0x9f>
    10e0:	31 ff                	xor    %edi,%edi
    10e2:	eb 0e                	jmp    10f2 <wc+0x52>
    10e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
        inword = 0;
    10e8:	31 f6                	xor    %esi,%esi
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
    10ea:	83 c7 01             	add    $0x1,%edi
    10ed:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
    10f0:	74 3a                	je     112c <wc+0x8c>
      c++;
      if(buf[i] == '\n')
    10f2:	0f be 87 80 2b 00 00 	movsbl 0x2b80(%edi),%eax
        l++;
    10f9:	31 c9                	xor    %ecx,%ecx
    10fb:	3c 0a                	cmp    $0xa,%al
    10fd:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
    1100:	83 ec 08             	sub    $0x8,%esp
    1103:	50                   	push   %eax
    1104:	68 30 18 00 00       	push   $0x1830
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
    1109:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
    110b:	e8 40 01 00 00       	call   1250 <strchr>
    1110:	83 c4 10             	add    $0x10,%esp
    1113:	85 c0                	test   %eax,%eax
    1115:	75 d1                	jne    10e8 <wc+0x48>
        inword = 0;
      else if(!inword){
    1117:	85 f6                	test   %esi,%esi
    1119:	75 1d                	jne    1138 <wc+0x98>
        w++;
    111b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
    111f:	83 c7 01             	add    $0x1,%edi
    1122:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
        inword = 0;
      else if(!inword){
        w++;
        inword = 1;
    1125:	be 01 00 00 00       	mov    $0x1,%esi
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
    112a:	75 c6                	jne    10f2 <wc+0x52>
    112c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    112f:	01 55 dc             	add    %edx,-0x24(%ebp)
    1132:	eb 8c                	jmp    10c0 <wc+0x20>
    1134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1138:	be 01 00 00 00       	mov    $0x1,%esi
    113d:	eb ab                	jmp    10ea <wc+0x4a>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
    113f:	75 24                	jne    1165 <wc+0xc5>
    printf(1, "wc: read error\n");
    exit();
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
    1141:	83 ec 08             	sub    $0x8,%esp
    1144:	ff 75 0c             	pushl  0xc(%ebp)
    1147:	ff 75 dc             	pushl  -0x24(%ebp)
    114a:	ff 75 e0             	pushl  -0x20(%ebp)
    114d:	53                   	push   %ebx
    114e:	68 46 18 00 00       	push   $0x1846
    1153:	6a 01                	push   $0x1
    1155:	e8 b6 03 00 00       	call   1510 <printf>
}
    115a:	83 c4 20             	add    $0x20,%esp
    115d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1160:	5b                   	pop    %ebx
    1161:	5e                   	pop    %esi
    1162:	5f                   	pop    %edi
    1163:	5d                   	pop    %ebp
    1164:	c3                   	ret    
        inword = 1;
      }
    }
  }
  if(n < 0){
    printf(1, "wc: read error\n");
    1165:	83 ec 08             	sub    $0x8,%esp
    1168:	68 36 18 00 00       	push   $0x1836
    116d:	6a 01                	push   $0x1
    116f:	e8 9c 03 00 00       	call   1510 <printf>
    exit();
    1174:	e8 49 02 00 00       	call   13c2 <exit>
    1179:	66 90                	xchg   %ax,%ax
    117b:	66 90                	xchg   %ax,%ax
    117d:	66 90                	xchg   %ax,%ax
    117f:	90                   	nop

00001180 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	53                   	push   %ebx
    1184:	8b 45 08             	mov    0x8(%ebp),%eax
    1187:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    118a:	89 c2                	mov    %eax,%edx
    118c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1190:	83 c1 01             	add    $0x1,%ecx
    1193:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1197:	83 c2 01             	add    $0x1,%edx
    119a:	84 db                	test   %bl,%bl
    119c:	88 5a ff             	mov    %bl,-0x1(%edx)
    119f:	75 ef                	jne    1190 <strcpy+0x10>
    ;
  return os;
}
    11a1:	5b                   	pop    %ebx
    11a2:	5d                   	pop    %ebp
    11a3:	c3                   	ret    
    11a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000011b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	56                   	push   %esi
    11b4:	53                   	push   %ebx
    11b5:	8b 55 08             	mov    0x8(%ebp),%edx
    11b8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    11bb:	0f b6 02             	movzbl (%edx),%eax
    11be:	0f b6 19             	movzbl (%ecx),%ebx
    11c1:	84 c0                	test   %al,%al
    11c3:	75 1e                	jne    11e3 <strcmp+0x33>
    11c5:	eb 29                	jmp    11f0 <strcmp+0x40>
    11c7:	89 f6                	mov    %esi,%esi
    11c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    11d0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    11d3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    11d6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    11d9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    11dd:	84 c0                	test   %al,%al
    11df:	74 0f                	je     11f0 <strcmp+0x40>
    11e1:	89 f1                	mov    %esi,%ecx
    11e3:	38 d8                	cmp    %bl,%al
    11e5:	74 e9                	je     11d0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    11e7:	29 d8                	sub    %ebx,%eax
}
    11e9:	5b                   	pop    %ebx
    11ea:	5e                   	pop    %esi
    11eb:	5d                   	pop    %ebp
    11ec:	c3                   	ret    
    11ed:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    11f0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    11f2:	29 d8                	sub    %ebx,%eax
}
    11f4:	5b                   	pop    %ebx
    11f5:	5e                   	pop    %esi
    11f6:	5d                   	pop    %ebp
    11f7:	c3                   	ret    
    11f8:	90                   	nop
    11f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001200 <strlen>:

uint
strlen(char *s)
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1206:	80 39 00             	cmpb   $0x0,(%ecx)
    1209:	74 12                	je     121d <strlen+0x1d>
    120b:	31 d2                	xor    %edx,%edx
    120d:	8d 76 00             	lea    0x0(%esi),%esi
    1210:	83 c2 01             	add    $0x1,%edx
    1213:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1217:	89 d0                	mov    %edx,%eax
    1219:	75 f5                	jne    1210 <strlen+0x10>
    ;
  return n;
}
    121b:	5d                   	pop    %ebp
    121c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    121d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    121f:	5d                   	pop    %ebp
    1220:	c3                   	ret    
    1221:	eb 0d                	jmp    1230 <memset>
    1223:	90                   	nop
    1224:	90                   	nop
    1225:	90                   	nop
    1226:	90                   	nop
    1227:	90                   	nop
    1228:	90                   	nop
    1229:	90                   	nop
    122a:	90                   	nop
    122b:	90                   	nop
    122c:	90                   	nop
    122d:	90                   	nop
    122e:	90                   	nop
    122f:	90                   	nop

00001230 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	57                   	push   %edi
    1234:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1237:	8b 4d 10             	mov    0x10(%ebp),%ecx
    123a:	8b 45 0c             	mov    0xc(%ebp),%eax
    123d:	89 d7                	mov    %edx,%edi
    123f:	fc                   	cld    
    1240:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1242:	89 d0                	mov    %edx,%eax
    1244:	5f                   	pop    %edi
    1245:	5d                   	pop    %ebp
    1246:	c3                   	ret    
    1247:	89 f6                	mov    %esi,%esi
    1249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001250 <strchr>:

char*
strchr(const char *s, char c)
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	53                   	push   %ebx
    1254:	8b 45 08             	mov    0x8(%ebp),%eax
    1257:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    125a:	0f b6 10             	movzbl (%eax),%edx
    125d:	84 d2                	test   %dl,%dl
    125f:	74 1d                	je     127e <strchr+0x2e>
    if(*s == c)
    1261:	38 d3                	cmp    %dl,%bl
    1263:	89 d9                	mov    %ebx,%ecx
    1265:	75 0d                	jne    1274 <strchr+0x24>
    1267:	eb 17                	jmp    1280 <strchr+0x30>
    1269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1270:	38 ca                	cmp    %cl,%dl
    1272:	74 0c                	je     1280 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1274:	83 c0 01             	add    $0x1,%eax
    1277:	0f b6 10             	movzbl (%eax),%edx
    127a:	84 d2                	test   %dl,%dl
    127c:	75 f2                	jne    1270 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    127e:	31 c0                	xor    %eax,%eax
}
    1280:	5b                   	pop    %ebx
    1281:	5d                   	pop    %ebp
    1282:	c3                   	ret    
    1283:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001290 <gets>:

char*
gets(char *buf, int max)
{
    1290:	55                   	push   %ebp
    1291:	89 e5                	mov    %esp,%ebp
    1293:	57                   	push   %edi
    1294:	56                   	push   %esi
    1295:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1296:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    1298:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    129b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    129e:	eb 29                	jmp    12c9 <gets+0x39>
    cc = read(0, &c, 1);
    12a0:	83 ec 04             	sub    $0x4,%esp
    12a3:	6a 01                	push   $0x1
    12a5:	57                   	push   %edi
    12a6:	6a 00                	push   $0x0
    12a8:	e8 2d 01 00 00       	call   13da <read>
    if(cc < 1)
    12ad:	83 c4 10             	add    $0x10,%esp
    12b0:	85 c0                	test   %eax,%eax
    12b2:	7e 1d                	jle    12d1 <gets+0x41>
      break;
    buf[i++] = c;
    12b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    12b8:	8b 55 08             	mov    0x8(%ebp),%edx
    12bb:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    12bd:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    12bf:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    12c3:	74 1b                	je     12e0 <gets+0x50>
    12c5:	3c 0d                	cmp    $0xd,%al
    12c7:	74 17                	je     12e0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    12c9:	8d 5e 01             	lea    0x1(%esi),%ebx
    12cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    12cf:	7c cf                	jl     12a0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    12d1:	8b 45 08             	mov    0x8(%ebp),%eax
    12d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    12d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12db:	5b                   	pop    %ebx
    12dc:	5e                   	pop    %esi
    12dd:	5f                   	pop    %edi
    12de:	5d                   	pop    %ebp
    12df:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    12e0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    12e3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    12e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    12e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12ec:	5b                   	pop    %ebx
    12ed:	5e                   	pop    %esi
    12ee:	5f                   	pop    %edi
    12ef:	5d                   	pop    %ebp
    12f0:	c3                   	ret    
    12f1:	eb 0d                	jmp    1300 <stat>
    12f3:	90                   	nop
    12f4:	90                   	nop
    12f5:	90                   	nop
    12f6:	90                   	nop
    12f7:	90                   	nop
    12f8:	90                   	nop
    12f9:	90                   	nop
    12fa:	90                   	nop
    12fb:	90                   	nop
    12fc:	90                   	nop
    12fd:	90                   	nop
    12fe:	90                   	nop
    12ff:	90                   	nop

00001300 <stat>:

int
stat(char *n, struct stat *st)
{
    1300:	55                   	push   %ebp
    1301:	89 e5                	mov    %esp,%ebp
    1303:	56                   	push   %esi
    1304:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1305:	83 ec 08             	sub    $0x8,%esp
    1308:	6a 00                	push   $0x0
    130a:	ff 75 08             	pushl  0x8(%ebp)
    130d:	e8 f0 00 00 00       	call   1402 <open>
  if(fd < 0)
    1312:	83 c4 10             	add    $0x10,%esp
    1315:	85 c0                	test   %eax,%eax
    1317:	78 27                	js     1340 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1319:	83 ec 08             	sub    $0x8,%esp
    131c:	ff 75 0c             	pushl  0xc(%ebp)
    131f:	89 c3                	mov    %eax,%ebx
    1321:	50                   	push   %eax
    1322:	e8 f3 00 00 00       	call   141a <fstat>
    1327:	89 c6                	mov    %eax,%esi
  close(fd);
    1329:	89 1c 24             	mov    %ebx,(%esp)
    132c:	e8 b9 00 00 00       	call   13ea <close>
  return r;
    1331:	83 c4 10             	add    $0x10,%esp
    1334:	89 f0                	mov    %esi,%eax
}
    1336:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1339:	5b                   	pop    %ebx
    133a:	5e                   	pop    %esi
    133b:	5d                   	pop    %ebp
    133c:	c3                   	ret    
    133d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    1340:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1345:	eb ef                	jmp    1336 <stat+0x36>
    1347:	89 f6                	mov    %esi,%esi
    1349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001350 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    1350:	55                   	push   %ebp
    1351:	89 e5                	mov    %esp,%ebp
    1353:	53                   	push   %ebx
    1354:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1357:	0f be 11             	movsbl (%ecx),%edx
    135a:	8d 42 d0             	lea    -0x30(%edx),%eax
    135d:	3c 09                	cmp    $0x9,%al
    135f:	b8 00 00 00 00       	mov    $0x0,%eax
    1364:	77 1f                	ja     1385 <atoi+0x35>
    1366:	8d 76 00             	lea    0x0(%esi),%esi
    1369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1370:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1373:	83 c1 01             	add    $0x1,%ecx
    1376:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    137a:	0f be 11             	movsbl (%ecx),%edx
    137d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1380:	80 fb 09             	cmp    $0x9,%bl
    1383:	76 eb                	jbe    1370 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    1385:	5b                   	pop    %ebx
    1386:	5d                   	pop    %ebp
    1387:	c3                   	ret    
    1388:	90                   	nop
    1389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001390 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1390:	55                   	push   %ebp
    1391:	89 e5                	mov    %esp,%ebp
    1393:	56                   	push   %esi
    1394:	53                   	push   %ebx
    1395:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1398:	8b 45 08             	mov    0x8(%ebp),%eax
    139b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    139e:	85 db                	test   %ebx,%ebx
    13a0:	7e 14                	jle    13b6 <memmove+0x26>
    13a2:	31 d2                	xor    %edx,%edx
    13a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    13a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    13ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    13af:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    13b2:	39 da                	cmp    %ebx,%edx
    13b4:	75 f2                	jne    13a8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    13b6:	5b                   	pop    %ebx
    13b7:	5e                   	pop    %esi
    13b8:	5d                   	pop    %ebp
    13b9:	c3                   	ret    

000013ba <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    13ba:	b8 01 00 00 00       	mov    $0x1,%eax
    13bf:	cd 40                	int    $0x40
    13c1:	c3                   	ret    

000013c2 <exit>:
SYSCALL(exit)
    13c2:	b8 02 00 00 00       	mov    $0x2,%eax
    13c7:	cd 40                	int    $0x40
    13c9:	c3                   	ret    

000013ca <wait>:
SYSCALL(wait)
    13ca:	b8 03 00 00 00       	mov    $0x3,%eax
    13cf:	cd 40                	int    $0x40
    13d1:	c3                   	ret    

000013d2 <pipe>:
SYSCALL(pipe)
    13d2:	b8 04 00 00 00       	mov    $0x4,%eax
    13d7:	cd 40                	int    $0x40
    13d9:	c3                   	ret    

000013da <read>:
SYSCALL(read)
    13da:	b8 05 00 00 00       	mov    $0x5,%eax
    13df:	cd 40                	int    $0x40
    13e1:	c3                   	ret    

000013e2 <write>:
SYSCALL(write)
    13e2:	b8 10 00 00 00       	mov    $0x10,%eax
    13e7:	cd 40                	int    $0x40
    13e9:	c3                   	ret    

000013ea <close>:
SYSCALL(close)
    13ea:	b8 15 00 00 00       	mov    $0x15,%eax
    13ef:	cd 40                	int    $0x40
    13f1:	c3                   	ret    

000013f2 <kill>:
SYSCALL(kill)
    13f2:	b8 06 00 00 00       	mov    $0x6,%eax
    13f7:	cd 40                	int    $0x40
    13f9:	c3                   	ret    

000013fa <exec>:
SYSCALL(exec)
    13fa:	b8 07 00 00 00       	mov    $0x7,%eax
    13ff:	cd 40                	int    $0x40
    1401:	c3                   	ret    

00001402 <open>:
SYSCALL(open)
    1402:	b8 0f 00 00 00       	mov    $0xf,%eax
    1407:	cd 40                	int    $0x40
    1409:	c3                   	ret    

0000140a <mknod>:
SYSCALL(mknod)
    140a:	b8 11 00 00 00       	mov    $0x11,%eax
    140f:	cd 40                	int    $0x40
    1411:	c3                   	ret    

00001412 <unlink>:
SYSCALL(unlink)
    1412:	b8 12 00 00 00       	mov    $0x12,%eax
    1417:	cd 40                	int    $0x40
    1419:	c3                   	ret    

0000141a <fstat>:
SYSCALL(fstat)
    141a:	b8 08 00 00 00       	mov    $0x8,%eax
    141f:	cd 40                	int    $0x40
    1421:	c3                   	ret    

00001422 <link>:
SYSCALL(link)
    1422:	b8 13 00 00 00       	mov    $0x13,%eax
    1427:	cd 40                	int    $0x40
    1429:	c3                   	ret    

0000142a <mkdir>:
SYSCALL(mkdir)
    142a:	b8 14 00 00 00       	mov    $0x14,%eax
    142f:	cd 40                	int    $0x40
    1431:	c3                   	ret    

00001432 <chdir>:
SYSCALL(chdir)
    1432:	b8 09 00 00 00       	mov    $0x9,%eax
    1437:	cd 40                	int    $0x40
    1439:	c3                   	ret    

0000143a <dup>:
SYSCALL(dup)
    143a:	b8 0a 00 00 00       	mov    $0xa,%eax
    143f:	cd 40                	int    $0x40
    1441:	c3                   	ret    

00001442 <getpid>:
SYSCALL(getpid)
    1442:	b8 0b 00 00 00       	mov    $0xb,%eax
    1447:	cd 40                	int    $0x40
    1449:	c3                   	ret    

0000144a <sbrk>:
SYSCALL(sbrk)
    144a:	b8 0c 00 00 00       	mov    $0xc,%eax
    144f:	cd 40                	int    $0x40
    1451:	c3                   	ret    

00001452 <sleep>:
SYSCALL(sleep)
    1452:	b8 0d 00 00 00       	mov    $0xd,%eax
    1457:	cd 40                	int    $0x40
    1459:	c3                   	ret    

0000145a <uptime>:
SYSCALL(uptime)
    145a:	b8 0e 00 00 00       	mov    $0xe,%eax
    145f:	cd 40                	int    $0x40
    1461:	c3                   	ret    
    1462:	66 90                	xchg   %ax,%ax
    1464:	66 90                	xchg   %ax,%ax
    1466:	66 90                	xchg   %ax,%ax
    1468:	66 90                	xchg   %ax,%ax
    146a:	66 90                	xchg   %ax,%ax
    146c:	66 90                	xchg   %ax,%ax
    146e:	66 90                	xchg   %ax,%ax

00001470 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1470:	55                   	push   %ebp
    1471:	89 e5                	mov    %esp,%ebp
    1473:	57                   	push   %edi
    1474:	56                   	push   %esi
    1475:	53                   	push   %ebx
    1476:	89 c6                	mov    %eax,%esi
    1478:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    147b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    147e:	85 db                	test   %ebx,%ebx
    1480:	74 7e                	je     1500 <printint+0x90>
    1482:	89 d0                	mov    %edx,%eax
    1484:	c1 e8 1f             	shr    $0x1f,%eax
    1487:	84 c0                	test   %al,%al
    1489:	74 75                	je     1500 <printint+0x90>
    neg = 1;
    x = -xx;
    148b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    148d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    1494:	f7 d8                	neg    %eax
    1496:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1499:	31 ff                	xor    %edi,%edi
    149b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    149e:	89 ce                	mov    %ecx,%esi
    14a0:	eb 08                	jmp    14aa <printint+0x3a>
    14a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    14a8:	89 cf                	mov    %ecx,%edi
    14aa:	31 d2                	xor    %edx,%edx
    14ac:	8d 4f 01             	lea    0x1(%edi),%ecx
    14af:	f7 f6                	div    %esi
    14b1:	0f b6 92 70 18 00 00 	movzbl 0x1870(%edx),%edx
  }while((x /= base) != 0);
    14b8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    14ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    14bd:	75 e9                	jne    14a8 <printint+0x38>
  if(neg)
    14bf:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    14c2:	8b 75 c0             	mov    -0x40(%ebp),%esi
    14c5:	85 c0                	test   %eax,%eax
    14c7:	74 08                	je     14d1 <printint+0x61>
    buf[i++] = '-';
    14c9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    14ce:	8d 4f 02             	lea    0x2(%edi),%ecx
    14d1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    14d5:	8d 76 00             	lea    0x0(%esi),%esi
    14d8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14db:	83 ec 04             	sub    $0x4,%esp
    14de:	83 ef 01             	sub    $0x1,%edi
    14e1:	6a 01                	push   $0x1
    14e3:	53                   	push   %ebx
    14e4:	56                   	push   %esi
    14e5:	88 45 d7             	mov    %al,-0x29(%ebp)
    14e8:	e8 f5 fe ff ff       	call   13e2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    14ed:	83 c4 10             	add    $0x10,%esp
    14f0:	39 df                	cmp    %ebx,%edi
    14f2:	75 e4                	jne    14d8 <printint+0x68>
    putc(fd, buf[i]);
}
    14f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14f7:	5b                   	pop    %ebx
    14f8:	5e                   	pop    %esi
    14f9:	5f                   	pop    %edi
    14fa:	5d                   	pop    %ebp
    14fb:	c3                   	ret    
    14fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    1500:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1502:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1509:	eb 8b                	jmp    1496 <printint+0x26>
    150b:	90                   	nop
    150c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001510 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1510:	55                   	push   %ebp
    1511:	89 e5                	mov    %esp,%ebp
    1513:	57                   	push   %edi
    1514:	56                   	push   %esi
    1515:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1516:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1519:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    151c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    151f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1522:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1525:	0f b6 1e             	movzbl (%esi),%ebx
    1528:	83 c6 01             	add    $0x1,%esi
    152b:	84 db                	test   %bl,%bl
    152d:	0f 84 b0 00 00 00    	je     15e3 <printf+0xd3>
    1533:	31 d2                	xor    %edx,%edx
    1535:	eb 39                	jmp    1570 <printf+0x60>
    1537:	89 f6                	mov    %esi,%esi
    1539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1540:	83 f8 25             	cmp    $0x25,%eax
    1543:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    1546:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    154b:	74 18                	je     1565 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    154d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1550:	83 ec 04             	sub    $0x4,%esp
    1553:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    1556:	6a 01                	push   $0x1
    1558:	50                   	push   %eax
    1559:	57                   	push   %edi
    155a:	e8 83 fe ff ff       	call   13e2 <write>
    155f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1562:	83 c4 10             	add    $0x10,%esp
    1565:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1568:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    156c:	84 db                	test   %bl,%bl
    156e:	74 73                	je     15e3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    1570:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    1572:	0f be cb             	movsbl %bl,%ecx
    1575:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1578:	74 c6                	je     1540 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    157a:	83 fa 25             	cmp    $0x25,%edx
    157d:	75 e6                	jne    1565 <printf+0x55>
      if(c == 'd'){
    157f:	83 f8 64             	cmp    $0x64,%eax
    1582:	0f 84 f8 00 00 00    	je     1680 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1588:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    158e:	83 f9 70             	cmp    $0x70,%ecx
    1591:	74 5d                	je     15f0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1593:	83 f8 73             	cmp    $0x73,%eax
    1596:	0f 84 84 00 00 00    	je     1620 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    159c:	83 f8 63             	cmp    $0x63,%eax
    159f:	0f 84 ea 00 00 00    	je     168f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    15a5:	83 f8 25             	cmp    $0x25,%eax
    15a8:	0f 84 c2 00 00 00    	je     1670 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15ae:	8d 45 e7             	lea    -0x19(%ebp),%eax
    15b1:	83 ec 04             	sub    $0x4,%esp
    15b4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    15b8:	6a 01                	push   $0x1
    15ba:	50                   	push   %eax
    15bb:	57                   	push   %edi
    15bc:	e8 21 fe ff ff       	call   13e2 <write>
    15c1:	83 c4 0c             	add    $0xc,%esp
    15c4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    15c7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    15ca:	6a 01                	push   $0x1
    15cc:	50                   	push   %eax
    15cd:	57                   	push   %edi
    15ce:	83 c6 01             	add    $0x1,%esi
    15d1:	e8 0c fe ff ff       	call   13e2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    15d6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15da:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    15dd:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    15df:	84 db                	test   %bl,%bl
    15e1:	75 8d                	jne    1570 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    15e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15e6:	5b                   	pop    %ebx
    15e7:	5e                   	pop    %esi
    15e8:	5f                   	pop    %edi
    15e9:	5d                   	pop    %ebp
    15ea:	c3                   	ret    
    15eb:	90                   	nop
    15ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    15f0:	83 ec 0c             	sub    $0xc,%esp
    15f3:	b9 10 00 00 00       	mov    $0x10,%ecx
    15f8:	6a 00                	push   $0x0
    15fa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    15fd:	89 f8                	mov    %edi,%eax
    15ff:	8b 13                	mov    (%ebx),%edx
    1601:	e8 6a fe ff ff       	call   1470 <printint>
        ap++;
    1606:	89 d8                	mov    %ebx,%eax
    1608:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    160b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    160d:	83 c0 04             	add    $0x4,%eax
    1610:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1613:	e9 4d ff ff ff       	jmp    1565 <printf+0x55>
    1618:	90                   	nop
    1619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    1620:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1623:	8b 18                	mov    (%eax),%ebx
        ap++;
    1625:	83 c0 04             	add    $0x4,%eax
    1628:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    162b:	b8 67 18 00 00       	mov    $0x1867,%eax
    1630:	85 db                	test   %ebx,%ebx
    1632:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    1635:	0f b6 03             	movzbl (%ebx),%eax
    1638:	84 c0                	test   %al,%al
    163a:	74 23                	je     165f <printf+0x14f>
    163c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1640:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1643:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1646:	83 ec 04             	sub    $0x4,%esp
    1649:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    164b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    164e:	50                   	push   %eax
    164f:	57                   	push   %edi
    1650:	e8 8d fd ff ff       	call   13e2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1655:	0f b6 03             	movzbl (%ebx),%eax
    1658:	83 c4 10             	add    $0x10,%esp
    165b:	84 c0                	test   %al,%al
    165d:	75 e1                	jne    1640 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    165f:	31 d2                	xor    %edx,%edx
    1661:	e9 ff fe ff ff       	jmp    1565 <printf+0x55>
    1666:	8d 76 00             	lea    0x0(%esi),%esi
    1669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1670:	83 ec 04             	sub    $0x4,%esp
    1673:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    1676:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1679:	6a 01                	push   $0x1
    167b:	e9 4c ff ff ff       	jmp    15cc <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    1680:	83 ec 0c             	sub    $0xc,%esp
    1683:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1688:	6a 01                	push   $0x1
    168a:	e9 6b ff ff ff       	jmp    15fa <printf+0xea>
    168f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1692:	83 ec 04             	sub    $0x4,%esp
    1695:	8b 03                	mov    (%ebx),%eax
    1697:	6a 01                	push   $0x1
    1699:	88 45 e4             	mov    %al,-0x1c(%ebp)
    169c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    169f:	50                   	push   %eax
    16a0:	57                   	push   %edi
    16a1:	e8 3c fd ff ff       	call   13e2 <write>
    16a6:	e9 5b ff ff ff       	jmp    1606 <printf+0xf6>
    16ab:	66 90                	xchg   %ax,%ax
    16ad:	66 90                	xchg   %ax,%ax
    16af:	90                   	nop

000016b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16b1:	a1 60 2b 00 00       	mov    0x2b60,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    16b6:	89 e5                	mov    %esp,%ebp
    16b8:	57                   	push   %edi
    16b9:	56                   	push   %esi
    16ba:	53                   	push   %ebx
    16bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16be:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    16c0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16c3:	39 c8                	cmp    %ecx,%eax
    16c5:	73 19                	jae    16e0 <free+0x30>
    16c7:	89 f6                	mov    %esi,%esi
    16c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    16d0:	39 d1                	cmp    %edx,%ecx
    16d2:	72 1c                	jb     16f0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16d4:	39 d0                	cmp    %edx,%eax
    16d6:	73 18                	jae    16f0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    16d8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16da:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16dc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16de:	72 f0                	jb     16d0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16e0:	39 d0                	cmp    %edx,%eax
    16e2:	72 f4                	jb     16d8 <free+0x28>
    16e4:	39 d1                	cmp    %edx,%ecx
    16e6:	73 f0                	jae    16d8 <free+0x28>
    16e8:	90                   	nop
    16e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    16f0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16f3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16f6:	39 d7                	cmp    %edx,%edi
    16f8:	74 19                	je     1713 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    16fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    16fd:	8b 50 04             	mov    0x4(%eax),%edx
    1700:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1703:	39 f1                	cmp    %esi,%ecx
    1705:	74 23                	je     172a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1707:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1709:	a3 60 2b 00 00       	mov    %eax,0x2b60
}
    170e:	5b                   	pop    %ebx
    170f:	5e                   	pop    %esi
    1710:	5f                   	pop    %edi
    1711:	5d                   	pop    %ebp
    1712:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    1713:	03 72 04             	add    0x4(%edx),%esi
    1716:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1719:	8b 10                	mov    (%eax),%edx
    171b:	8b 12                	mov    (%edx),%edx
    171d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1720:	8b 50 04             	mov    0x4(%eax),%edx
    1723:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1726:	39 f1                	cmp    %esi,%ecx
    1728:	75 dd                	jne    1707 <free+0x57>
    p->s.size += bp->s.size;
    172a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    172d:	a3 60 2b 00 00       	mov    %eax,0x2b60
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    1732:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1735:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1738:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    173a:	5b                   	pop    %ebx
    173b:	5e                   	pop    %esi
    173c:	5f                   	pop    %edi
    173d:	5d                   	pop    %ebp
    173e:	c3                   	ret    
    173f:	90                   	nop

00001740 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1740:	55                   	push   %ebp
    1741:	89 e5                	mov    %esp,%ebp
    1743:	57                   	push   %edi
    1744:	56                   	push   %esi
    1745:	53                   	push   %ebx
    1746:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1749:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    174c:	8b 15 60 2b 00 00    	mov    0x2b60,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1752:	8d 78 07             	lea    0x7(%eax),%edi
    1755:	c1 ef 03             	shr    $0x3,%edi
    1758:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    175b:	85 d2                	test   %edx,%edx
    175d:	0f 84 a3 00 00 00    	je     1806 <malloc+0xc6>
    1763:	8b 02                	mov    (%edx),%eax
    1765:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1768:	39 cf                	cmp    %ecx,%edi
    176a:	76 74                	jbe    17e0 <malloc+0xa0>
    176c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1772:	be 00 10 00 00       	mov    $0x1000,%esi
    1777:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    177e:	0f 43 f7             	cmovae %edi,%esi
    1781:	ba 00 80 00 00       	mov    $0x8000,%edx
    1786:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    178c:	0f 46 da             	cmovbe %edx,%ebx
    178f:	eb 10                	jmp    17a1 <malloc+0x61>
    1791:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1798:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    179a:	8b 48 04             	mov    0x4(%eax),%ecx
    179d:	39 cf                	cmp    %ecx,%edi
    179f:	76 3f                	jbe    17e0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    17a1:	39 05 60 2b 00 00    	cmp    %eax,0x2b60
    17a7:	89 c2                	mov    %eax,%edx
    17a9:	75 ed                	jne    1798 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    17ab:	83 ec 0c             	sub    $0xc,%esp
    17ae:	53                   	push   %ebx
    17af:	e8 96 fc ff ff       	call   144a <sbrk>
  if(p == (char*)-1)
    17b4:	83 c4 10             	add    $0x10,%esp
    17b7:	83 f8 ff             	cmp    $0xffffffff,%eax
    17ba:	74 1c                	je     17d8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    17bc:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    17bf:	83 ec 0c             	sub    $0xc,%esp
    17c2:	83 c0 08             	add    $0x8,%eax
    17c5:	50                   	push   %eax
    17c6:	e8 e5 fe ff ff       	call   16b0 <free>
  return freep;
    17cb:	8b 15 60 2b 00 00    	mov    0x2b60,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    17d1:	83 c4 10             	add    $0x10,%esp
    17d4:	85 d2                	test   %edx,%edx
    17d6:	75 c0                	jne    1798 <malloc+0x58>
        return 0;
    17d8:	31 c0                	xor    %eax,%eax
    17da:	eb 1c                	jmp    17f8 <malloc+0xb8>
    17dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    17e0:	39 cf                	cmp    %ecx,%edi
    17e2:	74 1c                	je     1800 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    17e4:	29 f9                	sub    %edi,%ecx
    17e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    17e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    17ec:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    17ef:	89 15 60 2b 00 00    	mov    %edx,0x2b60
      return (void*)(p + 1);
    17f5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    17f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    17fb:	5b                   	pop    %ebx
    17fc:	5e                   	pop    %esi
    17fd:	5f                   	pop    %edi
    17fe:	5d                   	pop    %ebp
    17ff:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1800:	8b 08                	mov    (%eax),%ecx
    1802:	89 0a                	mov    %ecx,(%edx)
    1804:	eb e9                	jmp    17ef <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1806:	c7 05 60 2b 00 00 64 	movl   $0x2b64,0x2b60
    180d:	2b 00 00 
    1810:	c7 05 64 2b 00 00 64 	movl   $0x2b64,0x2b64
    1817:	2b 00 00 
    base.s.size = 0;
    181a:	b8 64 2b 00 00       	mov    $0x2b64,%eax
    181f:	c7 05 68 2b 00 00 00 	movl   $0x0,0x2b68
    1826:	00 00 00 
    1829:	e9 3e ff ff ff       	jmp    176c <malloc+0x2c>
