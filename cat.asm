
_cat: formato do arquivo elf32-i386


Desmontagem da seção .text:

00001000 <main>:
  }
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
  }
}

int
main(int argc, char *argv[])
{
    1024:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;

  if(argc <= 1){
    1027:	7e 54                	jle    107d <main+0x7d>
    1029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
    1030:	83 ec 08             	sub    $0x8,%esp
    1033:	6a 00                	push   $0x0
    1035:	ff 33                	pushl  (%ebx)
    1037:	e8 56 03 00 00       	call   1392 <open>
    103c:	83 c4 10             	add    $0x10,%esp
    103f:	85 c0                	test   %eax,%eax
    1041:	89 c7                	mov    %eax,%edi
    1043:	78 24                	js     1069 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
    1045:	83 ec 0c             	sub    $0xc,%esp
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    1048:	83 c6 01             	add    $0x1,%esi
    104b:	83 c3 04             	add    $0x4,%ebx
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
    104e:	50                   	push   %eax
    104f:	e8 3c 00 00 00       	call   1090 <cat>
    close(fd);
    1054:	89 3c 24             	mov    %edi,(%esp)
    1057:	e8 1e 03 00 00       	call   137a <close>
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    105c:	83 c4 10             	add    $0x10,%esp
    105f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
    1062:	75 cc                	jne    1030 <main+0x30>
      exit();
    }
    cat(fd);
    close(fd);
  }
  exit();
    1064:	e8 e9 02 00 00       	call   1352 <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
    1069:	50                   	push   %eax
    106a:	ff 33                	pushl  (%ebx)
    106c:	68 e3 17 00 00       	push   $0x17e3
    1071:	6a 01                	push   $0x1
    1073:	e8 28 04 00 00       	call   14a0 <printf>
      exit();
    1078:	e8 d5 02 00 00       	call   1352 <exit>
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    cat(0);
    107d:	83 ec 0c             	sub    $0xc,%esp
    1080:	6a 00                	push   $0x0
    1082:	e8 09 00 00 00       	call   1090 <cat>
    exit();
    1087:	e8 c6 02 00 00       	call   1352 <exit>
    108c:	66 90                	xchg   %ax,%ax
    108e:	66 90                	xchg   %ax,%ax

00001090 <cat>:

char buf[512];

void
cat(int fd)
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	56                   	push   %esi
    1094:	53                   	push   %ebx
    1095:	8b 75 08             	mov    0x8(%ebp),%esi
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
    1098:	eb 1d                	jmp    10b7 <cat+0x27>
    109a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
    10a0:	83 ec 04             	sub    $0x4,%esp
    10a3:	53                   	push   %ebx
    10a4:	68 00 1b 00 00       	push   $0x1b00
    10a9:	6a 01                	push   $0x1
    10ab:	e8 c2 02 00 00       	call   1372 <write>
    10b0:	83 c4 10             	add    $0x10,%esp
    10b3:	39 c3                	cmp    %eax,%ebx
    10b5:	75 26                	jne    10dd <cat+0x4d>
