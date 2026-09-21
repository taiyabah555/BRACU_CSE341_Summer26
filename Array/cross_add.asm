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
    arr1 db 5 dup(?)
    arr2 db 5 dup(?) 
    arr3 db 5 dup(?)
    msg1 db 0DH, 0AH, 'Enter a digit for array 1: $'
    msg2 db 0DH, 0AH, 'Enter a digit for array 2: $'
    msg3 db 0DH, 0AH, 'Array 3: $'
    temp dw ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    ;code starts form here
    
    lea si, arr1
    mov cx, 5
    
    input_arr1:
        lea dx, msg1
        mov ah, 9
        int 21h
        
        mov ah, 1
        int 21h
        sub al, 30h
        
        mov [si], al
        inc si
        loop input_arr1
    
    lea si, arr2
    mov cx, 5
    
    input_arr2:
        lea dx, msg2
        mov ah, 9
        int 21h
        
        mov ah, 1
        int 21h
        sub al, 30h
        
        mov [si], al
        inc si
        loop input_arr2    
        
        
    lea si, arr1
    lea di, arr2
    add di, 4
    lea bx, arr3
    mov cx, 5
    
    cross_add:
        mov al, [si]
        add al, [di]
        mov [bx], al
        
        inc si
        dec di
        inc bx
        
        loop cross_add
        
    lea dx, msg3
    mov ah, 9
    int 21h
    lea si, arr3    
    mov cx, 5
    
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