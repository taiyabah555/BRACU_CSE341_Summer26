.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
str1 db 0AH, 0DH, "Input is even$"
str2 db 0AH, 0DH, "Input is odd$"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

mov ah, 1
int 21h
sub al, 48 ;input stores in al
mov ah,00h ; ax=00al

MOV bl, 02h
DIV bl ; AX/BL ---> remainder in ah

MOV cl, 00h
CMP cl, ah
JL ODD
JE EVEN

EVEN:
    mov ah, 9
    lea dx, str1
    int 21h
    JMP END

ODD:
    mov ah, 9
    lea dx, str2
    int 21h
    JMP END
                    

;exit to DOS

END:               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
