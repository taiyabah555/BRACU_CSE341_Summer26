.MODEL SMALL
reverse macro text
lea si, text
lea di, arr
add di, 8
dec di 
mov cx, 8
pushing:
    mov al, [si] 
    mov [di], al
    inc si
    dec di
    loop pushing
mov cx, 8
lea si, arr    
print:    
    mov dl, [si]
    mov ah, 2
    int 21h
    inc si
    loop print            

endm
.STACK 100H

.DATA
inp db "Good Job$"
arr db 8 dup (?)
; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
lea ax, inp
reverse ax        
;exit to DOS
EXIT:               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
