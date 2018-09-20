; Enteros sin signo de 8 bits
N1: db 1
N2: db 0 
; Enteros de 16 bits
N3: dw 42 
N4: dw 6
; Enteros de 32 bits
;N5: dd 0x5555,0x64300000
;N6: dd 0x4434,0xF2320000
N5: dd 2147483647 ;2^31-1 =2147483647
N6: dd 0 ; Sumando 1 Desborda
; Enteros sin signo de 64 bits
N7: dq 7
N8: dq 8
;Punto flotante de precisión simple
F1: dd 1.0
;Punto flotante de precisión doble
F2: dq 2.0

msg1 db "N1 es mayor",10,0
msg2 db "N2 es mayor",10,0
msg3 db "N2 y N2 son Iguales",10,0
msg4 db "N3 - N4 es Positivo",10,0
msg5 db "N3 - N4 es Negativo",10,0
msg6 db "N5 + N6 Produce Desbordamiento",10,0
msg7 db "N5 + N6 NO Produce Desbordamiento",10,0

fmt1:    db "N1: %d ",10,0
fmt2:    db "N2: %d ",10,0
fmt3:    db "N3: %d ",10,0
fmt4:    db "N4: %d ",10,0
fmt5:    db "N5: %d ",10,0
fmt6:    db "N6: %d ",10,0
section .text

extern  printf 

global main

 main:
     ;A) Si N1 es > N2
     MOV EAX,0
     push EBP
     MOV EBP,ESP
     MOV AL,[N1]          
     push EAX
     push dword fmt1
     call printf
     add ESP,8       
     MOV ESP,EBP
          
     MOV AL,[N2]
     push EAX
     push dword fmt2
     call printf
     add ESP,8       
     MOV ESP,EBP
     
     MOV AL,[N1]          
     CMP AL,[N2]
     JZ Igual
     JG N1esMayor      
     JL N2esMayor
    fin:
        add ESP,4       
        MOV ESP,EBP
        pop EBP
        jmp EJ4B         
    Igual:
        push msg3
        call printf
        jmp fin
    N1esMayor:
        push msg1
        call printf
        jmp fin
    N2esMayor:
        push msg2
        call printf
        jmp fin                        
  ;B) N3-N4 es Cero?
  EJ4B:  
     MOV EAX,0
     push EBP
     MOV EBP,ESP
     MOV AX,[N3]          
     push EAX
     push dword fmt3
     call printf
     add ESP,8       
     MOV ESP,EBP
     
     MOV EAX,0     
     MOV AX,[N4]
     push EAX
     push dword fmt4
     call printf
     add ESP,8       
     MOV ESP,EBP
     
     MOV AX,[N3]
     CMP AX,[N4]
     JC Negativo
     JNC Positivo
     FinB:
        add ESP,4      
        MOV ESP,EBP
        pop EBP        
        jmp EJ4C
     Positivo:
        push msg4
        call printf
        jmp FinB
     Negativo:
        push msg5
        call printf
        jmp FinB          
     ;C)N5 + N6 produce desbordamiento?   
  EJ4C:     
      MOV EAX,0
      push EBP
      MOV EBP,ESP
      MOV EAX,[N5]          
      push EAX
      push dword fmt5
      call printf
      add ESP,8       
      MOV ESP,EBP
     
      MOV EAX,0     
      MOV EAX,[N6]
      push EAX
      push dword fmt6
      call printf
      add ESP,8       
      MOV ESP,EBP
     
      MOV EAX,0     
      MOV EAX,[N5]      
      ADD EAX,[N6]
      
      JO  Desborda
      JNO NoDesborda
    FinC:
        add ESP,4      
        MOV ESP,EBP
        pop EBP
        jmp EJ4D
    Desborda:
        push msg6
        call printf
        jmp FinC
    NoDesborda:
        push msg7
        call printf
        jmp FinC
    EJ4D:
        ret                   
