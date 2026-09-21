.MODEL SMALL
.STACK 100H
.DATA
;variable declaration
    msg1 dw 'Enter the n`th number of the week: $ '
    day1 db 'Saturday$'
    day2 db 'Sunday$'
    day3 db 'Monday$'
    day4 db 'Tuesday$'
    day5 db 'Wednesday$'
    day6 db 'Thrusday$'
    day7 db 'Friday$'
    num1 db ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
;code will start from here
    mov cx, 80 ;counter register always use for the loop
    
    print:
        mov dl, '*'
        mov ah, 2
        int 21h
        
        loop print   
     
END:      
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN