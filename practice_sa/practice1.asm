section .data
extern _printf

T: db "Hola Mundo",13,10,0
; Enteros sin signo de 8 bits
N1: db 1
N2: db 2
; Enteros de 16 bits
N3: dw 10
N4: dw 5
; Enteros de 32 bits
N_5: dd 35
N_6: dd 5
; Enteros de 32 bits 
N5: dd 35
N6: dd 5
; Enteros sin signo de 64 bits
N7: dq 7
N8: dq 8
;Punto flotante de precisión simple
F1: dd 1.0
;Punto flotante de precisión doble
F2: dq 2.0
; Enteros de 64 bits
N64_1: dd 0x1005,0x63120000;cada dos 8 bits = total 32bits
N64_2: dd 0x0100,0xF1210000
;Resultado de division 32 bits
resultado: dd 0
;Double F. 128 bits
numero128_1: dq 2.5
numero128_2: dq 3.0
;Imprimir register
print_register db "Register = %08X", 10, 0

section .text

global _main
_syscall:
    int     0x80                                ;system call
	  ret

_main:
    push EBP
    mov EBP, ESP
    ;PRINT_STRING [T]
    ;PRIND_UDEC sin signo PRINT_HEX hexa newline

    ;suma de dos numeros de 8 bits (N1 + N2)
    mov AH,[N1]
    ADD AH,[N2]
    ;PRINT_DEC 1,AH

    mov bx, 8
    push bx
    push print_register
    call _printf
    add ESP, 8

    ;resta de dos numeros de 16 bits (N3 - N4 )
    mov BX,[N3]
    SUB BX,[N4]
    ;PRINT_DEC 2,BX

    ;multiplicacion de numeros de 8 bits (N1 * N2 )
    mov AL,[N1]
    mov BL,[N2]
    MUL BL
    ;PRINT_DEC 2,BL

     ;Cociente (AL) y resto (AH) de la división entera 16 bits (N3/N4 )
    ;TO DO

    mov AX,[N3]
    mov BL,[N4]
    DIV BL
    ;PRINT_DEC 2,AH
    ;PRINT_DEC 2,AL


    ;Suma de dos números de 32 bits. (N5 + N6)
    mov EAX,[N5]
    ADD EAX,[N6]
    ;PRINT_DEC 4,EAX

    ;Suma de dos números de 64 bits usando reg de 32. (N64_1 + N64_2)
    mov EAX,[N64_1+4]
    ADD EAX,[N64_2+4]
    mov EBX,[N64_1]
    ADC EBX,[N64_2]
    ;PRINT_HEX 4,EBX
    ;PRINT_HEX 4,EAX

    ;Cociente y resto de la división N5/N6 usando registros de 32 bits
    MOV EDX, 0; limpio para que no retorne: (SIGFPE) https://stackoverflow.com/questions/8649180/assembly-divisions-and-floating-points
    MOV EAX,[N_5]
    MOV ECX,[N_6]
    DIV ECX

    ;PRINT_DEC 4,AX
    ;PRINT_DEC 4,DX

    mov [resultado],AX
    ;PRINT_DEC 4,resultado

    ;Cómo podría resolver la suma de números de 128 bits, usando registros de 32 bits

    mov  ESP, EBP
    pop EBP
    ret
    ;push    dword 0                             ;exit code
   ;mov     eax,0x1                             ;system call number (sys_exit)
   ;call    _syscall                            ;call kernel
