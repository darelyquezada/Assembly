
; Second Exercise
; Valeria Paola Chavez Flores
; Darely Quezada Guerrero
; 10/03/2025
; Assembly    

.model small  

.stack
  
.data          
    name1 DB "D","a","r","e","l","y","Q","u","e","z","a","d","a","$"
    name2 DB "V","a","l","e","r", "i","a","C","h","a","v","e","z", "$"
    jump1 DB 10, 13, "$" ; Define Byte 
                         ; 10 -> LF -- Similar a \n, ASCII
                         ; 13 -> CR -- Returns cursor to the start of the line, ASCII 
    ;char1 "z"
    ;char2 "a"
    ;result DW
    
.code   ; Seccion de codigo

MAIN PROC
    MOV AX, @data ; Move all data to AX
    MOV DS, AX    ; Esto inicializa el segmento de datos para que el programa pueda acceder a las variables definidas en .data
    ; MOV ES, AX
         
    ; Part 1. Print names
    ; Print name1
    MOV AH, 09H   
    LEA DX, name1  
    INT 21H  
    
    ;Print \n
    MOV AH, 09H   ; Indicates printing of a string (chain of caracters)
    LEA DX, jump1 ; Move jump1 into DX
    INT 21H       ; Interruption to print endline
    
    ; Print name2
    MOV AH, 09H   
    LEA DX, name2
    INT 21H       
                 
    ; Part 2. Addition
    MOV AX, "z" ; Define the 10th character
    ADD AX, "a" 
    ; z = 122
    ; a = 97 
    ; AX = 219
    
    ; Part 3. Substraction
    MOV AX, "z"
    SUB AX, "a"     
    ; Result = 25
    
    ; Part 4. Multiplication BYTE
    MOV AL, "z" 
    MOV BL, "a"
    MUL BL
    
    ; Result = 11, 834  
    
    ; Part 5. Multiplication WORD
    MOV AX, 2E3Ah   ; Move previous result to AX
    MOV BX, 500     ; Move 500 to BX
    MUL BX
    ; DX = 5A   --> hexa
    ; AX = 4948 --> hexa
    ; 11, 834 * 500 = 5, 917, 000 --> decimal
    
    ; Part 6. Division  WORD / WORD
    MOV AX, "z"
    MOV BL, "a"
    DIV BL ; AX / BL
    ; 122 / 97 = 1 with residue 25 
    ; AL = 1 (01h) --> result
    ; AH = 25 (19h)--> residue 
    
    MOV AX, 0000h
    MOV BX, 0000h
    MOV DX, 0000h       
    
    ; Part 7. Division DWORD / WORD 
    MOV DX, 0020h
    MOV AX, "a"  ; AX = 61h DXAX = 2,097,249  --> decimal
    MOV BX, "z"  ; z = 122 = 7Ah
    DIV BX                                  
    ; 2097249 / 122 = 17190 with residue 69  
    ; 69 = 45h
 
    ; Part 8. CMP
    ;MOV AX, "a"
    ;MOV BX,"z" 
    ;CMP AX, BX
        
   
    

.exit  ; Interrupcion 21H con AH = 4CH para terminar el programa
MAIN ENDP
END






