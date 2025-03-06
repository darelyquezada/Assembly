
; Impresion de un caracter
; Darely Quezada Guerrero
; Valeria Paola Chavez Flores
; 25/02/25
; Ensamblador 

.model small

.data 
    char DB " ", "$"
    salto DB 10, 13, "$" ;Define Byte 10 -> LF (similar a \n) ...; 13 -> CR Regresa el cursor al inicio de la linea
    
.code

MAIN PROC
    MOV AX, @data ; Move all data to AX
    MOV DS, AX
    ; MOV ES, AX
    
    ; Lectura del caracter
    MOV AH, 01H
    INT 21H
    MOV char, AL
    
    ;Impresion del salto de linea
    MOV AH, 09H
    LEA DX, salto
    INT 21H
    
    ; Impresion del valor de la variable
    MOV AH, 09H
    LEA DX, char
    INT 21H
    

.exit  
MAIN ENDP
END



