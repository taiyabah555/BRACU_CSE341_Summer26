.MODEL SMALL
.STACK 100H
.DATA
;variable declaration
    msg2 dw 'vowel $'
    msg3 dw 'Consonent $'
    msg1 dw 'Enter a letter: $'
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
    LEA DX, MSG1
    MOV AH, 9
    INT 21H 
    
    mov ah,1
    int 21h
    
    mov dig1, al
    
    mov ah,2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    mov al, dig1
    
    CMP al, 'a'
    JE vowel
    
    CMP al, 'e'
    JE vowel
            
    CMP al, 'i'
    JE vowel
    
    CMP al, 'o'
    JE vowel
    
    CMP al, 'u'
    JE vowel
    
    CMP al, 'A'
    JE vowel
    
    CMP al, 'E'
    JE vowel
            
    CMP al, 'I'
    JE vowel
    
    CMP al, 'O'
    JE vowel
    
    CMP al, 'U'
    JE vowel
    
    lea dx, msg3
    mov ah, 9
    int 21h
    JMP END 
    
vowel:
    lea dx, msg2
    mov ah, 9
    int 21h    
    
     
END:      
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN