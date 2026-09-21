.MODEL SMALL
 
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

lea dx, inp
mov ah, 9
int 21h     
mov ah, 1
int 21h 
sub al, 30h
mov height, al
mov cl, al
mov ch, 0 

mov ah, 2    
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h
    
pushing:
    push cx
    loop pushing
pop cx       
print:
    mov ah, 2    
    mov dl, '*' 
    int 21h    
    loop print
break:
    mov ah, 2    
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h 
    pop cx
    cmp cl, height
    JE exit
    jmp print
                                                  
        
;exit to DOS
EXIT:               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
