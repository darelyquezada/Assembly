
; Simple menu
; Valeria Paola Chavez Flores
; Darely Quezada Guerrero 
; 09/04/2025
; Assembler

.model small

.data
; 
jump    DB 13, 10, '$'

; Menu and options (CR and LF are used for line jumps)    
menu    DB 13, 10, '------ MENU ------', 13, 10
        DB '1. Greet', 13, 10
        DB '2. Write your name and ', 13, 10
        DB '3. EXIT', 13, 10
        DB 'Choose an option: $'
     

; Variable for storing the read option
    option DB ?
    
; Input buffer with 0Ah function
; Structure:
;   - Byte 0: Maximum capacity (20 in this case)
;   - Byte 1: Total read characters
;   - From Byte 2 an on: Text entered
buffer  DB 20
        DB ?
        DB 20 dup('$')  

; Aditional messages
name_msg DB 13, 10, 'Write your name: $'
hi_msg   DB 13, 10, 'Hello!$'
saludo_msg DB 13, 10, 'Hello, $'
bye_msg  DB 13, 10, 'See you later!$'
error_msg DB 13, 10, 'Invalid option.$'  
another_msg DB 13, 10, "La pelona de pitbull $"

.code  

MAIN PROC
    MOV AX, @data   ; Initialize Data Segment
    MOV DS, AX         
    
    menu_start:
    ; -------------------------------------------
    ; Print menu using INT 21h, 09h function.
    MOV  AH, 09h
    LEA DX, menu
    INT 21h
    
    read_option:
    ; -------------------------------------------    
    ; Read option choosen by the user with INT 21h, 01h function
    ; 01hfunction: Reads ONE character and stores it on AL
    MOV AH, 01h
    INT 21h
    
    ; Verify if a CR (13 code) was received -- This happens for safety
    CMP AL, 13
    JE read_option  ; If it is CR, sets up again for reading a key
    
    MOV option, AL  ; Stores the read option in the variable "option"
    
    ; -------------------------------------------
    ; Add a line jump to separate the uotput in one single instruction
    MOV AH, 09h
    LEA DX, jump
    INT 21h
    
    CMP option, '1'
    JE option_1  
    
    CMP option, '2'    
    JE option_2  
    
    CMP option, '3'
    JE exit    
    
    ; Option 1: Simple hello
    option_1:
        MOV AH, 09h
        LEA DX, hi_msg
        INT 21h 
        
        ; Print message
        MOV AH, 09H
        LEA DX, another_msg
        INT 21h
        
        JMP menu_start
    
    ; Option 2: Ask for name, then say hi
    option_2:
        MOV AH, 09h
        LEA DX, name_msg
        INT 21h
        
        
        MOV AH, 0AH
        LEA DX, buffer
        INT 21h
        
        ; Print hi message
        MOV AH, 09H
        LEA DX, saludo_msg
        INT 21h   
        
        ; Print name
        LEA DX, buffer + 2
        MOV AH, 09h
        INT 21h
        
        JMP menu_start
    
    ; Option 3: Exit program
    exit:
      MOV AH, 09h
      LEA DX, bye_msg
      INT 21h  
    
    
      MOV AH, 4Ch
      INT 21h
    
    
MAIN ENDP
END MAIN




