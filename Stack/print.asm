.MODEL SMALL
 
.STACK 100H

.DATA
arr dw 5 dup(?)
msg db "(()())$"
msg_ok db 0Ah, 0DH, "Balanced $"
msg_not db 0AH, 0DH, "Not Balanced $"
; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here


mov ax, 8765
mov bx, 10
mov cx, 0

pn_divide:
    mov dx, 0
    div bx
    push dx
    inc cx
    cmp ax, 0
    JNZ pn_divide
       
print:
    pop dx
    add dl, 30h
    mov ah, 2
    int 21h
    loop print    
          

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
