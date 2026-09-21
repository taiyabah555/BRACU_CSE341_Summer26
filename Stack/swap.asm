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

MOV AX, 10
MOV BX, 20

MOV AX, 0
MOV BX, 0

PUSH AX
PUSH BX

POP AX
POP BX


;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