void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
    10b7:	83 ec 04             	sub    $0x4,%esp
    10ba:	68 00 02 00 00       	push   $0x200
    10bf:	68 00 1b 00 00       	push   $0x1b00
    10c4:	56                   	push   %esi
    10c5:	e8 a0 02 00 00       	call   136a <read>
    10ca:	83 c4 10             	add    $0x10,%esp
    10cd:	83 f8 00             	cmp    $0x0,%eax
    10d0:	89 c3                	mov    %eax,%ebx
    10d2:	7f cc                	jg     10a0 <cat+0x10>
    if (write(1, buf, n) != n) {
      printf(1, "cat: write error\n");
      exit();
    }
  }
  if(n < 0){
    10d4:	75 1b                	jne    10f1 <cat+0x61>
    printf(1, "cat: read error\n");
    exit();
  }
}
    10d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    10d9:	5b                   	pop    %ebx
    10da:	5e                   	pop    %esi
    10db:	5d                   	pop    %ebp
    10dc:	c3                   	ret    
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
    if (write(1, buf, n) != n) {
      printf(1, "cat: write error\n");
    10dd:	83 ec 08             	sub    $0x8,%esp
    10e0:	68 c0 17 00 00       	push   $0x17c0
    10e5:	6a 01                	push   $0x1
    10e7:	e8 b4 03 00 00       	call   14a0 <printf>
      exit();
    10ec:	e8 61 02 00 00       	call   1352 <exit>
    }
  }
  if(n < 0){
    printf(1, "cat: read error\n");
    10f1:	83 ec 08             	sub    $0x8,%esp
    10f4:	68 d2 17 00 00       	push   $0x17d2
    10f9:	6a 01                	push   $0x1
    10fb:	e8 a0 03 00 00       	call   14a0 <printf>
    exit();
    1100:	e8 4d 02 00 00       	call   1352 <exit>
    1105:	66 90                	xchg   %ax,%ax
    1107:	66 90                	xchg   %ax,%ax
    1109:	66 90                	xchg   %ax,%ax
    110b:	66 90                	xchg   %ax,%ax
    110d:	66 90                	xchg   %ax,%ax
    110f:	90                   	nop

00001110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	53                   	push   %ebx
    1114:	8b 45 08             	mov    0x8(%ebp),%eax
    1117:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    111a:	89 c2                	mov    %eax,%edx
    111c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1120:	83 c1 01             	add    $0x1,%ecx
    1123:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1127:	83 c2 01             	add    $0x1,%edx
    112a:	84 db                	test   %bl,%bl
    112c:	88 5a ff             	mov    %bl,-0x1(%edx)
    112f:	75 ef                	jne    1120 <strcpy+0x10>
    ;
  return os;
}
    1131:	5b                   	pop    %ebx
    1132:	5d                   	pop    %ebp
    1133:	c3                   	ret    
    1134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    113a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	56                   	push   %esi
    1144:	53                   	push   %ebx
    1145:	8b 55 08             	mov    0x8(%ebp),%edx
    1148:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    114b:	0f b6 02             	movzbl (%edx),%eax
    114e:	0f b6 19             	movzbl (%ecx),%ebx
    1151:	84 c0                	test   %al,%al
    1153:	75 1e                	jne    1173 <strcmp+0x33>
    1155:	eb 29                	jmp    1180 <strcmp+0x40>
    1157:	89 f6                	mov    %esi,%esi
    1159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1160:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1163:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1166:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1169:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    116d:	84 c0                	test   %al,%al
    116f:	74 0f                	je     1180 <strcmp+0x40>
    1171:	89 f1                	mov    %esi,%ecx
    1173:	38 d8                	cmp    %bl,%al
    1175:	74 e9                	je     1160 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1177:	29 d8                	sub    %ebx,%eax
}
    1179:	5b                   	pop    %ebx
    117a:	5e                   	pop    %esi
    117b:	5d                   	pop    %ebp
    117c:	c3                   	ret    
    117d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1180:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1182:	29 d8                	sub    %ebx,%eax
}
    1184:	5b                   	pop    %ebx
    1185:	5e                   	pop    %esi
    1186:	5d                   	pop    %ebp
    1187:	c3                   	ret    
    1188:	90                   	nop
    1189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001190 <strlen>:

uint
strlen(char *s)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1196:	80 39 00             	cmpb   $0x0,(%ecx)
    1199:	74 12                	je     11ad <strlen+0x1d>
    119b:	31 d2                	xor    %edx,%edx
    119d:	8d 76 00             	lea    0x0(%esi),%esi
    11a0:	83 c2 01             	add    $0x1,%edx
    11a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    11a7:	89 d0                	mov    %edx,%eax
    11a9:	75 f5                	jne    11a0 <strlen+0x10>
    ;
  return n;
}
    11ab:	5d                   	pop    %ebp
    11ac:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    11ad:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    11af:	5d                   	pop    %ebp
    11b0:	c3                   	ret    
    11b1:	eb 0d                	jmp    11c0 <memset>
    11b3:	90                   	nop
    11b4:	90                   	nop
    11b5:	90                   	nop
    11b6:	90                   	nop
    11b7:	90                   	nop
    11b8:	90                   	nop
    11b9:	90                   	nop
    11ba:	90                   	nop
    11bb:	90                   	nop
    11bc:	90                   	nop
    11bd:	90                   	nop
    11be:	90                   	nop
    11bf:	90                   	nop

000011c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	57                   	push   %edi
    11c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11ca:	8b 45 0c             	mov    0xc(%ebp),%eax
    11cd:	89 d7                	mov    %edx,%edi
    11cf:	fc                   	cld    
    11d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11d2:	89 d0                	mov    %edx,%eax
    11d4:	5f                   	pop    %edi
    11d5:	5d                   	pop    %ebp
    11d6:	c3                   	ret    
    11d7:	89 f6                	mov    %esi,%esi
    11d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011e0 <strchr>:

char*
strchr(const char *s, char c)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	53                   	push   %ebx
    11e4:	8b 45 08             	mov    0x8(%ebp),%eax
    11e7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    11ea:	0f b6 10             	movzbl (%eax),%edx
    11ed:	84 d2                	test   %dl,%dl
    11ef:	74 1d                	je     120e <strchr+0x2e>
    if(*s == c)
    11f1:	38 d3                	cmp    %dl,%bl
    11f3:	89 d9                	mov    %ebx,%ecx
    11f5:	75 0d                	jne    1204 <strchr+0x24>
    11f7:	eb 17                	jmp    1210 <strchr+0x30>
    11f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1200:	38 ca                	cmp    %cl,%dl
    1202:	74 0c                	je     1210 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1204:	83 c0 01             	add    $0x1,%eax
    1207:	0f b6 10             	movzbl (%eax),%edx
    120a:	84 d2                	test   %dl,%dl
    120c:	75 f2                	jne    1200 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    120e:	31 c0                	xor    %eax,%eax
}
    1210:	5b                   	pop    %ebx
    1211:	5d                   	pop    %ebp
    1212:	c3                   	ret    
    1213:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001220 <gets>:

char*
gets(char *buf, int max)
{
    1220:	55                   	push   %ebp
    1221:	89 e5                	mov    %esp,%ebp
    1223:	57                   	push   %edi
    1224:	56                   	push   %esi
    1225:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1226:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    1228:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    122b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    122e:	eb 29                	jmp    1259 <gets+0x39>
    cc = read(0, &c, 1);
    1230:	83 ec 04             	sub    $0x4,%esp
    1233:	6a 01                	push   $0x1
    1235:	57                   	push   %edi
    1236:	6a 00                	push   $0x0
    1238:	e8 2d 01 00 00       	call   136a <read>
    if(cc < 1)
    123d:	83 c4 10             	add    $0x10,%esp
    1240:	85 c0                	test   %eax,%eax
    1242:	7e 1d                	jle    1261 <gets+0x41>
      break;
    buf[i++] = c;
    1244:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1248:	8b 55 08             	mov    0x8(%ebp),%edx
    124b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    124d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    124f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    1253:	74 1b                	je     1270 <gets+0x50>
    1255:	3c 0d                	cmp    $0xd,%al
    1257:	74 17                	je     1270 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1259:	8d 5e 01             	lea    0x1(%esi),%ebx
    125c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    125f:	7c cf                	jl     1230 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1261:	8b 45 08             	mov    0x8(%ebp),%eax
    1264:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1268:	8d 65 f4             	lea    -0xc(%ebp),%esp
    126b:	5b                   	pop    %ebx
    126c:	5e                   	pop    %esi
    126d:	5f                   	pop    %edi
    126e:	5d                   	pop    %ebp
    126f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1270:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1273:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1275:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1279:	8d 65 f4             	lea    -0xc(%ebp),%esp
    127c:	5b                   	pop    %ebx
    127d:	5e                   	pop    %esi
    127e:	5f                   	pop    %edi
    127f:	5d                   	pop    %ebp
    1280:	c3                   	ret    
    1281:	eb 0d                	jmp    1290 <stat>
    1283:	90                   	nop
    1284:	90                   	nop
    1285:	90                   	nop
    1286:	90                   	nop
    1287:	90                   	nop
    1288:	90                   	nop
    1289:	90                   	nop
    128a:	90                   	nop
    128b:	90                   	nop
    128c:	90                   	nop
    128d:	90                   	nop
    128e:	90                   	nop
    128f:	90                   	nop

00001290 <stat>:

int
stat(char *n, struct stat *st)
{
    1290:	55                   	push   %ebp
    1291:	89 e5                	mov    %esp,%ebp
    1293:	56                   	push   %esi
    1294:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1295:	83 ec 08             	sub    $0x8,%esp
    1298:	6a 00                	push   $0x0
    129a:	ff 75 08             	pushl  0x8(%ebp)
    129d:	e8 f0 00 00 00       	call   1392 <open>
  if(fd < 0)
    12a2:	83 c4 10             	add    $0x10,%esp
    12a5:	85 c0                	test   %eax,%eax
    12a7:	78 27                	js     12d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    12a9:	83 ec 08             	sub    $0x8,%esp
    12ac:	ff 75 0c             	pushl  0xc(%ebp)
    12af:	89 c3                	mov    %eax,%ebx
    12b1:	50                   	push   %eax
    12b2:	e8 f3 00 00 00       	call   13aa <fstat>
    12b7:	89 c6                	mov    %eax,%esi
  close(fd);
    12b9:	89 1c 24             	mov    %ebx,(%esp)
    12bc:	e8 b9 00 00 00       	call   137a <close>
  return r;
    12c1:	83 c4 10             	add    $0x10,%esp
    12c4:	89 f0                	mov    %esi,%eax
}
    12c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12c9:	5b                   	pop    %ebx
    12ca:	5e                   	pop    %esi
    12cb:	5d                   	pop    %ebp
    12cc:	c3                   	ret    
    12cd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    12d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    12d5:	eb ef                	jmp    12c6 <stat+0x36>
    12d7:	89 f6                	mov    %esi,%esi
    12d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012e0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    12e0:	55                   	push   %ebp
    12e1:	89 e5                	mov    %esp,%ebp
    12e3:	53                   	push   %ebx
    12e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12e7:	0f be 11             	movsbl (%ecx),%edx
    12ea:	8d 42 d0             	lea    -0x30(%edx),%eax
    12ed:	3c 09                	cmp    $0x9,%al
    12ef:	b8 00 00 00 00       	mov    $0x0,%eax
    12f4:	77 1f                	ja     1315 <atoi+0x35>
    12f6:	8d 76 00             	lea    0x0(%esi),%esi
    12f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1300:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1303:	83 c1 01             	add    $0x1,%ecx
    1306:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    130a:	0f be 11             	movsbl (%ecx),%edx
    130d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1310:	80 fb 09             	cmp    $0x9,%bl
    1313:	76 eb                	jbe    1300 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    1315:	5b                   	pop    %ebx
    1316:	5d                   	pop    %ebp
    1317:	c3                   	ret    
    1318:	90                   	nop
    1319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001320 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1320:	55                   	push   %ebp
    1321:	89 e5                	mov    %esp,%ebp
    1323:	56                   	push   %esi
    1324:	53                   	push   %ebx
    1325:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1328:	8b 45 08             	mov    0x8(%ebp),%eax
    132b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    132e:	85 db                	test   %ebx,%ebx
    1330:	7e 14                	jle    1346 <memmove+0x26>
    1332:	31 d2                	xor    %edx,%edx
    1334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1338:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    133c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    133f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1342:	39 da                	cmp    %ebx,%edx
    1344:	75 f2                	jne    1338 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    1346:	5b                   	pop    %ebx
    1347:	5e                   	pop    %esi
    1348:	5d                   	pop    %ebp
    1349:	c3                   	ret    

0000134a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    134a:	b8 01 00 00 00       	mov    $0x1,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    

00001352 <exit>:
SYSCALL(exit)
    1352:	b8 02 00 00 00       	mov    $0x2,%eax
    1357:	cd 40                	int    $0x40
    1359:	c3                   	ret    

0000135a <wait>:
SYSCALL(wait)
    135a:	b8 03 00 00 00       	mov    $0x3,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <pipe>:
SYSCALL(pipe)
    1362:	b8 04 00 00 00       	mov    $0x4,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <read>:
SYSCALL(read)
    136a:	b8 05 00 00 00       	mov    $0x5,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    

00001372 <write>:
SYSCALL(write)
    1372:	b8 10 00 00 00       	mov    $0x10,%eax
    1377:	cd 40                	int    $0x40
    1379:	c3                   	ret    

0000137a <close>:
SYSCALL(close)
    137a:	b8 15 00 00 00       	mov    $0x15,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    

00001382 <kill>:
SYSCALL(kill)
    1382:	b8 06 00 00 00       	mov    $0x6,%eax
    1387:	cd 40                	int    $0x40
    1389:	c3                   	ret    

0000138a <exec>:
SYSCALL(exec)
    138a:	b8 07 00 00 00       	mov    $0x7,%eax
    138f:	cd 40                	int    $0x40
    1391:	c3                   	ret    

00001392 <open>:
SYSCALL(open)
    1392:	b8 0f 00 00 00       	mov    $0xf,%eax
    1397:	cd 40                	int    $0x40
    1399:	c3                   	ret    

0000139a <mknod>:
SYSCALL(mknod)
    139a:	b8 11 00 00 00       	mov    $0x11,%eax
    139f:	cd 40                	int    $0x40
    13a1:	c3                   	ret    

000013a2 <unlink>:
SYSCALL(unlink)
    13a2:	b8 12 00 00 00       	mov    $0x12,%eax
    13a7:	cd 40                	int    $0x40
    13a9:	c3                   	ret    

000013aa <fstat>:
SYSCALL(fstat)
    13aa:	b8 08 00 00 00       	mov    $0x8,%eax
    13af:	cd 40                	int    $0x40
    13b1:	c3                   	ret    

000013b2 <link>:
SYSCALL(link)
    13b2:	b8 13 00 00 00       	mov    $0x13,%eax
    13b7:	cd 40                	int    $0x40
    13b9:	c3                   	ret    

000013ba <mkdir>:
SYSCALL(mkdir)
    13ba:	b8 14 00 00 00       	mov    $0x14,%eax
    13bf:	cd 40                	int    $0x40
    13c1:	c3                   	ret    

000013c2 <chdir>:
SYSCALL(chdir)
    13c2:	b8 09 00 00 00       	mov    $0x9,%eax
    13c7:	cd 40                	int    $0x40
    13c9:	c3                   	ret    

000013ca <dup>:
SYSCALL(dup)
    13ca:	b8 0a 00 00 00       	mov    $0xa,%eax
    13cf:	cd 40                	int    $0x40
    13d1:	c3                   	ret    

000013d2 <getpid>:
SYSCALL(getpid)
    13d2:	b8 0b 00 00 00       	mov    $0xb,%eax
    13d7:	cd 40                	int    $0x40
    13d9:	c3                   	ret    

000013da <sbrk>:
SYSCALL(sbrk)
    13da:	b8 0c 00 00 00       	mov    $0xc,%eax
    13df:	cd 40                	int    $0x40
    13e1:	c3                   	ret    

000013e2 <sleep>:
SYSCALL(sleep)
    13e2:	b8 0d 00 00 00       	mov    $0xd,%eax
    13e7:	cd 40                	int    $0x40
    13e9:	c3                   	ret    

000013ea <uptime>:
SYSCALL(uptime)
    13ea:	b8 0e 00 00 00       	mov    $0xe,%eax
    13ef:	cd 40                	int    $0x40
    13f1:	c3                   	ret    
    13f2:	66 90                	xchg   %ax,%ax
    13f4:	66 90                	xchg   %ax,%ax
    13f6:	66 90                	xchg   %ax,%ax
    13f8:	66 90                	xchg   %ax,%ax
    13fa:	66 90                	xchg   %ax,%ax
    13fc:	66 90                	xchg   %ax,%ax
    13fe:	66 90                	xchg   %ax,%ax

00001400 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	57                   	push   %edi
    1404:	56                   	push   %esi
    1405:	53                   	push   %ebx
    1406:	89 c6                	mov    %eax,%esi
    1408:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    140b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    140e:	85 db                	test   %ebx,%ebx
    1410:	74 7e                	je     1490 <printint+0x90>
    1412:	89 d0                	mov    %edx,%eax
    1414:	c1 e8 1f             	shr    $0x1f,%eax
    1417:	84 c0                	test   %al,%al
    1419:	74 75                	je     1490 <printint+0x90>
    neg = 1;
    x = -xx;
    141b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    141d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    1424:	f7 d8                	neg    %eax
    1426:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1429:	31 ff                	xor    %edi,%edi
    142b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    142e:	89 ce                	mov    %ecx,%esi
    1430:	eb 08                	jmp    143a <printint+0x3a>
    1432:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1438:	89 cf                	mov    %ecx,%edi
    143a:	31 d2                	xor    %edx,%edx
    143c:	8d 4f 01             	lea    0x1(%edi),%ecx
    143f:	f7 f6                	div    %esi
    1441:	0f b6 92 00 18 00 00 	movzbl 0x1800(%edx),%edx
  }while((x /= base) != 0);
    1448:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    144a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    144d:	75 e9                	jne    1438 <printint+0x38>
  if(neg)
    144f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1452:	8b 75 c0             	mov    -0x40(%ebp),%esi
    1455:	85 c0                	test   %eax,%eax
    1457:	74 08                	je     1461 <printint+0x61>
    buf[i++] = '-';
    1459:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    145e:	8d 4f 02             	lea    0x2(%edi),%ecx
    1461:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    1465:	8d 76 00             	lea    0x0(%esi),%esi
    1468:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    146b:	83 ec 04             	sub    $0x4,%esp
    146e:	83 ef 01             	sub    $0x1,%edi
    1471:	6a 01                	push   $0x1
    1473:	53                   	push   %ebx
    1474:	56                   	push   %esi
    1475:	88 45 d7             	mov    %al,-0x29(%ebp)
    1478:	e8 f5 fe ff ff       	call   1372 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    147d:	83 c4 10             	add    $0x10,%esp
    1480:	39 df                	cmp    %ebx,%edi
    1482:	75 e4                	jne    1468 <printint+0x68>
    putc(fd, buf[i]);
}
    1484:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1487:	5b                   	pop    %ebx
    1488:	5e                   	pop    %esi
    1489:	5f                   	pop    %edi
    148a:	5d                   	pop    %ebp
    148b:	c3                   	ret    
    148c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    1490:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1492:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1499:	eb 8b                	jmp    1426 <printint+0x26>
    149b:	90                   	nop
    149c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000014a0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14a0:	55                   	push   %ebp
    14a1:	89 e5                	mov    %esp,%ebp
    14a3:	57                   	push   %edi
    14a4:	56                   	push   %esi
    14a5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14a6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14a9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14ac:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14af:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14b2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14b5:	0f b6 1e             	movzbl (%esi),%ebx
    14b8:	83 c6 01             	add    $0x1,%esi
    14bb:	84 db                	test   %bl,%bl
    14bd:	0f 84 b0 00 00 00    	je     1573 <printf+0xd3>
    14c3:	31 d2                	xor    %edx,%edx
    14c5:	eb 39                	jmp    1500 <printf+0x60>
    14c7:	89 f6                	mov    %esi,%esi
    14c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    14d0:	83 f8 25             	cmp    $0x25,%eax
    14d3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    14d6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    14db:	74 18                	je     14f5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14dd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    14e0:	83 ec 04             	sub    $0x4,%esp
    14e3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    14e6:	6a 01                	push   $0x1
    14e8:	50                   	push   %eax
    14e9:	57                   	push   %edi
    14ea:	e8 83 fe ff ff       	call   1372 <write>
    14ef:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    14f2:	83 c4 10             	add    $0x10,%esp
    14f5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14f8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    14fc:	84 db                	test   %bl,%bl
    14fe:	74 73                	je     1573 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    1500:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    1502:	0f be cb             	movsbl %bl,%ecx
    1505:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1508:	74 c6                	je     14d0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    150a:	83 fa 25             	cmp    $0x25,%edx
    150d:	75 e6                	jne    14f5 <printf+0x55>
      if(c == 'd'){
    150f:	83 f8 64             	cmp    $0x64,%eax
    1512:	0f 84 f8 00 00 00    	je     1610 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1518:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    151e:	83 f9 70             	cmp    $0x70,%ecx
    1521:	74 5d                	je     1580 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1523:	83 f8 73             	cmp    $0x73,%eax
    1526:	0f 84 84 00 00 00    	je     15b0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    152c:	83 f8 63             	cmp    $0x63,%eax
    152f:	0f 84 ea 00 00 00    	je     161f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1535:	83 f8 25             	cmp    $0x25,%eax
    1538:	0f 84 c2 00 00 00    	je     1600 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    153e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1541:	83 ec 04             	sub    $0x4,%esp
    1544:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1548:	6a 01                	push   $0x1
    154a:	50                   	push   %eax
    154b:	57                   	push   %edi
    154c:	e8 21 fe ff ff       	call   1372 <write>
    1551:	83 c4 0c             	add    $0xc,%esp
    1554:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1557:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    155a:	6a 01                	push   $0x1
    155c:	50                   	push   %eax
    155d:	57                   	push   %edi
    155e:	83 c6 01             	add    $0x1,%esi
    1561:	e8 0c fe ff ff       	call   1372 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1566:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    156a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    156d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    156f:	84 db                	test   %bl,%bl
    1571:	75 8d                	jne    1500 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1573:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1576:	5b                   	pop    %ebx
    1577:	5e                   	pop    %esi
    1578:	5f                   	pop    %edi
    1579:	5d                   	pop    %ebp
    157a:	c3                   	ret    
    157b:	90                   	nop
    157c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    1580:	83 ec 0c             	sub    $0xc,%esp
    1583:	b9 10 00 00 00       	mov    $0x10,%ecx
    1588:	6a 00                	push   $0x0
    158a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    158d:	89 f8                	mov    %edi,%eax
    158f:	8b 13                	mov    (%ebx),%edx
    1591:	e8 6a fe ff ff       	call   1400 <printint>
        ap++;
    1596:	89 d8                	mov    %ebx,%eax
    1598:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    159b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    159d:	83 c0 04             	add    $0x4,%eax
    15a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    15a3:	e9 4d ff ff ff       	jmp    14f5 <printf+0x55>
    15a8:	90                   	nop
    15a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    15b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15b3:	8b 18                	mov    (%eax),%ebx
        ap++;
    15b5:	83 c0 04             	add    $0x4,%eax
    15b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    15bb:	b8 f8 17 00 00       	mov    $0x17f8,%eax
    15c0:	85 db                	test   %ebx,%ebx
    15c2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    15c5:	0f b6 03             	movzbl (%ebx),%eax
    15c8:	84 c0                	test   %al,%al
    15ca:	74 23                	je     15ef <printf+0x14f>
    15cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15d0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15d3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    15d6:	83 ec 04             	sub    $0x4,%esp
    15d9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    15db:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15de:	50                   	push   %eax
    15df:	57                   	push   %edi
    15e0:	e8 8d fd ff ff       	call   1372 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    15e5:	0f b6 03             	movzbl (%ebx),%eax
    15e8:	83 c4 10             	add    $0x10,%esp
    15eb:	84 c0                	test   %al,%al
    15ed:	75 e1                	jne    15d0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    15ef:	31 d2                	xor    %edx,%edx
    15f1:	e9 ff fe ff ff       	jmp    14f5 <printf+0x55>
    15f6:	8d 76 00             	lea    0x0(%esi),%esi
    15f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1600:	83 ec 04             	sub    $0x4,%esp
    1603:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    1606:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1609:	6a 01                	push   $0x1
    160b:	e9 4c ff ff ff       	jmp    155c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    1610:	83 ec 0c             	sub    $0xc,%esp
    1613:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1618:	6a 01                	push   $0x1
    161a:	e9 6b ff ff ff       	jmp    158a <printf+0xea>
    161f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1622:	83 ec 04             	sub    $0x4,%esp
    1625:	8b 03                	mov    (%ebx),%eax
    1627:	6a 01                	push   $0x1
    1629:	88 45 e4             	mov    %al,-0x1c(%ebp)
    162c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    162f:	50                   	push   %eax
    1630:	57                   	push   %edi
    1631:	e8 3c fd ff ff       	call   1372 <write>
    1636:	e9 5b ff ff ff       	jmp    1596 <printf+0xf6>
    163b:	66 90                	xchg   %ax,%ax
    163d:	66 90                	xchg   %ax,%ax
    163f:	90                   	nop

00001640 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1640:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1641:	a1 e0 1a 00 00       	mov    0x1ae0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    1646:	89 e5                	mov    %esp,%ebp
    1648:	57                   	push   %edi
    1649:	56                   	push   %esi
    164a:	53                   	push   %ebx
    164b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    164e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1650:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1653:	39 c8                	cmp    %ecx,%eax
    1655:	73 19                	jae    1670 <free+0x30>
    1657:	89 f6                	mov    %esi,%esi
    1659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1660:	39 d1                	cmp    %edx,%ecx
    1662:	72 1c                	jb     1680 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1664:	39 d0                	cmp    %edx,%eax
    1666:	73 18                	jae    1680 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    1668:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    166a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    166c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    166e:	72 f0                	jb     1660 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1670:	39 d0                	cmp    %edx,%eax
    1672:	72 f4                	jb     1668 <free+0x28>
    1674:	39 d1                	cmp    %edx,%ecx
    1676:	73 f0                	jae    1668 <free+0x28>
    1678:	90                   	nop
    1679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    1680:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1683:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1686:	39 d7                	cmp    %edx,%edi
    1688:	74 19                	je     16a3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    168a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    168d:	8b 50 04             	mov    0x4(%eax),%edx
    1690:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1693:	39 f1                	cmp    %esi,%ecx
    1695:	74 23                	je     16ba <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1697:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1699:	a3 e0 1a 00 00       	mov    %eax,0x1ae0
}
    169e:	5b                   	pop    %ebx
    169f:	5e                   	pop    %esi
    16a0:	5f                   	pop    %edi
    16a1:	5d                   	pop    %ebp
    16a2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    16a3:	03 72 04             	add    0x4(%edx),%esi
    16a6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    16a9:	8b 10                	mov    (%eax),%edx
    16ab:	8b 12                	mov    (%edx),%edx
    16ad:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    16b0:	8b 50 04             	mov    0x4(%eax),%edx
    16b3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    16b6:	39 f1                	cmp    %esi,%ecx
    16b8:	75 dd                	jne    1697 <free+0x57>
    p->s.size += bp->s.size;
    16ba:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    16bd:	a3 e0 1a 00 00       	mov    %eax,0x1ae0
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    16c2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16c5:	8b 53 f8             	mov    -0x8(%ebx),%edx
    16c8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    16ca:	5b                   	pop    %ebx
    16cb:	5e                   	pop    %esi
    16cc:	5f                   	pop    %edi
    16cd:	5d                   	pop    %ebp
    16ce:	c3                   	ret    
    16cf:	90                   	nop

