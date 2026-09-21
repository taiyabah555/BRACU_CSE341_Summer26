.MODEL SMALL
.STACK 100H
.DATA
;variable declaration
    msg1 db 'Enter the numbers: $'
    msg2 db 0Dh, 0Ah,'Maximum number is $'
    msg3 db 0Dh, 0Ah,'Minimum number is $'
    num1 db ?
    num2 db ?
    num3 db ?
    maxx db ?
    miin db ?

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
    int 21h
    sub al, 48    
    mov num3, al
    
    ; Till now okay

    mov al, num1
    mov maxx, al    
    CMP num2, al
    JLE check1
    mov al, num2
    mov maxx, al
    
check1:
    CMP num3,al
    JLE check2
    mov al, num3
    mov maxx, al
check2:        
    mov al, num1
    mov miin, al
    CMP num2, al
    JGE check3
    mov al, num2
    mov miin, al
check3:
    CMP num3,al
    JLE check4
    mov al, num3
    mov miin, al
check4:        
    LEA DX, msg2
    MOV AH, 9
    INT 21H
    MOV DL, maxx
    ADD DL, 48
    MOV AH, 2
    INT 21H    
    
    
    LEA DX, msg3
    MOV AH, 9
    INT 21H
    MOV DL, miin
    ADD DL, 48
    MOV AH, 2
    INT 21H    
     
END:      
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN