{

 github.com/JonathanDotCel
 Use at your own risk.

}

define(address,"server.dll"+33DDE5)
define(bytes,76 58 F3 0F 10 50 40)

[ENABLE]

assert(address,bytes)
alloc(newmem,$1000)

label(code)
label(return)

newmem:

code:
  //jna server.dll+33DE3F
  jmp server.dll+33DE3F
  movss xmm2,[eax+40]
  jmp return

address:
  jmp newmem
  nop
  nop
return:

[DISABLE]

address:
  db bytes
  // jna server.dll+33DE3F
  // movss xmm2,[eax+40]

dealloc(newmem)

{
// ORIGINAL CODE - INJECTION POINT: "server.dll"+33DDE5

"server.dll"+33DDBA: F3 0F 10 50 44           -  movss xmm2,[eax+44]
"server.dll"+33DDBF: F3 0F 10 60 40           -  movss xmm4,[eax+40]
"server.dll"+33DDC4: F3 0F 59 E4              -  mulss xmm4,xmm4
"server.dll"+33DDC8: F3 0F 59 D2              -  mulss xmm2,xmm2
"server.dll"+33DDCC: 83 C4 04                 -  add esp,04
"server.dll"+33DDCF: F3 0F 58 E2              -  addss xmm4,xmm2
"server.dll"+33DDD3: 0F 2F 25 C8 98 5C 25     -  comiss xmm4,[server.dll+5998C8]
"server.dll"+33DDDA: 0F 28 F0                 -  movaps xmm6,xmm0
"server.dll"+33DDDD: 0F 28 E8                 -  movaps xmm5,xmm0
"server.dll"+33DDE0: F3 0F 11 45 C8           -  movss [ebp-38],xmm0
// ---------- INJECTING HERE ----------
"server.dll"+33DDE5: 76 58                    -  jna server.dll+33DE3F
"server.dll"+33DDE7: F3 0F 10 50 40           -  movss xmm2,[eax+40]
// ---------- DONE INJECTING  ----------
"server.dll"+33DDEC: F3 0F 10 25 78 C6 5C 25  -  movss xmm4,[server.dll+59C678]
"server.dll"+33DDF4: 0F 2F D4                 -  comiss xmm2,xmm4
"server.dll"+33DDF7: F3 0F 10 3D 1C 40 69 25  -  movss xmm7,[server.dll+66401C]
"server.dll"+33DDFF: 76 05                    -  jna server.dll+33DE06
"server.dll"+33DE01: 0F 2F C3                 -  comiss xmm0,xmm3
"server.dll"+33DE04: 77 0A                    -  ja server.dll+33DE10
"server.dll"+33DE06: 0F 2F FA                 -  comiss xmm7,xmm2
"server.dll"+33DE09: 76 0D                    -  jna server.dll+33DE18
"server.dll"+33DE0B: 0F 2F D8                 -  comiss xmm3,xmm0
"server.dll"+33DE0E: 76 08                    -  jna server.dll+33DE18
}