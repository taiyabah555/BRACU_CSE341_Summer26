.MODEL SMALL
.STACK 100H
.DATA
;variable declaration
    first db 80h

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
;code will start from here
    mov cx, 0FFh
    sub cx, 080h ;counter register always use for the loop
    
    mov bl, 10
    priint:
        mov dl, first
        mov ah, 2
        int 21h
        
        mov dl, ' '
        int 21h
        
        inc first
        dec bl
        JNZ next
        
        mov ah, 2
        mov dl, 0Dh
        int 21h
        mov dl, 0Ah
        int 21h
        
        mov bl, 10        
             
    next:
        Loop priint
END:      
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
