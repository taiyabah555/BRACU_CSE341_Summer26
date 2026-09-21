               .MODEL SMALL

.STACK 100H 

.DATA 

; declare variables here
  
str1 dw "Enter the initials: $"   
str2 dw " and $"
str3 dw " is $"
third db ?
first db ? 
second db ?

.CODE

MAIN PROC
    
; initialize DS

MOV AX,@DATA
MOV DS,AX

; enter your code here
 
mov ah,9
lea dx,str1
int 21h   

mov ah,1
int 21h
mov first, al 

mov ah,1
int 21h 
mov second, al 

mov ah,1
int 21h 
mov third, al 

mov ah,2   ;Enter to the new line
mov dl,10
int 21h  
mov ah,2
mov dl,13  ;Start the line from the beginning
int 21h

mov dl,first
mov ah,2
int 21h

mov ah,2
mov dl,10
int 21h  
mov ah,2
mov dl,13
int 21h 

mov dl,second
mov ah,2
int 21h 

mov ah,2
mov dl,10
int 21h  
mov ah,2
mov dl,13
int 21h

mov dl,third
mov ah,2
int 21h 


;exit to DOS

MOV AX,4C00H

INT 21H
MAIN ENDP
END MAIN