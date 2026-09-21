.MODEL SMALL 
print macro 
    looper:
    mov dl, [si]
    add dl, 30h
    mov ah, 2
    int 21h
    mov dl, ' '
    int 21h
    inc si
    loop looper
    
    endm

.STACK 100H
.DATA
    arr1 db 10 dup(?)
    arr2 db 10 dup (?)
    msg1 db 0DH, 0AH, 'Enter a digit: $'
    msg2 db 0DH, 0AH, 'Array 2: $'
    temp dw ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    ;code starts form here
    
    lea si, arr1
    mov cx, 10
    
    input:
        lea dx, msg1
        mov ah, 9
        int 21h
        
        mov ah, 1
        int 21h
        sub al, 30h
        
        mov [si], al
        inc si
        loop input
        
        
    lea si, arr1
    add si, 9
    lea di, arr2
    mov cx, 10
    
    copy_loop:
        mov al, [si]
        mov [di], al
        dec si
        inc di
        loop copy_loop
        
    lea dx, msg2
    mov ah, 9
    int 21h
    lea si, arr2    
    mov cx, 10
    
    print
                    
        
    
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
        push dx ; can't push dl because stack pushes 16 bit
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