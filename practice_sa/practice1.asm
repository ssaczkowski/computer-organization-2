global _practice1

%macro print_msg 1
  pop ebp
  mov ebp, esp
  push dword %1
  call _printf
  add esp, 4
  mov ebp, esp
  pop ebp
%endmacro


section .data

; Formatos de print
fmt_number_suma_N1_N2: db "N1 + N2 = %d", 10, 0
fmt_number_resta_N3_N4: db "N3 - N4 = %d", 10, 0
fmt_number_mul_N1_N2: db "N3 * N4 = %d", 10, 0
fmt_number_div_N3_N4: db "N3 / N4 = %04X (Primeros dos valores resto y los otros dos cociente)", 10, 0
fmt_number_sum_N5_N6: db "N5 + N6 = %d", 10, 0
fmt_number_sum_N64_1_and_N64_2_top: db "Top number: %X",10,0
fmt_number_sum_N64_1_and_N64_2_bottom: db "Bottom number: %X",10,0
fmt_quotient_remainder_N5_N6: db "quotient: %04X and remainder: %04X ",10,0
fmt_quotient_N5_N6: db "quotient: %d ",10,0
fmt_remainder_N5_N6: db "remainder: %d ",10,0
fmt_show_hexa: db "hexa: %04X ",10,0
fmt_show_decimal: db "decimal: %d ",10,0
fmt_show_dividend: db "Dividend: %04X ",10,0
fmt_show_divider: db "Divider: %04X ",10,0
fmt_string:    db "%s", 10,0
msg_N1_is_greater: db "N1 es mayor que N2", 10, 0
msg_N2_is_greater: db "N2 es mayor que N1", 10, 0
msg_N3_sub_N4_is_zero: db "N3-N4 is zero",10,0
msg_not_zero: db "N3-N4 not zero",10,0


; Cadena de caracteres
T: db "Hola Mundo",13,10,0

; Enteros sin signo de 8 bits
N1: db 66
N2: db 12

; Enteros de 16 bits
N3: dw 11
N4: dw 5

; Enteros de 32 bits
N5: dd 0,20
N6: dd 0,5

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
    push dword fmt_number_sum_N64_1_and_N64_2_top
    call _printf
    add esp, 8

    mov eax,[N64_1+4]
    adc eax,[N64_2+4]
    push eax

    push dword fmt_number_sum_N64_1_and_N64_2_bottom
    call _printf
    add esp, 8

    mov ebp, esp
    pop ebp

    ; Cociente y resto de la división N5/N6 (reg de 32) usando registros de 32 bits. (EDX:EAX = number to divide and EBX = divider)

    push ebp
    mov ebp, esp

    mov edx,0
    mov ebx,0
    mov eax,0

    mov eax,[N5+4]

    mov edx,0
    mov ebx,[N6+4]
    div ebx

    mov ecx, eax
    push ecx
    push dword fmt_quotient_N5_N6
    call _printf
    add esp, 8

    mov ecx, edx
    push ecx
    push dword fmt_remainder_N5_N6
    call _printf
    add esp, 8

    mov ebp, esp
    pop ebp

    ;N1 is greater than N2 ?
    push ebp
    mov ebp, esp

    mov al,0
    mov al,[N1]
    cmp al, [N2]
    ja N1_is_greater
    jb N2_is_greater
    mov ebp, esp
    pop ebp
    jmp continue_ex4b

    N1_is_greater:
      print_msg msg_N1_is_greater
      mov ebp, esp
      pop ebp
      jmp continue_ex4b


    N2_is_greater:
      print_msg msg_N2_is_greater
      mov ebp, esp
      pop ebp

    continue_ex4b:
    ; If return N3 - N4 is zero

    push ebp
    mov ebp, esp

    mov ebx,0
    mov BX,[N3]
    sub BX,[N4]
    cmp ebx,0
    jz iszero
    print_msg msg_not_zero
    mov ebp, esp
    pop ebp
    jmp continue_ex4c
    iszero:
      print_msg msg_N3_sub_N4_is_zero
      mov ebp, esp
      pop ebp

    continue_ex4c:
      


    ret
