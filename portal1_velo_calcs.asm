{

 github.com/JonathanDotCel
 Use at your own risk.

}

define(address,"client.dll"+151282)
define(bytes,F3 0F 10 90 F8 00 00 00)

[ENABLE]

assert(address,bytes)
alloc(newmem,$1000)

label(code)
label(return)

newmem:

code:
//  movss xmm2,[eax+000000F8]
  xorps xmm2,xmm2
  jmp return

address:
  jmp newmem
  nop
  nop
  nop
return:

[DISABLE]

address:
  db bytes
  // movss xmm2,[eax+000000F8]

dealloc(newmem)

{
// ORIGINAL CODE - INJECTION POINT: "client.dll"+151282

"client.dll"+151256: 83 C4 3C                 -  add esp,3C
"client.dll"+151259: 47                       -  inc edi
"client.dll"+15125A: F3 0F 11 45 DC           -  movss [ebp-24],xmm0
"client.dll"+15125F: F3 0F 11 45 E0           -  movss [ebp-20],xmm0
"client.dll"+151264: F3 0F 11 45 E4           -  movss [ebp-1C],xmm0
"client.dll"+151269: E8 52 C9 EF FF           -  call client.dll+4DBC0
"client.dll"+15126E: 85 C0                    -  test eax,eax
"client.dll"+151270: 74 1A                    -  je client.dll+15128C
"client.dll"+151272: F3 0F 10 80 F0 00 00 00  -  movss xmm0,[eax+000000F0]
"client.dll"+15127A: F3 0F 10 88 F4 00 00 00  -  movss xmm1,[eax+000000F4]
// ---------- INJECTING HERE ----------
"client.dll"+151282: F3 0F 10 90 F8 00 00 00  -  movss xmm2,[eax+000000F8]
// ---------- DONE INJECTING  ----------
"client.dll"+15128A: EB 0F                    -  jmp client.dll+15129B
"client.dll"+15128C: F3 0F 10 55 E4           -  movss xmm2,[ebp-1C]
"client.dll"+151291: F3 0F 10 4D E0           -  movss xmm1,[ebp-20]
"client.dll"+151296: F3 0F 10 45 DC           -  movss xmm0,[ebp-24]
"client.dll"+15129B: 8B 15 58 C9 2E 7B        -  mov edx,[client.dll+5BC958]
"client.dll"+1512A1: 8B 0D 60 C9 2E 7B        -  mov ecx,[client.dll+5BC960]
"client.dll"+1512A7: 8B 1A                    -  mov ebx,[edx]
"client.dll"+1512A9: 8B 01                    -  mov eax,[ecx]
"client.dll"+1512AB: 8B 96 84 01 00 00        -  mov edx,[esi+00000184]
"client.dll"+1512B1: 8B 80 14 01 00 00        -  mov eax,[eax+00000114]
}