
section .data
T: db "Hola:)",10,0
fmt:    db "%s", 0
fmt_Sum: db "suma: %d" , 10, 0
fmt_Sub: db "resta: %d" , 10, 0
fmt_Mul: db "multi: %d" , 10, 0
fmt_Res: db "Division Resto: %d" , 10, 0
fmt_Cos: db "Division Cociente: %d" , 10, 0
cos: dw 0
res: dw 0
; Enteros sin signo de 8 bits
N1: db 7
N2: db 2
; Enteros de 16 bits
N3: dw 42
N4: dw 6
; Enteros de 32 bits
N5: dd 0x5555,0x64300000
N6: dd 0x4434,0xF2320000
N_5: dd 35
N_6: dd 5
; Enteros sin signo de 64 bits
N7: dq 7
N8: dq 8
;Punto flotante de precisión simple
F1: dd 1.0
;Punto flotante de precisión doble
F2: dq 2.0

section .text

extern  _printf

global _main

 _main:

        push ebp
        mov ebp, esp   ;pass the reference of reg esp to ebp
        ;PRINT_STRING [T]
        push T
        push dword fmt
        call _printf

        add esp, 8
        mov esp,ebp
        pop ebp


       ;PRINT_UDEC sin signo PRINT_HEX hexa new_line
       ;suma de dos numeros de 8 bits (N1 + N2 = 3)
         push ebp
         mov ebp,esp
         MOV AL,[N1]
         ADD AL,[N2]
         push EAX
         push dword fmt_Sum
         call _printf

         add esp, 8
         mov esp,ebp
         pop ebp

         mov eax, 0



;PRINT_DEC 1,AH
;NEWLINE

;resta de dos numeros de 16 bits (N3 - N4 = -1)
         push ebp
         mov ebp,esp
         mov BX,[N3]
         SUB BX,[N4]
         push EBX
         push dword fmt_Sub
         call _printf

         add esp, 8
         mov esp,ebp
         pop ebp

         mov eax, 0
;PRINT_DEC 2,BX
;NEWLINE

;multiplicacion de numeros de 8 bits (N1 * N2 = 2)
         push ebp
         mov ebp,esp
         mov AX,[N1]
         mov BL,[N2]
         MUL BL
         push EAX
         push dword fmt_Mul
         call _printf

         add esp, 8
         mov esp,ebp
         pop ebp

         mov eax, 0

;PRINT_DEC 2,BL
;NEWLINE

;Cociente (AL) y resto (AH) de la división entera N3/N4
        push ebp
        mov ebp,esp
        mov EAX,0
        mov EBX,0
        mov ECX,0
        mov EDX,0
        mov AX,[N3]
        mov BX,[N4]
        DIV BX
        mov [cos],BX
        push DX
        push dword fmt_Res
        call _printf

        add esp, 8
        mov esp,ebp
        pop ebp

        mov eax, 0

        push ebp
        mov ebp,esp
        mov CX,[cos]
        push CX
        push dword fmt_Cos
        call _printf

        add esp, 8
        mov esp,ebp
        pop ebp
        mov eax, 0
;PRINT_DEC 2,AH
;NEWLINE
;PRINT_DEC 2,AL
;NEWLINE
;Suma de numeros de 64 bits
;N5: dd 0x5555,0x64300000
;N6: dd 0x4434,0xF2320000

;mov eax,[N5+4]
;add eax,[N6+4]
;mov ebx,[N5]
;adc ebx,[N6]
;PRINT_HEX 4,ebx
;PRINT_HEX 4,eax
;NEWLINE

;Division de nuemros de 32 bits mostrar resto y cociente
;mov EAX,[N_5]
;mov ECX,[N_6]
;DIV ECX
;PRINT_DEC 4,AX
;NEWLINE
;PRINT_DEC 4,DX
;NEWLINE
;xor eax, eax
ret
