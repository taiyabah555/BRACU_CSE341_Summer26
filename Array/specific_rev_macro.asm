.MODEL SMALL 
print macro m, n 
    LOCAL looper
    mov si, m
    mov cx, n
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
    arr db 7 dup(?)
    arr2 db 7 dup (?)
    msg1 db 0DH, 0AH, 'Enter a digit: $'
    msg2 db 0DH, 0AH, 'Reversed from inder 3 to 5: $'
    temp dw ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    ;code starts form here
    
    lea si, arr
    mov cx, 7
    
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
        
        
    lea dx, msg2
    mov ah, 9
    int 21h
    
    lea si, arr
    mov cx, 3
    
    print si, cx
        
    mov si, 5
    mov cx, 3
    
    print_rev:
        mov dl, [si]
        add dl, 30h
        mov ah, 2
        int 21h
        
        mov dl, ' '
        int 21h
        dec si
        loop print_rev
    mov si, 6
    mov cx, 1    
        
    print si, cx
                    
        
    
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