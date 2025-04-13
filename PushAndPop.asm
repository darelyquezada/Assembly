
; Push and Pop (Stack)
; Valeria Paola Chavez Flores
; Darely Quezada Guerrero 
; 20/03/2025
; Assembler

.model small

.stack 100h ; Reserve 256 bytes of memory for the stack
.data
.code
main PROC  
    MOV AX, @data ; Initialization of Data Segment
    MOV DS, AX
    
    ; Initializa some arbitrary values
    MOV AX, 1
    MOV BX, 1024
    MOV CX, 100
    MOV DX, 15
    
    ; Push values in the stack 
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    ; Pop values from the stack
    POP AX    
    POP AX
    POP AX
    POP AX
    

    ; Exchange of values using the stack (no auxiliar variable)
    MOV AX, 10 ; AX = 10
    MOV BX, 20 ; BX = 20      
    PUSH AX ; Store AX on the stack (10)
    PUSH BX ; Store BX on the stack (20)
    
    POP AX ; Pop the last value (20) and store it in AX
    POP DX ; Pop the last value (10) and store it in BX    
    
    TERMINAR:
    ; Terminate program correctly
    MOV AH, 4Ch ; Funcion 4Ch: Terminar programa en DOS 
    INT 21h ; Llamada a interrupcion DOS
    
main ENDP 

END main




