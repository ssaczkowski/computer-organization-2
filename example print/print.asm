global _start
section .data

section .text

  extern _printf

_start:
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

message db "Register = %08X", 10, 0
