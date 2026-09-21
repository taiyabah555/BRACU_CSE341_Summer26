.MODEL SMALL
 
.STACK 100H

.DATA
arr dw 5 dup(?)
msg db "HELLO$"
msg2 db 0Ah, 0DH, "Array in reverse: $"
; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here


lea si, msg
mov cx, 5

pushing:
    mov al, [si]
    mov ah, 0
    push ax
    inc si
    loop pushing
    
lea si, msg
mov cx, 5    
print:
    pop ax
    mov [si], al
    inc si
    loop print    
lea dx, msg
mov ah, 9
int 21h          

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
