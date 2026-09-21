.MODEL SMALL
.STACK 100H
.DATA
;variable declaration
    msg1 db 'Enter a digit: $'
    msg2 db 0Dh, 0Ah,'Maximum number is $'
    msg3 db 0Dh, 0Ah,'Minimum number is $'
    num1 db ?
    num2 db ?
    num3 db ?
    check db ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
;code will start from here
    LEA DX, msg1
    MOV AH, 9
    INT 21H 
    
    mov ah,1
    int 21h
    sub al, 48    
    mov num1, al
    
    ; Till now okay

    CMP al, 9
    JLE pass1
        
    
pass1:
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    mov al, num1
    CMP al, 7
    JL pass2
    
    mov dl, 'l'
    MOV AH, 2
    INT 21H
    JMP END
    
pass2:
    mov ah, num1
    CMP ah, 4
    JL last
    
    mov dl, 'k'
    mov ah, 2
    int 21h
    JMP END
    
last:    
    mov dl, 'i'
    mov ah, 2
    int 21h      
     
END:      
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN