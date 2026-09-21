.MODEL SMALL
.STACK 100H
.DATA
;variable declaration
     MSG DB ’Enter a character: $’
     char db ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
;code will start from here
    lea dx, MSG
    mov ah, 9
    int 21h
    
    mov ah,1
    int 21h
    
    CMP AL, 'A'
    JL EXIT
    
    CMP AL, 'Z'
    JG EXIT
    
    mov char, AL
    add bl, 48
    
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13 
    int 21h
    
    mov dl, char
    int 21h
        
     
EXIT:      
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN