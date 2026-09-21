.MODEL SMALL

.STACK 100H

.DATA

;declare variables here
MSG DB "Enter an uppercase letter: $"
.CODE
MAIN PROC

;initialize DS

MOV AX,@DATA
MOV DS,AX

;enter your code here
LEA DX, MSG
MOV AH, 9
INT 21H

MOV AH, 1
INT 21H    ;Input stores in AL
ADD AL, 32
MOV CL, AL

mov dl,0DH ;passing Hex 0D
mov ah,2
int 21h  
mov dl,0AH ;passing Hex 0A
int 21h

mov ah,2
mov dl,10
int 21h  
mov dl,13
int 21h

MOV DL, CL 
INT 21H


;exit to DOS

MOV AX,4C00H
INT 21H

MAIN ENDP
  END MAIN