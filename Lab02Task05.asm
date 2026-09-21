.MODEL SMALL

.STACK 100H 

.DATA 

; declare variables here
  
str1 dw "The sum of  $"   
str2 dw " and $"
str3 dw " is $"
total db ?
first db ? 
second db ?

.CODE

MAIN PROC
    
; initialize DS

MOV AX,@DATA
MOV DS,AX

; enter your code here
 
mov dl,'?'
mov ah,2
int 21h   

mov ah,1
int 21h  
mov bl,al
sub bl,48
mov first , bl ;5

mov ah,1
int 21h 
sub al,48
mov second, al ;2

add al,bl
mov total, al ;7 

mov ah,2
mov dl,10
int 21h  
mov ah,2
mov dl,13
int 21h

mov ah,9
lea dx,str1
int 21h 

mov dl,first
add dl,48
mov ah,2
int 21h 

mov ah,9
lea dx,str2
int 21h 

mov dl,second
add dl,48
mov ah,2
int 21h 

mov ah,9
lea dx,str3
int 21h   

mov dl,total
add dl,48
mov ah,2
int 21h


;exit to DOS

MOV AX,4C00H

INT 21H
MAIN ENDP
END MAIN