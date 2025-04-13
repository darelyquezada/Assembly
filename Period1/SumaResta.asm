
; Suma y Resta
; Valeria Paola Chavez Flores
; Darely Quezada Guerrero
; 27/02/2025
; Ensamblador

.model small

.stack

.data

.code
main PROC
    MOV AX, @data   ;Inicializacion del segmento de datos
    MOV DS, AX
    ; MOV ES, AX
    
    ; SUMA
    MOV AL, 5
    ADD AL, 8  ; El limite maximo de AL es 255 - 8 bits
    
    ; SUMA
    MOV AL, 5
    ADD AL, -5
    
    ; SUMA
    MOV AL, 5
    ADD AL, -10
    
    ; RESTA
    MOV AL, 5
    SUB AL, 1
    
    ; RESTA
    MOV AL, 5
    SUB AL, -10
    
    ; Terminar programa correctamente
    MOV AH, 4Ch ; Funcion 4Ch: Terminar programa en DOS
    INT 21h     ; Llamada a interrupcion DOS
    
main ENDP
END main

     
; NOTAS

; Code Segment --> 1000h
; Instruction Pointer --> 0005h

; Direccion Fisica -> (CS x 16 (decimal)) + IP -> (1000h x 10h) + 0005h = 10005h  


