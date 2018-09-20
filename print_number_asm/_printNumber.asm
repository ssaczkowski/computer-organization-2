

section .data

message db "Register = %08X", 10, 0

section .text
global _main
extern _printf

_main:
     push    ebp
     mov     ebp, esp

     mov eax, 0xDEADBEEF
     push eax
     push message
     call _printf
     add esp, 8

     mov  ESP, EBP
     pop     EBP
     ret
