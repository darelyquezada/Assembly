
; Impresion de un caracter
; Darely Quezada Guerrero
; Valeria Paola Chavez Flores
; 25/02/25
; Ensamblador 

.model small   ; Modelo pequeno

.data          ; Inicia la seccion de datos donde se definen las variables
    char DB " ", "$"     ; Define Byte con un espacio en blanco y un $ (indica el final de una cadena en DOS)
    salto DB 10, 13, "$" ; Define Byte 
                         ; 10 -> LF -- Similar a \n, ASCII
                         ; 13 -> CR -- Regresa el cursor al inicio de la linea, ASCII
    
.code   ; Seccion de codigo

MAIN PROC
    MOV AX, @data ; Move all data to AX
    MOV DS, AX    ; Esto inicializa el segmento de datos para que el programa pueda acceder a las variables definidas en .data
    ; MOV ES, AX
    
    ; Lectura del caracter
    MOV AH, 01H   ; Lectura por teclado
    INT 21H       ; Interrupcion de lectura desde teclado
    MOV char, AL  ; Lo leido se almacena en AL
    
    ;Impresion del salto de linea
    MOV AH, 09H   ; Imprimir una cadena
    LEA DX, salto ; Carga el salto en DX
    INT 21H       ; Interrupcion para imprimir
    
    ; Impresion del valor de la variable
    MOV AH, 09H   ; Indica que se va a imprimir AH
    LEA DX, char  ; Carga la direccion de la variable que contiene el caracter leido
    INT 21H       ; Interrupcion para imprimir
    

.exit  ; Interrupcion 21H con AH = 4CH para terminar el programa
MAIN ENDP
END



