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
    sum dw 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
;code will start from here

    mov bx, 1
    addition:
        mov ax, 0
        add ax, bx ; 0+1 =1 --> 0+4
        add bx, 3  ; 1+3=4
        add sum, ax; 1
        cmp bx, 148
        JNE addition
             

    mov dx, sum
    mov ah, 2
    int 21h
      
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
