.MODEL SMALL 

.STACK 100H

.DATA

; declare variables here
str dw "Enter a number: $"
var dw ?
.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
lea dx, str
mov ah, 9
int 21h
mov ah, 1
int 21h
sub al, 30h
mov ah, 0
mov var, ax
mov dl, 0Ah
mov ah, 2
int 21h
mov dl, 0Dh
int 21h


call find_prime
      
;exit to DOS
EXIT:               
MOV AX,4C00H
INT 21H

MAIN ENDP

find_prime proc
    mov ax, var
    mov bx, ax
    mov ax, 2
outer_loop:
    cmp ax, bx
    JGE done
    push ax
    mov cx, 2 
    inner_loop:
    cmp cx, ax
    JGE is_prime
    
    push ax
    mov dx, 0
    div cx
    cmp dx, 0
    pop ax
    JE not_prime
    inc cx
    JMP inner_loop
is_prime:
    call print_num
    mov dl, ' '
    mov ah, 2
    int 21h
not_prime:
    pop ax
    inc ax
    jmp outer_loop    
done:    
    
    ret
    find_prime endp 

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
