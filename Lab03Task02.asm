.MODEL SMALL
.STACK 100H
.DATA
;variable declaration
    msg1 dw 'Write the first number: $'
    msg2 dw 'Write the second number: $'
    msg3 dw 'Total is: $'
    num1 dw ?
    Total dw ?
    dig1 db ?
    dig2 db ?
    dosh db 10

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
;code will start from here
    mov al, 'A'
    mov bl, 'B'
    
    CMP AL, BL
    JL DISPLAY_AL
    JG DISPLAY_BL
    
    DISPLAY_AL:
        mov dl, al
        mov ah, 2 
        int 21h
        JMP EXIT
        
    DISPLAY_BL:
        mov dl, bl
        mov ah,2
        int 21h
        
EXIT:      
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN