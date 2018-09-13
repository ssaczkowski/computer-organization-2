section .data
    msg: db "Codigo asm con printf de C", 10, 0 ;define a string 
 
section .text
    extern printf ;include the printf function in asm program
    global main 
 
    main:
        push ebp         
        mov ebp, esp   ;pass the reference of reg esp to ebp
        push msg 
        call printf        ;print the current element in the stack
        mov esp, ebp
        pop ebp          ;free the stack
        ret
