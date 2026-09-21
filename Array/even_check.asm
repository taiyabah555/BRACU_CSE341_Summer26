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
    arr db 10 dup(?)
    msg1 db 'Enter a digit for array 1: $'
    msg db 0DH, 0AH, '$'
    msg2 db 0DH, 0AH, 'Even numbers: $'
    msg3 db 0DH, 0AH, 'Count of even numbers: $'
    count db 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    ;code starts form here
    
    lea si, arr
    mov cx, 10
    
    input_arr:
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
        
        loop input_arr 
        
    lea dx, msg2
    mov ah, 9
    int 21h    
     
    lea si, arr
    mov cx, 10 
    
    find_even:
        mov al, [si]
        mov ah, 0
        mov bl, 2
        div bl
        cmp ah, 0
        JNE skip_even 
        
        mov dl, [si]
        add dl, 30h
        push AX
        mov ah, 2
        int 21h
        mov dl, ' '
        int 21h
        pop AX
        inc count
        
        skip_even:
        inc si
            loop find_even
    
    lea dx, msg3
    mov ah, 9
    int 21h 
    mov al, count
    mov ah, 0 
    
    call print_num
    
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
print_num proc 
    mov BX, 10
    mov CX, 0
    
    pn_divide:
    mov dx, 0
    div bx
    push dx
    inc CX
    CMP AX, 0
    JNZ pn_divide 
    
    pn_print:
    pop dx
    add dl, 30h
    mov ah, 2
    int 21h
    loop pn_print
    ret
    print_num endp
    
END MAIN