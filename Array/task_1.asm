.MODEL SMALL
 
.STACK 100H

.DATA
arr db 1,2,3,4,5
; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov cx, 5
mov ah, 2

lea si, arr

start:
    mov dl,[si]
    add dl, 30h
    int 21h
    inc si
    loop start
 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
