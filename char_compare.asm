.MODEL SMALL
.STACK 100H
.DATA
;variable declaration

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
;code will start from here
    repeat:
        mov ah, 1
        int 21H
        
        mov ah,2 
        mov dl, al
        int 21h
        
        cmp al, 'e'
    
    JNE repeat
      
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
