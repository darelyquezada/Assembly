
; Ejercicio - Multiplicacion y division
; Valeria Paola Chavez Flores
; Darely Quezada Guerrero
; 03/03/2025     
; Ensamblador

.model small

.stack

.data

.code       
main PROC
    MOV AX, @data ; Inicializacion del segmento de datos
    MOV DS, AX
    
    ; MULTIPLICACION BYTE    
    MOV AL, 20
    MOV BL, 2
    MUL BL  
    ; El resultado es 40 (28h) en AX  
    
    ; MULTIPLICACION WORD    
    MOV AX, 350                                   
    MOV BX, 100     
    MUL BX      
    ; El resultado es 35,000 (88B8h) 
    
    ;DIVISION WORD / WORD            
    MOV AX, 90
    MOV BL, 8
    DIV BL 
    ; Como resultado en AH se guarda el residuo, mientras que en AL se guarda el cociente.
    ; 90 / 8 = 11 con residuo 2
    ; AH (cociente) = 25 (02h) 
    ; AL (residuo) = 11 (Bh)
    
    ;DIVISION DWORD / WORD
    
    MOV DX, 0035h
    MOV AX, 67E0h   
    ; Esto es 3,500,000 dividido entre DX y AX 
    MOV BX, 61C1h ; 25,025 en decimal
    DIV BX
    ; La division que se esta ejectando es:
    ; 3,500,000 / 25,025 (decimal) 
    ; El resultado es: 139   --> en hexadecimal es 8B  
    ; AX (cociente) = 8B 
    ; DX(residuo) = 5415
    
    
    
    
main ENDP
.exit