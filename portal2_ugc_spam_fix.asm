{

 github.com/JonathanDotCel
 Use at your own risk.

}

define(address,"client.dll"+41145A)
define(bytes,75 0B 8D 8E 10 01 00 00)

[ENABLE]

assert(address,bytes)
alloc(newmem,$1000)

label(code)
label(return)

newmem:

code:
  //jne client.dll+411467
  jmp client.dll+411467
  lea ecx,[esi+00000110]
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
  // jne client.dll+411467
  // lea ecx,[esi+00000110]

dealloc(newmem)

{
// ORIGINAL CODE - INJECTION POINT: "client.dll"+41145A

"client.dll"+411449: CC                    -  int 3 
"client.dll"+41144A: CC                    -  int 3 
"client.dll"+41144B: CC                    -  int 3 
"client.dll"+41144C: CC                    -  int 3 
"client.dll"+41144D: CC                    -  int 3 
"client.dll"+41144E: CC                    -  int 3 
"client.dll"+41144F: CC                    -  int 3 
"client.dll"+411450: 56                    -  push esi
"client.dll"+411451: 8B F1                 -  mov esi,ecx
"client.dll"+411453: 80 BE 44 01 00 00 00  -  cmp byte ptr [esi+00000144],00
// ---------- INJECTING HERE ----------
"client.dll"+41145A: 75 0B                 -  jne client.dll+411467
"client.dll"+41145C: 8D 8E 10 01 00 00     -  lea ecx,[esi+00000110]
// ---------- DONE INJECTING  ----------
"client.dll"+411462: E8 99 EA FF FF        -  call client.dll+40FF00
"client.dll"+411467: 8D 4E 70              -  lea ecx,[esi+70]
"client.dll"+41146A: 5E                    -  pop esi
"client.dll"+41146B: E9 10 C7 FF FF        -  jmp client.dll+40DB80
"client.dll"+411470: 55                    -  push ebp
"client.dll"+411471: 8B EC                 -  mov ebp,esp
"client.dll"+411473: A1 80 50 9C 25        -  mov eax,[client.dll+925080]
"client.dll"+411478: 53                    -  push ebx
"client.dll"+411479: 8B D9                 -  mov ebx,ecx
"client.dll"+41147B: 85 C0                 -  test eax,eax
}