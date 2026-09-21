.MODEL SMALL
 
.STACK 100H

.DATA
msg db 0AH, 0DH, "Enter a number: $"
msg2 db 0Ah, 0DH, "Sum = $"
; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

mov cx, 5

input:
     lea dx, msg
     mov ah, 9
     int 21h
     mov ah, 1
     int 21h
     
     mov ah, 0
     
     push AX
     loop input
mov cx, 5
mov bx, 0     
sum:
    pop ax
    sub ax, 30h
    add bx, ax
    loop sum
    
mov ah, 9    
lea dx, msg2
int 21h    
mov dx, bx
add dx, 30h
mov ah, 2
int 21h        

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
