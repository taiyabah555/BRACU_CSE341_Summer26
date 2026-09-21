;FINDING MAXIMUN AND MINIMUM
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
    msg2 db 0DH, 0AH, 'Maximun: $'
    msg3 db 0DH, 0AH, 'Minimum: $'
    temp dw ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    ;code starts form here
    
    lea si, arr
    mov cx, 10
    
    input_arr1:
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
        
        loop input_arr1
     
    lea si, arr
    mov al, [si]  ; assume max
    mov ah, [si]  ; assume min
    inc si
    mov cx, 9 
    
    find_loop:
        cmp byte ptr [si], al
        JLE check_min
        mov al, [si]  ; new max
        
        check_min:
            cmp byte ptr [si], ah
            JGE next_elem
            mov ah, [si]  ; new min
        
        next_elem:
            inc si
            loop find_loop
    push ax
    
    lea dx, msg2
    mov ah, 9
    int 21h
    
    pop ax   ; for msg print prev ax value gone so we popped
    push ax  ; now ax has max, min value and we pushed again
    
    mov dl, al
    add dl, 30h
    mov ah, 2
    int 21h
    
    lea dx, msg3
    mov ah, 9
    int 21h
    
    pop ax
    
    mov dl, ah
    add dl, 30h
    mov ah, 2
    int 21h
    
    MOV AX, 4C00H
    INT 21H
MAIN ENDP

    
END MAIN