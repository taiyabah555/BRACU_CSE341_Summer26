.MODEL SMALL 

.STACK 100H

.DATA
arr dw "Hello form a procedure! $"
; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
call print      
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
print proc
    lea dx, arr
    mov ah, 9
    int 21h
    ret
    print endp
    END MAIN
