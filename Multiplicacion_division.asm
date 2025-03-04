
; Multiplicacion y division
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
    
    ; MULTIPLICACION
    ; Existen de tipo BYTE y de tipo WORD
    
    ; Para BYTE, el resultado se almacena en AX (Valor maximo 255)
    MOV AL, 150
    MOV BL, 2
    MUL BL  ; Implicitamente se multiplica por AL
    ; El resultado es 300 (12Ch)
    
    ; Otro ejemplo     
    MOV AL, 14
    MOV BL, 55
    MUL BL
    ; El resultado es 770 (302h)
    
    ; Multiplicando los valores maximos
    MOV AL, 255
    MOV BL, 255
    MUL BL
    ; El resultado es 65,025 (FE01h)
    
    ; Para WORD, el resultado se almacena en DX y AX (valor maximo 65,025)      
    MOV AX, 100     ; El 300 ya excede los 8 bits (1 byte), por lo que necesita ser cargado en el Registro completo AX                               
    MOV BX, 500     ; Con el 500 pasa lo mismo, pero se guarda en BX
    MUL BX      ; Igualmente se multiplica implicitamente por AX 
    ; El resultado es 150,000 (249F0h) --> Se guarda combinado en 
    
    ; Otro ejemplo usando DX. Aplica lo mismo para multipliciones BYTE, puede usarse DL
    ; Pero para evitar confusiones, es mejor usar BL y BX respectivamente
    MOV AX, 270
    MOV DX, 1000
    MUL DX
    ; El resultado es 270,000 (41EB0h)
    
    ; La maxima multiplicacion que se puede hacer en WORD: 65,535 * 65,535
    MOV AX, 65535
    MOV BX, 65535
    MUL BX
    ; El resultado es 4,924,836,225(FFFE0001h)  
    
    ; --------------------------------------------------------------------------------------------------------------------
    
    ; DIVISION
    ; Se puede realizar de:
    ; - WORD / WORD (16 bits / 16 bits)
    ; - DWORD / WORD (32 bits / 16 bits)
    
    ; WORD / WORD 
    MOV AX, 505
    MOV BL, 3
    DIV BL ; Implicitamente se divide con AX
    ; Como resultado en AH se guarda el residuo, mientras que en AL se guarda el cociente.
    ; 505 / 3 = 168 con residuo 1
    ; AL = 168 (A8h) 
    ; AH = 1 (1h)
    
    ; Otro ejemplo
    MOV AX, 10
    MOV BX, 5
    DIV BL
    ; El resultado es:
    ; 10 / 5 = 2
    ; AL = 2 (2h)
    ; AH = 0 (0h)
          
          
    ; DWORD / WORD
    ; Para esta division aplica algo similar a la multiplicacion de WORD
    ; En este caso, el dividendo esta almacenado en DX y AX (El operando se pasa en hexadecimal)
    MOV DX, 003Fh
    MOV AX, 5555h
    ; Con estos dos resgistros se forma el dividendo:
    ; -> 3F5555h ---> 4,150,613
    ; Ahora el divisor 
    MOV BX, 0CCC4h ; 52,420 (decimal)
    DIV BX
    ; La division que se esta ejectando es:
    ; 4,150,613 / 52,420 (decimal) = 79, con residuo = 9,433
    ; IMPORTANTE: Al efectuarse la division, el cociente se guarda en AX, mientras que el residuo en DX
    ; Por ejemplo, para la division anterioro:
    ; -> AX (Cociente) = 79 (4Fh)
    ; -> DX (Residuo) = 9,433 (24D9)
            
    ; Otro ejemplo
    MOV DX, 00FFh
    MOV AX, 0FFFFh
    ; Dividiendo: 16,777,215
    MOV BX, 0AAAh ; Divisor: 2,730
    DIV BX
    ; Division efectuada:
    ;  16,777,215 / 2,730 = 6,145 (1,801h)
    ; Cociente: 6,145 (1,801h) ---> AX
    ; Residuo: 1,365 (555h) ---> DX
    
.exit
main ENDP  
END
