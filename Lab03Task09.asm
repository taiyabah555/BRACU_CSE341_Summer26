.MODEL SMALL
.STACK 100H
.DATA
;variable declaration
    msg2 dw 'Not divisible$'
    msg3 dw 'Consonent $'
    msg1 dw 'Divisible by both 5 and 11$'
    NUM DW 190
    Total dw ?
    dig1 db ?
    dig2 db ?
    dosh db 10

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
;code will start from here
    
    mov ax, num
    mov bl, 5
    div bl
    
    CMP ah, 0
    JNE not_div
            
    mov ax, num
    mov bl, 11
    div bl
    
    CMP ah, 0
    JNE not_div
    
    lea dx, msg1
    mov ah, 9
    int 21h
    JMP END
    
    not_div:
        lea dx, msg2
        mov ah, 9
        int 21h  
    
     
END:      
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN