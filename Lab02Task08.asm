.MODEL SMALL
.STACK 100H
.DATA
;variable declaration
    LINE DB '*******', 0AH, 0DH, '$'
    ;0DH/13 -> Carriage Return. Moves the cursor back to the beginning
    ;0AH/10 -> Move cursor down ro the next line

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
;code will start from here
    mov cx, 10 ; only register used for loop CX
    
PRINT_ROW:
    lea dx, LINE ; string call always dx register
    mov ah, 9
    int 21h
    
    LOOP PRINT_ROW
    
        
;Here end call    
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN