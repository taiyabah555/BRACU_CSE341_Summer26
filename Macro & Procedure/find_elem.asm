.MODEL SMALL 

find_value macro arr, len, target, found 
    lea si, arr
    mov cl, len 
    mov ch, 0
    search:
        mov al, [si]
        cmp al, target
        JE value_found
        inc si
        loop search
        jmp done
value_found:
    mov found, 1        
done:    
endm
.STACK 100H

.DATA 
arr db 4, 8, 15, 16, 23, 42
len db 6
found db 0
str_yes db "Element found! $"
str_no db "Element not found. $"
; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
find_value arr, len, 16, found

CMP found, 1
JE print_yes
lea dx, str_no
jmp show

print_yes:
    lea dx, str_yes
show:
    mov ah, 9
    int 21h          
;exit to DOS
EXIT:               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