000016d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    16d0:	55                   	push   %ebp
    16d1:	89 e5                	mov    %esp,%ebp
    16d3:	57                   	push   %edi
    16d4:	56                   	push   %esi
    16d5:	53                   	push   %ebx
    16d6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    16dc:	8b 15 e0 1a 00 00    	mov    0x1ae0,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16e2:	8d 78 07             	lea    0x7(%eax),%edi
    16e5:	c1 ef 03             	shr    $0x3,%edi
    16e8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    16eb:	85 d2                	test   %edx,%edx
    16ed:	0f 84 a3 00 00 00    	je     1796 <malloc+0xc6>
    16f3:	8b 02                	mov    (%edx),%eax
    16f5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    16f8:	39 cf                	cmp    %ecx,%edi
    16fa:	76 74                	jbe    1770 <malloc+0xa0>
    16fc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1702:	be 00 10 00 00       	mov    $0x1000,%esi
    1707:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    170e:	0f 43 f7             	cmovae %edi,%esi
    1711:	ba 00 80 00 00       	mov    $0x8000,%edx
    1716:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    171c:	0f 46 da             	cmovbe %edx,%ebx
    171f:	eb 10                	jmp    1731 <malloc+0x61>
    1721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1728:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    172a:	8b 48 04             	mov    0x4(%eax),%ecx
    172d:	39 cf                	cmp    %ecx,%edi
    172f:	76 3f                	jbe    1770 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1731:	39 05 e0 1a 00 00    	cmp    %eax,0x1ae0
    1737:	89 c2                	mov    %eax,%edx
    1739:	75 ed                	jne    1728 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    173b:	83 ec 0c             	sub    $0xc,%esp
    173e:	53                   	push   %ebx
    173f:	e8 96 fc ff ff       	call   13da <sbrk>
  if(p == (char*)-1)
    1744:	83 c4 10             	add    $0x10,%esp
    1747:	83 f8 ff             	cmp    $0xffffffff,%eax
    174a:	74 1c                	je     1768 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    174c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    174f:	83 ec 0c             	sub    $0xc,%esp
    1752:	83 c0 08             	add    $0x8,%eax
    1755:	50                   	push   %eax
    1756:	e8 e5 fe ff ff       	call   1640 <free>
  return freep;
    175b:	8b 15 e0 1a 00 00    	mov    0x1ae0,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1761:	83 c4 10             	add    $0x10,%esp
    1764:	85 d2                	test   %edx,%edx
    1766:	75 c0                	jne    1728 <malloc+0x58>
        return 0;
    1768:	31 c0                	xor    %eax,%eax
    176a:	eb 1c                	jmp    1788 <malloc+0xb8>
    176c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1770:	39 cf                	cmp    %ecx,%edi
    1772:	74 1c                	je     1790 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1774:	29 f9                	sub    %edi,%ecx
    1776:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1779:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    177c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    177f:	89 15 e0 1a 00 00    	mov    %edx,0x1ae0
      return (void*)(p + 1);
    1785:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1788:	8d 65 f4             	lea    -0xc(%ebp),%esp
    178b:	5b                   	pop    %ebx
    178c:	5e                   	pop    %esi
    178d:	5f                   	pop    %edi
    178e:	5d                   	pop    %ebp
    178f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1790:	8b 08                	mov    (%eax),%ecx
    1792:	89 0a                	mov    %ecx,(%edx)
    1794:	eb e9                	jmp    177f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1796:	c7 05 e0 1a 00 00 e4 	movl   $0x1ae4,0x1ae0
    179d:	1a 00 00 
    17a0:	c7 05 e4 1a 00 00 e4 	movl   $0x1ae4,0x1ae4
    17a7:	1a 00 00 
    base.s.size = 0;
    17aa:	b8 e4 1a 00 00       	mov    $0x1ae4,%eax
    17af:	c7 05 e8 1a 00 00 00 	movl   $0x0,0x1ae8
    17b6:	00 00 00 
    17b9:	e9 3e ff ff ff       	jmp    16fc <malloc+0x2c>
