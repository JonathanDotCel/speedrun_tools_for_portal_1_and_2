{

 github.com/JonathanDotCel
 Use at your own risk.

}

define(address,"client.dll"+1C7279)
define(bytes,F3 0F 10 45 D0)

[ENABLE]

assert(address,bytes)
alloc(newmem,$1000)

label(code)
label(return)

newmem:

code:
  //movss xmm0,[ebp-30]
  xorps xmm0,xmm0
  jmp return

address:
  jmp newmem
return:

[DISABLE]

address:
  db bytes
  // movss xmm0,[ebp-30]

dealloc(newmem)

{
// ORIGINAL CODE - INJECTION POINT: "client.dll"+1C7279

"client.dll"+1C7251: A1 9C 5B EF 25           -  mov eax,[client.dll+E55B9C]
"client.dll"+1C7256: FF 45 F8                 -  inc [ebp-08]
"client.dll"+1C7259: 03 7D E4                 -  add edi,[ebp-1C]
"client.dll"+1C725C: 8B 08                    -  mov ecx,[eax]
"client.dll"+1C725E: F3 0F 59 C0              -  mulss xmm0,xmm0
"client.dll"+1C7262: F3 0F 11 45 DC           -  movss [ebp-24],xmm0
"client.dll"+1C7267: F3 0F 10 45 CC           -  movss xmm0,[ebp-34]
"client.dll"+1C726C: F3 0F 10 4D DC           -  movss xmm1,[ebp-24]
"client.dll"+1C7271: F3 0F 59 C0              -  mulss xmm0,xmm0
"client.dll"+1C7275: F3 0F 58 C8              -  addss xmm1,xmm0
// ---------- INJECTING HERE ----------
"client.dll"+1C7279: F3 0F 10 45 D0           -  movss xmm0,[ebp-30]
// ---------- DONE INJECTING  ----------
"client.dll"+1C727E: F3 0F 59 C0              -  mulss xmm0,xmm0
"client.dll"+1C7282: F3 0F 58 C8              -  addss xmm1,xmm0
"client.dll"+1C7286: 0F 57 C0                 -  xorps xmm0,xmm0
"client.dll"+1C7289: F3 0F 10 C1              -  movss xmm0,xmm1
"client.dll"+1C728D: F3 0F 51 C0              -  sqrtss xmm0,xmm0
"client.dll"+1C7291: 0F 29 45 90              -  movaps [ebp-70],xmm0
"client.dll"+1C7295: F3 0F 10 45 90           -  movss xmm0,[ebp-70]
"client.dll"+1C729A: 8B 96 5C 01 00 00        -  mov edx,[esi+0000015C]
"client.dll"+1C72A0: 83 C4 34                 -  add esp,34
"client.dll"+1C72A3: 0F 5A C0                 -  cvtps2pd xmm0,xmm0
}