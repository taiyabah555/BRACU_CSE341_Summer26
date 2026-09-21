.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

mov ah, 1
int 21h
mov bl, al
sub bl, 48

mov ah, 1
int 21h
sub al, 48

add al, bl 

mov dl, al
add dl, 48

mov ah, 2
int 21h


;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN


