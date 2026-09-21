.MODEL SMALL 

.STACK 100H

.DATA
arr db 4, 8, 15, 16, 23, 42
n dw 6
target db 44
msg_yes db  "got it$"
msg_no  db  "not found$"
; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
lea si, arr
mov cx, n
mov dl, target
call find_value 

cmp al, 1
JE print_yes
lea dx, msg_no
jmp show

print_yes:
    lea dx, msg_yes 
show:
mov ah, 9
int 21h         
;exit to DOS
EXIT:               
MOV AX,4C00H
INT 21H

MAIN ENDP 

find_value proc
    mov al, 0
    fv_loop:
    cmp [si], dl
    JNE fv_next
    mov al, 1
    jmp fv_done
    
    fv_next:
    inc si
    loop fv_loop
    
    fv_done:
    ret
    find_value endp
    END MAIN
