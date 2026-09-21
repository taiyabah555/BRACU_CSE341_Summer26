.MODEL SMALL
.STACK 100H
.DATA
    arr db 10 dup(?)
    msg1 db 0DH, 0AH, 'Enter a digit: $'
    msg2 db 0DH, 0AH, 'Sum = $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    ;code starts form here
    mov cx, 10
    lea si, arr
    
    inp_loop:
        lea dx, msg1
        mov ah, 9
        int 21h
        
        mov ah, 1
        int 21h
        sub al, 30h
        mov [si], al
        inc si
        loop inp_loop
    
    lea si, arr
    mov cx, 10
    mov al, 0
    mov ah, 0
    
    sum_loop:
        add bl, [si]
        inc si
        loop sum_loop
        
    mov bh, 0
    
    lea dx, msg2
    mov ah, 9
    int 21h
    
    call PRINT_NUM    
    
    MOV AX, 4C00H
    INT 21H
    MAIN ENDP

PRINT_NUM PROC
    mov ax, bx
    MOV BX, 10
    MOV CX, 0
    
    PN_DIVIDE:
    MOV DX, 0
    DIV BX
    PUSH DX
    INC CX
    CMP AX, 0
    JNZ PN_DIVIDE
    
    PN_PRINT:
    POP DX
    ADD DL, 30H
    MOV AH, 2
    INT 21H
    LOOP PN_PRINT
    RET
    PRINT_NUM ENDP
    END MAIN