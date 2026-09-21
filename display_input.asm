.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
Prompt dw "Please insert a character: $"
ouput dw "Entered Character is: $"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
lea dx, prompt
mov ah, 9
int 21h

mov ah, 1
int 21h
mov cl, al

mov ah,2
mov dl,10
int 21h  
mov ah,2
mov dl,13
int 21h

lea dx, ouput
mov ah, 9
int 21h

mov dl, cl ;output interrupt shows value in DL, so we moves that
mov ah, 2
int 21h

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN


