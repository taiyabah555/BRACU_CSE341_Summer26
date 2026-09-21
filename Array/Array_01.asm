.MODEL SMALL
 
.STACK 100H

.DATA  
arr1 dw 5,2,3,4,5
arr2 db 5 dup(?)

; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

;mov ah, 2
;mov dl, arr1[0]
;add dl, 48
;int 21h 

;mov cx, 5
;mov si, 4

;print:
;mov ah, 2
;mov dl, arr1[si]
;add dl, 30h
;int 21h

;dec si
;loop print

mov cx, 5
lea si, arr1

print:
mov ah, 2
mov dl, [si] 
add dl, 30h
int 21h

inc si
inc si
loop print

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
