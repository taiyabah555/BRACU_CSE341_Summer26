;Selection sort
.MODEL SMALL 
.STACK 100H
.DATA
    arr db 10 dup(?)
    msg1 db 'Enter a digit: $'
    msg db 0DH, 0AH, '$'
    msg2 db 0DH, 0AH, 'Sprted array: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    ;code starts form here
    
    lea si, arr
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
        
        lea dx, msg
        mov ah, 9
        int 21h
        
        loop input
    mov bx, 0
    
outer:
    cmp bx, 9
    JGE sorted 
    
    mov di, bx
    lea si, arr
    add si, bx
    mov al, [si]
    
    mov cx, bx
    inc cx
    
inner: 
    cmp cx, 10
    JGE inner_done
    lea si, arr
    add si, cx
    cmp byte ptr [si], al
    JGE no_new_min
    mov al, [si]
    mov di, cx
no_new_min:
    inc cx
    jmp inner
inner_done:
    lea si, arr
    add si, bx
    lea dx, arr
    mov ah, [si]
    push bx
    mov bx, di
    lea di, arr
    add di, bx
    pop bx
    mov dl, [di]
    mov [di], ah
    mov [si], dl
    
    inc bx
    jmp outer            
    
sorted:
    lea dx, msg2
    mov ah, 9
    int 21h
    lea si, arr
    mov cx, 10
    print:
    mov dl, [si]
    add dl, 30h
    mov ah, 2
    int 21h
    mov dl, ' '
    int 21h
    inc si
    loop print         
    
    
    MOV AX, 4C00H
    INT 21H
MAIN ENDP

    
END MAIN