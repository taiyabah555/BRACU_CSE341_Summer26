.MODEL SMALL 

max2 macro a, b, res
    mov ax, a
    cmp ax, b
    JGE bigger
    mov ax, b
    bigger:
    mov res, ax
    
endm  

.STACK 100H

.DATA
arr dw 3, 9, 2, 7, 5, 12, 6
n dw 7
max_elem dw ?
; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
lea si, arr
mov ax, [si]
mov max_elem, ax
add si, 2 
mov cx, n
dec cx 

compare_loop:
    max2 max_elem, [si] , max_elem
    add si, 2
    loop compare_loop      
;exit to DOS
EXIT:               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
