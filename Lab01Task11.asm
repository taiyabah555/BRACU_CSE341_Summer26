.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

first dw ?

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

MOV AX, 2
INC AX

MOV BX, 3
DEC BX

MUL BX
MOV first, AX

MOV CX, 0
ADD CX, 5
ADD CX, 3
ADD CX, 2

MOV AX, 1
MOV BX, 2
MUL BX

SUB CX, BX

MOV AX, first
DIV CX


 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN