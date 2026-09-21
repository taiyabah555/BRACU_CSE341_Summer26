.MODEL SMALL
.STACK 100H
.DATA
; no variables needed

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    mov cx, 5
input:
    MOV AH, 1        
    INT 21H
    LOOP input

    MOV DL, 0DH       
    MOV AH, 2
    INT 21H

    MOV CX, 5
output:
    MOV DL, 'X'
    MOV AH, 2
    INT 21H
    LOOP output

    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
