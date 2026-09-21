.MODEL SMALL 

.STACK 100H

.DATA
A dw 7
B dw 3
C dw 5
max dw ?
; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov ax, A
mov bx, B 
mov cx, C

call find_max
mov max, ax
mov dx, max
add dl, 30h
mov ah, 2
int 21h

    
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP 

find_max proc 
    cmp ax, bx
    JGE check_c
    mov ax, bx
    check_c:
    cmp ax, cx
    JGE done
    mov ax, cx
    done:
    ret    
    
    find_max endp 

    END MAIN
