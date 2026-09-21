.MODEL SMALL
 
.STACK 100H

.DATA
arr dw 5 dup(?)
msg db "(()(())$"
msg_ok db "Balanced $"
msg_not db "Not Balanced $"
; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

lea si, msg
mov cx, 0

scan:
    mov al, [si]
    cmp al, '$'
    JE scan_done
    
    cmp al, '('
    JNE check_close
    
    push ax
    inc cx
    JMP next_char
    
check_close:
    cmp al, ')'
    JNE next_char
    
    cmp cx, 0
    JE unbalanced 
    
    pop ax
    dec cx

next_char:
    inc si
    jmp scan
    
scan_done:
    cmp cx, 0
    JNE unbalanced
    
lea dx, msg_ok
JMP display

unbalanced:
    lea dx, msg_not
    JMP display

display:
    mov ah, 9
    int 21h                              

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
