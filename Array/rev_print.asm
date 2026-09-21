.MODEL SMALL
.STACK 100H
.DATA
    arr db 10 dup(?)
    msg1 db 0DH, 0AH, 'Enter a digit: $'
    msg2 db 0DH, 0AH, 'Reversed: $'
    temp dw ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    ;code starts form here
    
    lea si, arr
    mov cx, 10
    
    input_loop:
        lea dx, msg1
        mov ah, 9
        int 21h
        
        mov ah, 1
        int 21h
        sub al, 30h
        mov [si], al
        inc si
        loop input_loop
        
    lea dx, msg2
    mov ah, 9
    int 21h
    
    dec si
    mov cx, 10
    
    print_reverse:
        mov dl, [si]
        add dl, 30h
        mov ah, 2
        int 21h
        mov dl, ' '
        int 21h
        dec si
        loop print_reverse        
        
    
    MOV AX, 4C00H
    INT 21H
    MAIN ENDP

print_num proc
    mov ax, temp
    mov bx, 10
    mov cx , 0
    
    pn_divide:
        mov dx, 0
        div bx
        push dx ;can't push dl because stack pushes 16 bit
        inc cx
        cmp ax, 0
        jnz pn_divide
        
    pn_print:
        pop dx
        add dl, 30H
        mov ah, 2
        int 21h
        loop pn_print
        ret                  
    
    END MAIN