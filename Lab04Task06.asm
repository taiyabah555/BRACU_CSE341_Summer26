.MODEL SMALL
.STACK 100H
.DATA
;variable declaration
    msg1 db 'Enter a hex number: $ '
    msg2 db 0Ah, 0Dh, 'Invalid input.$'
    msg3 db 0Ah, 0Dh, 'In decimal: $'
    msg4 db 0Ah, 0Dh, 'Do you want to do it again? $'
    
    inp db 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
;code will start from here
    ;mov cx, 48 ;counter register always use for the loop
    start:
    lea dx, msg1
    mov ah, 9
    int 21h
     
    mov ah, 1
    int 21h
    mov inp, al
    mov bl, al
    
    cmp al, '0'
    JL invalid    
    cmp al, '9'
    JLE val_dig
    cmp al, 'A'
    JL invalid
    cmp al, 'F'
    JG invalid    
    JLE val_char
    
    invalid:
    lea dx, msg2
    mov ah, 9
    int 21h
    JMP start
    
    val_dig:
    sub bl, 30H
    JMP disp
    
    val_char:
    sub bl, 37H
    
    disp:
    lea dx, msg3
    mov ah, 9
    int 21h
    
    cmp  bl, 10
    JL dig
    
    mov dl, '1'
    mov ah, 2
    int 21h
    sub bl, 10
    
    dig:
    mov dl, bl
    add dl, 30H
    mov ah,  2
    int 21h
    
    LEA dx, msg4
    MOV ah, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    CMP AL, 'y'
    JE START
    CMP AL, 'Y'
    JE START 
      
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
