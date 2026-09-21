.MODEL SMALL
.STACK 100H
.DATA
;variable declaration
    msg1 db 'Eter a HEX digit: $'
    msg2 db 0AH, 0DH, 'In DEC the digit is: $'
    first db ?
    second db ?

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
    sub al, 37H
    mov bl, al
    
    mov ah,2
    mov dl,10
    int 21h  
    mov ah,2
    mov dl,13
    int 21h

    lea dx, msg2
    mov ah, 9
    int 21h
    
    mov al, bl
    mov ah, 00H    ; Dividend in AX register
    mov bl, 10
    div bl
    mov first, al  ; Quotient in AL
    add first, 48
    mov second, ah ; Remainder in AH
    add second, 48
    
    mov dl, first ;output shows in dl register
    mov ah, 2
    int 21h        
    mov dl, second
    int 21h    
    
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN