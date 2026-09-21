.MODEL SMALL
.STACK 100H
.DATA
;variable declaration
    msg1 dw 'Write the first number: $'
    msg2 dw 'Write the second number: $'
    msg3 dw 'Total is: $'
    num1 dw ?
    Total dw ?
    dig1 db ?
    dig2 db ?
    dosh db 10

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
;code will start from here
    lea dx, msg1
    mov ah, 9
    int 21h
    
    mov ah,1
    int 21h
    sub al, 48
    mov dig1, al
    int 21h
    sub al, 48
    mov dig2, al
    
    mov al, dig1
    mul dosh
    mov bl, dig2
    mov bh, 00h
    add ax, bx
    mov num1, ax
         
    mov ah, 2
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h
    
    lea dx, msg2
    mov ah, 9
    int 21h
    
    mov ah,1
    int 21h
    sub al, 48
    mov dig1, al
    int 21h
    sub al, 48
    mov dig2, al
    
    mov al, dig1
    mul dosh
    mov bl, dig2
    mov bh, 00h
    add ax, bx
    
    add ax, num1
    mov Total, ax
    
    mov ah, 2
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h
    
    lea dx, msg2
    mov ah, 9
    int 21h
    
    ;mov dx, total
    ;mov ah, 2
    ;int 21h  ;Till this alright 
    
    mov ax, Total
    div dosh
    mov dig1, al
    mov dig2, ah
    
    mov dl, dig1
    add dl, 48
    mov ah, 2
    int 21h
    mov dl, dig2
    add dl, 48
    int 21h
    
    
    
     
      
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN