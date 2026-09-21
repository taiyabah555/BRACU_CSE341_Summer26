.MODEL SMALL
 
.STACK 100H

.DATA
arr dw 5 dup(?)
msg db "racecar$"
msg_ok db "YES $"
msg_not db "NO$"
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
    inc cx
    JMP next_char

next_char:
    inc si
    jmp scan
    
scan_done:
    cmp cx, 0
    JE palindrome 
    
    lea si, msg
    lea di, msg
    add di, cx
    dec di
    
    mov ax, cx
    mov bl, 2 
    div bl
    mov cl, al
    mov ch, 0
        
check:
    mov al, [si]
    cmp al, [di]
    JNE unbalanced
    inc si
    dec di
    loop check    
    
            
palindrome:    
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
