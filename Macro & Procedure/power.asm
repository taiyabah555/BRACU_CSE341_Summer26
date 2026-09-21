.MODEL SMALL 

power macro base, exp
    push base
    ;push exp
    mov cx, exp
    mov ax, 1 
    cmp cx, 0
    JE power_done
    calc:
    mul base
    loop calc
    power_done:
    mov result, ax
    endm
.STACK 100H

.DATA

; declare variables here
base dw 2
exp dw 5
result dw ?

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

power base, exp 

mov ax, result
call print_num
    
;exit to DOS
EXIT:               
MOV AX,4C00H
INT 21H

MAIN ENDP

print_num proc
    mov bx, 10
mov cx, 0
pn_divide:
mov dx, 0
div bx
push dx
inc cx
cmp ax, 0
JNZ pn_divide

pn_print:
pop dx
add dl, 30h
mov ah, 2
int 21h
loop pn_print
ret

print_num endp
    END MAIN
