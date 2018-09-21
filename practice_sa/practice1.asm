global _practice1

section .data

; Formatos de print
fmt_number_suma_N1_N2: db "N1 + N2 = %d", 10, 0
fmt_number_resta_N3_N4: db "N3 - N4 = %d", 10, 0
fmt_number_mul_N1_N2: db "N3 * N4 = %d", 10, 0
fmt_number_div_N3_N4: db "N3 / N4 = %04X (Primeros dos valores resto y los otros dos cociente)", 10, 0
fmt_number_sum_N5_N6: db "N5 + N6 = %d", 10, 0
fmt_number_sum_N64_1_and_N64_2: db "%032X",10,0
fmt_string:    db "%s", 10,0

; Cadena de caracteres
T: db "Hola Mundo",13,10,0

; Enteros sin signo de 8 bits
N1: db 1
N2: db 2

; Enteros de 16 bits
N3: dw 11
N4: dw 5

; Enteros de 32 bits
N5: dd 35
N6: dd 5

; Enteros sin signo de 64 bits
N7: dq 7
N8: dq 8

; Punto flotante de precisión simple
F1: dd 1.0

; Punto flotante de precisión doble
F2: dq 2.0

; Enteros de 64 bits
N64_1: dd 0x00001001,0x0000F312 ;OBS! cada dos equiv. 8 bits = total 32bits
N64_2: dd 0x0000010F,0x0000F121


section .text

extern _printf

_practice1:
    ; Imprimo cadena de caracteres asciiz
    push ebp
    mov ebp, esp

    push T
    push dword fmt_string
    call _printf
    add esp, 8

    mov esp,ebp
    pop ebp

    ; Suma de dos numeros de 8 bits (N1 + N2)
    push ebp
    mov ebp, esp

    mov eax, 0
    mov AL,[N1]
    add AL,[N2]
    push EAX
    push dword fmt_number_suma_N1_N2
    call _printf
    add esp, 8

    mov esp,ebp
    pop ebp


    ; Resta de dos numeros de 16 bits (N3 - N4 )
    push ebp
    mov ebp, esp

    mov ebx,0
    mov BX,[N3]
    sub BX,[N4]

    push ebx
    push dword fmt_number_resta_N3_N4
    call _printf
    add esp, 8

    mov ebp, esp
    pop ebp

    ; Multiplicacion de numeros de 8 bits (N1 * N2 )
    push ebp
    mov ebp, esp

    mov eax,0
    mov ebx,0

    mov AL,[N1]
    mov BL,[N2]
    mul BL

    push ebx
    push dword fmt_number_mul_N1_N2
    call _printf
    add esp, 8

    mov ebp, esp
    pop ebp

    ; Cociente (AL) y resto (AH) de la división entera 16 bits (N3 / N4)
    push ebp
    mov ebp, esp

    mov eax,0
    mov ebx,0

    mov AX,[N3]
    mov BL,[N4]
    div BL

    push eax
    push dword fmt_number_div_N3_N4
    call _printf
    add esp, 8

    mov ebp, esp
    pop ebp

    ; Suma de dos números de 32 bits. (N5 + N6)
    push ebp
    mov ebp, esp

    mov eax,0

    mov eax,[N5]
    add eax,[N6]

    push eax
    push dword fmt_number_sum_N5_N6
    call _printf
    add esp, 8

    mov ebp, esp
    pop ebp

    ; Suma de dos números de 64 bits usando reg. de 32 (N64_1 + N64_2 )

    push ebp
    mov ebp, esp

    mov eax,0
    mov ebx,0

    mov ebx,[N64_1]
    adc ebx,[N64_2]

    push ebx
    push dword fmt_number_sum_N64_1_and_N64_2
    call _printf
    add esp, 8

    mov eax,[N64_1+4]
    adc eax,[N64_2+4]
    push eax

    push dword fmt_number_sum_N64_1_and_N64_2
    call _printf
    add esp, 8

    mov ebp, esp
    pop ebp




    ret
