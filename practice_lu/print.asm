;extern _printf
global _start
section .data
msg db "Hola Mundo!", 10, "entero %d", 10, 0
section .text
_start:
    push EBP
    mov EBP, ESP
    mov EAX, 1234
    push EAX
    push msg
   ; call _printf
    add ESP, 8
    pop EBP
    ret
