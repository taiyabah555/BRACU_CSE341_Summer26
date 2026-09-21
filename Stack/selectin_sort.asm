.MODEL SMALL
 
.STACK 100H

.DATA
;arr dw 5 dup(?)
arr db 1, 4, 3
sorted db 3 dup(?)
max db ?
; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

lea si, arr
lea di, sorted
mov cx, 3     

pushing:
    mov al, [si]
    mov [di], al
    inc di
    inc si
    loop pushing 
    
lea si, sorted
lea di, sorted    
mov cx, 3    
outer:
    mov di, si
    mov bx, si
    mov dx, cx
    dec dx
    
    cmp dx, 0
    JE next_outer
    
    push si
    add si, 1
    
    inner:
        mov al, [si]
        mov ah, [bx]
        cmp al, ah
        JGE skip_update
        mov bx, si
    skip_update:    
        inc si
        dec dx
        JNZ inner
        
        pop si
        
        mov al, [di]
        mov ah, [bx]
        mov [di], ah
        mov [bx], al
    next_outer:
        inc si
        dec cx
        JNZ outer            
mov cx, 3
lea si, sorted        
print:
    mov dl, [si] 
    add dl, 30h
    mov ah, 2
    int 21h
    
    mov dl, ' '
    int 21h
    inc si
    loop print                                          
        
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
