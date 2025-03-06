
; Hola Mundo 
; Valeria Paola Chavez Flores 
; Darely Quezada Guerrero 
; 24/02/2025  
; Ensamblador

.model small

.stack

.data
    msg db "Hola Mundo. Este es el primer programa en Ensamblador", "$"
    
.code

main PROC
    MOV AX, SEG msg
    MOV DS, AX
    
    MOV AH, 09H
    LEA DX, msg
    INT 21H
    
    
    
    .exit
    
main ENDP
END




