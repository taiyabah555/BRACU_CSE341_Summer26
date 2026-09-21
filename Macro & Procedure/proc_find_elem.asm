.MODEL SMALL 

.STACK 100H

.DATA
arr dw 3, 9, 2, 7, 5, 12, 6
n dw 7
found db 0 
target db 6
; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
lea si, arr


call check     
;exit to DOS
EXIT:               
MOV AX,4C00H
INT 21H

MAIN ENDP 

check proc
    mov cx, n
    checking:
    
    mov al, [si]
    cmp al, target
    JE got_it 
    inc si
    inc si
    loop checking
    not_found:
    JMP done
    
    got_it:
        mov found, 1 
        jmp done
done:    
    ret
    check endp
    END MAIN
