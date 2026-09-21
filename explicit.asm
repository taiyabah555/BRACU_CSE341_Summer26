 .MODEL SMALL
 
 .STACK 100H
 
 .DATA
 
 .CODE
 
 MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    ; cose starts from here
    
    MOV AH, 2
    MOV DL, 30H
    
    START:
        CMP DL, 35H
        JGE END:
        INT 21H
        INC DL
        JMP START
            
END:    
MOV AX, 4C00H
INT 21H

MAIN ENDP
 END MAIN
    