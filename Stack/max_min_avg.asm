.MODEL SMALL
 
.STACK 100H

.DATA
;arr dw 5 dup(?)
arr db 1, 4, 3, 2, 1
maximum db "Maximum: $"
minimum db 0AH, 0Dh, "Minimum: $"
average db 0AH, 0DH, "Average: $"
max dw ?
min dw ?
avg dw ?
sum db 0
; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

lea si, arr
mov cx, 5
    
pushing:
    mov al, [si]
    add sum, al
    mov ah, 0
    inc si
    push ax
    loop pushing
    
mov cx, 4    
lea si, arr        
pop bx
mov max, bx
mov min, bx

checking:    
    pop ax
    cmp ax, max
    JG change_max 
    cmp ax, min
    JL change_min
    jmp next
        
change_max:
    mov max, ax
    jmp next
change_min:
    mov min, ax
    jmp next     
next:
    loop checking
    
max_display:
    lea dx, maximum
    mov ah, 9
    int 21h
    mov dx, max 
    add dx, 30h
    mov ah, 2
    int 21h
    
min_display:
    lea dx, minimum
    mov ah, 9
    int 21h
    mov dx, min 
    add dx, 30h
    mov ah, 2
    int 21h
    
avg_print:
    lea dx, average
    mov ah, 9
    int 21h
    
    mov al, sum
    mov ah, 0
    mov bl, 5
    div bl
    mov ah, 0
    ;mov dl, al
    ;add dl, 30h
    ;mov ah, 2
    ;int 21h
    
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
        add dl, 30h
        mov ah, 2
        int 21h
        loop print                                          
        
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
