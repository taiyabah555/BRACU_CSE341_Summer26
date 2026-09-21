.MODEL SMALL
.STACK 100H
.DATA
;variable declaration
    msg1 db 'Enter the sides of Triangle: $'
    msg2 db 0Dh, 0Ah,'Maximum number is $'
    msg3 db 0Dh, 0Ah,'Minimum number is $'
    num1 db ?
    num2 db ?
    num3 db ?
    check1 db ?
    check2 db ?
    check3 db ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
;code will start from here
    LEA DX, msg1
    MOV AH, 9
    INT 21H 
    
    mov ah,1
    int 21h
    sub al, 48    
    mov num1, al
    
    int 21h
    sub al, 48    
    mov num2, al
    add al, num1
    mov check1, al

    int 21h
    sub al, 48    
    mov num3, al
    add al, num2
    mov check2, al
    
    mov al, num1
    add al, num3
    mov check3, al
    
    ; Till now okay
    mov al, num3
    CMP check1, al
    JG move2
    JL bye
move2:
    mov al,check2
    CMP al, num1
    JG move3
move3:
    mov al, check3
    CMP al, num2         
    JMP pass

bye:
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
        
    mov Dl, 'N'
    MOV AH, 2
    INT 21H
    JMP END     
    
pass:
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
        
    mov Dl, 'Y'
    MOV AH, 2
    INT 21H   
     
END:      
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN