.MODEL SMALL 

.STACK 100H

.DATA
str dw "Hello form a procedure!!!!!$"
; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
lea si, str
mov cx, 0
last:
    mov bl, [si]
    cmp bl, '$'
    JE done
    inc cx
    inc si
    JMP last
done:
lea si, str
add si, cx
dec si    
call print      
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
print proc
    printing:
    mov dl, [si]
    mov ah, 2
    int 21h
    dec si
    loop printing
    ret
    print endp
    END MAIN
