
; Types of Addressing Modes / Modos de direccionamiento
; Valeria Paola Chavez Flores
; Darely Quezada Guerrero
; 10/04/2025
; Assembler 

.model small 

.stack 100h
  
.data   
    value1 DB 10    ; for direct mode 
    value2 DB 20    ; for direct mode
    result DB 0     ; for storing a result

.code
main PROC
      MOV AX, @data
      MOV DS, AX  
      
      ; 1. INMMEDIATE MODE / MODO INMEDIATO
      ; Loading a value directly
      MOV AL, 5   
      
      ; 2. DIRECT MODE / MODO DIRECTO
      ; Loading a value of a fixed address (variable)
      MOV BL, value1    ; BL = contents of [value1] = 10
      MOV BH, value2    ; BH = contents of [value2] = 20
      
      ; 3. REGISTER MODE / MODO DE REGISTRO
      ; An operation between registers is performed 
      ADD BL, BH        ; BL = BL + BH ? 10 + 20 = 30
      
      ; Store result in memory (direct mode again)
      MOV result, BL    ; result = 30
      
      ; 4. REGISTER INDIRECT MODE / MODO INDIRECTO POR REGISTRO
      ; We use a register (as it is SI) for pointing to the memory 
      LEA SI, value1    ; SI points to value1
      MOV AL, [SI]      ; AL = contents of [SI] = 10
      
      ; 5. DISPLACEMENT MODE / MODO CON DESPLAZAMIENTO
      ; We access to value2 using SI + displacement
      ; value2 is placed 1 byte after value1
      MOV AH, [SI+1]    ; AH = contents of [SI+1] = value2 = 20
      
      TERMINATE:
      MOV AH, 4Ch
      INT 21h
  

MAIN ENDP
END MAIN  


; DS and CS are reserved registers and can't be used at the same time:
      ; MOV DS, CS --> This is INCORRECT

; CS and IP can't be used in this mode 

; MOV --> 1011          --> Every instruction is coded in binary 
; AH, --> 0 0100        --> 8 bits
; 20h --> 0010 0000     

; SCALED MODE / MODO ESCALAR 
; microprocessor 80386

    ; MOV AL, [EBX + ESI * 3 + 4]




