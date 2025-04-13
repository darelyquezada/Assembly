
; Lectura de una cadena
; Valeria Paola Chávez Flores     
; Darely Quezada Guerrero
; 26/02/25
; Ensamblador
                         
                         
.model small  

.stack
  
.data  
    msg DB "Ingresa una cadena: $"  ; El caracter de fin de cadena se coloca dentro de la cadena
    msg2 DB 10, 13, "Cadena ingresada: $"   ; Incluye el salto de linea, el retorno al inicio y una nueva cadena
    cadena DB 20    ; Tamano maximo de la cadena
    count DB ?      ; Numero real de caracteres ingresados (se llenara al leer)
    buffer DB 20 DUP('$')   ; Espacio para almacenar hasta 20 caracteres ingresados --> DUP = Duplicate
    salto DB 10, 13, "$"    ; Salto de linea

.code  
MAIN PROC  
    MOV AX, @data  ; Inicializar segmento de datos
    MOV DS, AX  
                                              
    ; Imprimir mensaje de solicitud
    MOV AH, 09h  
    LEA DX, msg ; --> LEA (Low Effective Address) 
    INT 21h  

    ; Leer la cadena desde el teclado
    MOV AH, 0Ah   ; Funcion de DOS para entrada de buffer   
    LEA DX, cadena  ; Cargar direccion del buffer  
    INT 21h  

    ; Se almacena la cantidad de caracteres ingresados en "count"
    MOV AL, count           ; AL = numero de caracteres ingresados  
    MOV AH, 0               ; Limpiar la parte alta de AX  
    MOV SI, OFFSET buffer   ; Apuntar SI al inicio del buffer  
    ADD SI, AX              ; Mover SI a la posicion donde termina la cadena  

    ; Agregar el terminador '$' para que la impresion con 09h funcione
    MOV BYTE PTR [SI], '$'  

    ; Imprimir un salto de linea
    MOV AH, 09h  
    LEA DX, salto  
    INT 21h  

    ; Imprimir mensaje indicando que ahora se mostrara la cadena ingresada
    MOV AH, 09h  
    LEA DX, msg2  
    INT 21h  

    ; Imprimir la cadena ingresada
    MOV AH, 09h  
    LEA DX, buffer  
    INT 21h  

    ; Terminar el programa correctamente
    MOV AH, 4Ch  
    INT 21h  

MAIN ENDP  
END MAIN                           


