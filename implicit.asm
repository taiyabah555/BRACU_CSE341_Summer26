.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
; code form here
    mov ah, 2
    mov dl, 30H
    mov cx, 5
    
    implicit:
        int 21h
        inc dl
        
        loop implicit


MOV AX, 4C00H
INT 21H

MAIN ENDP
END MAIN