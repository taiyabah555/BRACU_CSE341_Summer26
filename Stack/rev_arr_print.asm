.MODEL SMALL
 
.STACK 100H

.DATA
arr dw 5 dup(?)
msg db 0AH, 0DH, "Enter the array : $"
msg2 db 0Ah, 0DH, "Array in reverse: $"
; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

lea dx, msg
mov ah, 9
int 21h 

lea si, arr
mov cx, 5

input:     
     mov ah, 1
     int 21h
     sub al, 30h
     mov [si], al
     inc si
     mov ah, 0
     push ax
     
     mov dl, ' '
     mov ah, 2
     int 21h
     loop input 
     
lea dx, msg2
mov ah, 9
int 21h 

lea si, arr
mov cx, 5

outer:
    pop dx
    add dl, 30h
    mov ah, 2
    int 21h
    
    mov dl, ' '
    mov ah, 2
    int 21h
    loop outer
          

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
