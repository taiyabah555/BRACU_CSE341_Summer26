.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
str1 dw "take the first number $"
str2 dw "take the second number $"
first dw ?
second dw ?

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here


mov ah, 9
lea dx, str1
int 21h

mov ah, 1
int 21h   ; al
mov bl, al
sub bl, 48

;new line
mov dl, 10
mov ah, 2
int 21h
mov dl, 13
mov ah, 2
int 21h


;2nd input
mov ah, 9
lea dx, str2
int 21h

mov ah, 1
int 21h    ;al
sub al, 48

add al, bl 

mov bx, 10
mov ah, 0
div bx    ; ax= answer dx= remainder

mov first, ax
mov second, dx

mov dx, first
add dx, 48
mov ah,2
int 21h

mov dx, second
add dx, 48
mov ah,2
int 21h

 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
