;FINDING ODD
.MODEL SMALL 
.STACK 100H
.DATA
    arr db 10 dup(?)
    msg1 db 'Enter a digit for array 1: $'
    msg db 0DH, 0AH, '$'
    msg2 db 0DH, 0AH, 'ODD numbers: $'
    msg3 db 0DH, 0AH, 'Total odd number: $'
    temp db 0

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
    
    lea dx, msg2
    mov ah, 9
    int 21h
    
    lea si, arr
    mov cx, 10
    
find_odd:
    mov al, [si]
    mov ah, 0
    mov bl, 2
    div bl
    cmp ah, 0   ; remainder and result stores in ah and al  
    JE skip_odd
    ;push ax
    
    mov dl, [si]
    add dl, 30h
    mov ah, 2
    int 21h 
    mov dl, ' '
    int 21h 
    ;pop ax
    inc temp
    
skip_odd:
    inc si
    loop find_odd 
    
    lea dx, msg3
    mov ah, 9
    int 21h
    mov al, temp
    mov ah, 0
    call print         
    
    MOV AX, 4C00H
    INT 21H
MAIN ENDP

print proc
    mov bx, 10
    mov cx, 0
    
    pn_divide:
    mov dx, 0
    div bx
    push dx
    inc cx
    cmp ax, 0
    JNZ pn_divide
    
    pn_print:
    pop dx
    add dl, 30h
    mov ah, 2
    int 21h
    loop print
    ret
    
    print endp
    
END MAIN