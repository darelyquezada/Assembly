; Bit-masking (AND and OR), Rotations and Displacement / Enmascaramiento con AND, OR y Rotaciones
; Valeria Paola Chavez Flores
; Darely Quezada Guerrero
; 08/04/2025
; Assembler

.model small

.stack 100h

.data

.code
main PROC
      MOV AX, @data ; Initialize Data Segment
      MOV DS, AX
      
      ; BITMASKING WITH AND / ENMASCARAMIENTO CON AND
      MOV AL, 0FFh ; AL = 1111 1111b
      AND AL, 0Fh ; 0Fh = 15 = 0000 1111b 
      ; After applying AND, the low nibble is kept but not the high nibble
      
      ; BITMASKING WITH OR / ENMASCARAMIENTO CON OR
      MOV BL, 0Fh ; bl = 0000 1111b
      OR BL, 0F0h ; High nibble bits activate
      
      ; Clean registers
      MOV AX, 0
      MOV BX, 0
      
      ; ROTATION TO THE LEFT (ROL)
      MOV AL, 81h ; AL = 1000 0001b
      ROL AL, 1 ; AL rotates one position to the left
      ; AL = 0000 0011b
      
      ; We can rotate a whole register
      MOV BX, 7FFFh
      ROL BX, 1
                
      ; --------------------          
      XOR AX, AX
      XOR BX, BX
      
      ; ROTATION TO THE RIGHT (ROR)
      MOV AL, 81h ; AL = 1000 0001b
      ROR AL, 2   ; AL rotates two positions to the right 
      
      ; DISPLACEMENTS
      XOR AL, AL
      MOV AL, 255
      SHR AL, 2 ; Displace two positions to the right
      SHL AL, 3 ; Displace three positions to the left
      
                                                            
      ; Exercise 1: Convert 5A to D2 using ROTATIONS                                                                                                                      
      MOV AL, 5Ah   ; 0101 1010 = 5 A
      ROL AL, 3     ; Three rotations to the left --> 1101 0010 = D 2 
         
      ; Exercise 2: Convert 0011 1100 to 1100 0011 using DISPLACEMENTS and BIT-MASKING 
                
      ; Displacement to the right 
      MOV BL, 3CH   ; 0011 1100 = 3 C
      SHR BL, 2     ; 0000 1111 
      OR  BL, 0C3h  ; 1100 0011 = C 3. After bit-masking --> 1100 1111
      AND BL, 0C3h  ; 1100 0011 = C 3. After bit-masking --> 1100 0011
      
      
      XOR BL, BL   
      
      ;Displacement to the left
      MOV BL, 3CH   ; 0011 1100 
      SHL BL, 2     ; 1111 0000
      OR  BL, 0C3h  ; 1100 0011 . After bit-masking --> 1111 0011
      AND BL, 0C3h  ; 1100 0011 . After bit-masking --> 1100 0011
      
      
      XOR BL, BL
      
      ; Using only Bit-Masking
      MOV BL, 3Ch   ; 0011 1100  
      OR  BL, 0C3h  ; 1100 0011 . After bit masking --> 1111 1111
      AND BL, 0C3h  ; 1100 0011 . After bit masking --> 1100 0011
      
      TERMINATE:
      ;  Correct program termination
      MOV AH, 4Ch
      INT 21h

MAIN ENDP
END MAIN