.MODEL SMALL
factorial macro num
    mov ax, 1
    mov cx, num
    
    fact_loop:
    cmp cx, 1
    JLE fact_done
    mul cx
    dec cx
    jmp fact_loop
    
    fact_done:
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
    
endm 
.STACK 100H

.DATA
inp db "Enter the height of the Triangle: $"
height db ?
; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
factorial 5        
;exit to DOS
EXIT:               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
