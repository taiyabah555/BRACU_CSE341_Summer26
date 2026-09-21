.MODEL SMALL
 
.STACK 100H

.DATA
arr dw 5 dup(?)
msg db "racecar$"
msg_ok db "YES $"
msg_not db "NO$"
temp dw ?
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
     
mov temp, cx    
lea si, msg    
pushing:
    mov al, [si]
    mov ah, 0
    push ax
    inc si
    loop pushing
    
mov cx, temp    
lea si, msg        
check:
    pop bx
    mov al, [si]
    mov ah, 0
    cmp ax, bx
    JNE unbalanced
    inc si
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
