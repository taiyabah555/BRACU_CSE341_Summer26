.MODEL SMALL
.STACK 100H
.DATA
str dw 0DH, 0AH, 'Enter the relative integer: $'
str11 dw 0DH, 0AH, 'Enter the number you want to check: $'
str1 dw 0DH, 0AH, 'Entered number is Bigger.$'
str2 dw 0DH, 0AH, "Entered number is Smaller.$"
str3 dw 0DH, 0AH, "Both are equal. $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    lea dx, str
    mov ah, 9
    int 21h
    MOV AH, 1
    INT 21H
    SUB AL, 48
    MOV CL, AL
    MOV CH, 0
    
    lea dx, str11
    mov ah, 9
    int 21h
    MOV AH, 1
    INT 21H
    SUB AL, 48
    MOV AH, 0
    
    CMP AX, CX
    JG Boro
    JL Choto
    JE Equal
    
    Boro:
        lea dx, str1
        mov ah, 9
        int 21h
        JMP End
    Choto:
        lea dx, str2
        mov ah, 9
        int 21h
        JMP End
    Equal:
        lea dx, str3
        mov ah, 9
        int 21h
        JMP End        
    
End:     
    MOV AX, 4C00H
    INT 21H
   
    MAIN ENDP
END MAIN
    