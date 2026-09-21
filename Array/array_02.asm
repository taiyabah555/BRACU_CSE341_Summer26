.MODEL SMALL
 
.STACK 100H

.DATA

arr1 db 20, 10, 90, 50, 30, 80
arr2 db 5 dup(?)
max db ?

; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

mov bh, arr1[0]
mov max, bh
mov cx,6
mov si,0

comp:
mov bl, arr1[si]
cmp bl, max
jg updt
jmp skip

updt:
mov max, bl

skip:
inc si
loop comp

mov ah, 2
mov dl, max
add dl, 30h
int 21h


 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
