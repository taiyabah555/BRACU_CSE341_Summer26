.MODEL SMALL 

prime macro var

    mov bx, 2
outer_loop:
        cmp bx, var
        JG done
        mov cx, 2 
        inner_loop:
            mov ax, bx
            CMP cx, ax
            JGE is_prime
            
            mov dx, 0
            div cx
            cmp dx, 0
            JE not_prime
            inc cx
            jmp inner_loop
            
is_prime:
    mov ax, bx
    call print_num
    mov dl, ' '
    mov ah, 2
    int 21h
not_prime:
    inc bx
    jmp outer_loop
        
done:
    endm                        

.STACK 100H

.DATA
str dw 0Ah, 0Dh, "Please enter a number: $"
str2 dw 0AH, 0DH, "Prime numbers are: $"
var dw ?
; declare variables here

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
mov ah,0
mov var, ax
lea dx, str2
mov ah, 9
int 21h 

prime var     
;exit to DOS
EXIT:               
MOV AX,4C00H
INT 21H

MAIN ENDP 

print_num proc
    push bx
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
    add dl, 30H
    mov ah,2
    int 21h
    loop print
    pop bx
    ret
    
    print_num endp 
    END MAIN
