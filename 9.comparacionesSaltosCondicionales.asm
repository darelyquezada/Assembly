
; Comparaciones y Saltos / Saltos y condicionales 
; Valeria Paola Chavez Flores
; Darely Quezada Guerrero
; 06/03/2025
; Ensamblador

.model small

.stack

.data


.code
main PROC
    MOV AX, @data ; Inicializador del segmento de datos
    MOV DS, AX
    
    ; Compare (CMP): Sirve para hacer comparaciones. Implicitamenre resta el segundo operando menos el primero
    ; pero solo se refleja en las banderas (FLAGS)
    
    ; Zero Flag (ZF): Se enciende (se pone en 1) cuando el resultado es 0
    ; Se apaga (se pone en 0) cuando el resulatado no es 0
    
    ; Ejemplo de uso -- Comparacion y activacion de la bandera
    MOV AL, 7
    MOV BL, 7
    CMP AL, BL
    
    ; Ejemplo donde no se activa (o en este caso, se desactiva)
    MOV AL, 5
    CMP AL, 6
    
    
    ; Otro ejemplo
    MOV AX, 256
    CMP AX, 256
    
    ; SALTOS --------------
    ; Jump if Zero (JZ): Salta si el resultado es cero, es decir, si ZF se activa
    MOV AL, 20
    CMP AL, 20
    JZ RESULTADO_ES_CERO
    
    MOV BH, 20  ; Esta instruccion tiene q saltarse
    
    RESULTADO_ES_CERO:
        ; Instruccion solo de prueba (para verificar que se cumplio la condicion)
        MOV BL, 15
    
    ; Jump if NOt Zero (JNZ): Salta si el resultado NO es cero, si ZF no se activa
    MOV AL, 6
    CMP AL, 9
    JNZ RESULTADO_NO_ES_CERO
    
    MOV BH, 20 ; Esta instruccion tiene que saltarse
    
    RESULTADO_NO_ES_CERO:
        ; Instruccion solo de prueba (para verificar que se cumplio la condicion)
        MOV BL, 1     
    
    ; Que pasa si una condicion a evaluar no se cumple?     
    ; El flujo del programa continua, lo que puede hacer que eventualmente se llegue
    ; a la etiqueta que no queriamos que se ejecutara
    
    ; Por ejemplo
    MOV AL, 4
    CMP AL, 4
    JNZ ET1 ; Al no cumplirse la condicion, no debe saltar a la etiqueta
    
    ET1:
        MOV AH, 40
        
    ; Sin embargo, el flujo de la ejecucion eventualmente llego a ET1
    ; Solucion:
    MOV AL, 5
    CMP AL, 5
    JNZ ET2   ; Misma situacion que la anterior
    
    ET2:
        MOV AH, 55
    
    ; Pero esta vez se evita su ejecucion con un JMP (Salto Incondicional)
    TERMINAR:
    ; Terminar programa correctamente
    MOV AH, 4Ch ; Funcion para terminar programa DOS
    INT 21h     ; Llamada interrupcion DOS

main ENDP
END main
    
    

