.MODEL SMALL
.STACK 100H
.DATA
    last_dig db 1
    m dw 0
    n dw 0
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
;SUM NUMBERS DIVIDED by LAST ID DIGIT    
    MOV CX, 100
    MOV BX, 1
Start:
    MOV AX, BX
    MOV DL, last_dig
    div dl
    
    CMP AH, 0
    JE divisible
    
    add n, bx
    JMP next
divisible:
    add m, bx
next:
    inc bx
    loop start
    
    mov dx, m
    add dx, 48
    mov ah, 2
    int 21h                    
    
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
