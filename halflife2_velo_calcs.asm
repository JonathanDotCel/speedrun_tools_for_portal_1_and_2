{

  github.com/JonathanDotCel
  Use at your own risk!

}

define(address,"client.dll"+19135A)
define(bytes,D9 45 E4 DC C8)

[ENABLE]

assert(address,bytes)
alloc(newmem,$1000)

label(code)
label(return)

newmem:

code:
//  fld dword ptr [ebp-1C]
  fldz
  fmul st(0),st(0)
  jmp return

address:
  jmp newmem
return:

[DISABLE]

address:
  db bytes
  // fld dword ptr [ebp-1C]
  // fmul st(0),st(0)

dealloc(newmem)

{
// ORIGINAL CODE - INJECTION POINT: "client.dll"+19135A

"client.dll"+191339: F3 0F 11 45 E4           -  movss [ebp-1C],xmm0
"client.dll"+19133E: D9 45 E0                 -  fld dword ptr [ebp-20]
"client.dll"+191341: 83 EC 08                 -  sub esp,08
"client.dll"+191344: DC C8                    -  fmul st(0),st(0)
"client.dll"+191346: D9 45 DC                 -  fld dword ptr [ebp-24]
"client.dll"+191349: DC C8                    -  fmul st(0),st(0)
"client.dll"+19134B: A1 94 58 08 7A           -  mov eax,[client.dll+4D5894]
"client.dll"+191350: 8B 0D 98 58 08 7A        -  mov ecx,[client.dll+4D5898]
"client.dll"+191356: DE C1                    -  faddp 
"client.dll"+191358: 8B 30                    -  mov esi,[eax]
// ---------- INJECTING HERE ----------
"client.dll"+19135A: D9 45 E4                 -  fld dword ptr [ebp-1C]
"client.dll"+19135D: DC C8                    -  fmul st(0),st(0)
// ---------- DONE INJECTING  ----------
"client.dll"+19135F: 8B 01                    -  mov eax,[ecx]
"client.dll"+191361: DE C1                    -  faddp 
"client.dll"+191363: D9 FA                    -  fsqrt 
"client.dll"+191365: DD 1C 24                 -  fstp qword ptr [esp]
"client.dll"+191368: 68 C8 17 F2 79           -  push client.dll+3717C8
"client.dll"+19136D: 68 FF 00 00 00           -  push 000000FF
"client.dll"+191372: 68 FF 00 00 00           -  push 000000FF
"client.dll"+191377: 68 FF 00 00 00           -  push 000000FF
"client.dll"+19137C: 68 FF 00 00 00           -  push 000000FF
"client.dll"+191381: FF B3 84 01 00 00        -  push [ebx+00000184]
}