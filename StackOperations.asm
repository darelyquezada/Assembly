
; Stack operations
; Valeria Paola Chavez Flores
; Darely Quezada Guerrero
; 20/03/2025
; Assembler

.model small       

.data      

.code 

MAIN PROC
    MOV AX, 30  ; A = 30 = 1Eh
    MOV BX, 2   ; B = 2 = 2h
    MOV CX, 100 ; C = 100 = 64h   ; C must be bigger than B in order to get a negative result to the substraction
    MOV DX, 25  ; D = 25 = 19h
    
    ; Store values (on the stack) in a differect order
    PUSH BX ; B = 2
    PUSH CX ; C = 100
    PUSH AX ; A = 30
    PUSH DX ; D = 25
    
    ; Extract values in a different order
    POP AX ; AX = D = 25
    POP DX ; DX = A = 30
    POP CX ; CX = C = 100
    POP BX ; BX = B = 2
    
    ; Do operations with the new order
    ADD AX, DX ; AX = D + A = 25 + 30 = 55
    SUB BX, CX ; BX = B - C = 2 - 100 = -98
    
    IMUL BX ; AX = AX * BX = 55 * (-98) = -5, 390

main ENDP
END main


