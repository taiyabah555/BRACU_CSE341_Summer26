.MODEL SMALL
 
.STACK 100H

.DATA

arr1 dw 1, 2, 3, 4, 5
arr2 db 5 dup(?)
max db ?

; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov cx, 5
mov si, 0

ps:
mov ax, arr1[si]
push ax

inc si
inc si

loop ps

mov cx, 5

p:
pop dx
add dx, 48
mov ah, 2
int 21h 
loop p
 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
