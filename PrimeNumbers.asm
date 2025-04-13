
; Prime numbers
; Valeria Paola Chavez Flores
; Darely Quezada Guerrero
; 01/04/2025
; Assembler  

.model small     
.stack 100h
.data    
    ; Original array of numbers
    array DB 4, 6, 8, 9, 10, 12, 11, 14, 16   
    count DW 9
    
    ; Array that stores prime numbers
    Primes DB 9 DUP(?)
    totPrimes DW 0  ; Total prime numbers found

.code
main PROC
    MOV AX, @data   ; Initialize Data Segment
    MOV DS, AX   
    
    MOV CX, count   ; CX = total elements in the array 
    MOV SI, 0       ; SI = original array index
    XOR DI, DI      ; DI = index of Prime numbers array (starts at 0)
    
    NEXTNUMBER: 
        MOV AL, array[SI]   ; Store actual number on AL
        MOV BL, AL          ; BL keeps stored the number for the verification
       
    ; Verify if the number is below 2 (not prime)
    CMP BL, 2
    JB NOTPRIME
    
    ; Number 2 is prime
    CMP BL, 2
    JE STOREPRIME
    
    ; In case the number is above 2, test if there is any divider between 2 and (n - 1)
    MOV DL, 2   ; DL will be the divider, starting at 2
        
    PRIMELOOP:                                                                             
        MOV AL, BL  ; Set the verification number in AL
        XOR AH, AH  ; Clean AH for the division (AX = BL)
        DIV DL      ; Divide BL (AL) by DL; AL = quotient, AH = residue
        CMP AH, 0   ; If the residue is 0, BL is dividable by DL, then it it not a prime number
        JE NOTPRIME ;  
        INC DL
        CMP DL, BL
        JL PRIMELOOP
        
    STOREPRIME:
        MOV AL, BL
        MOV Primes[DI], AL
        INC DI
        JMP DONECHECK
        
    NOTPRIME:
        NOP
    
    DONECHECK:
        INC SI
        LOOP NEXTNUMBER
        
        MOV totPrimes, DI
        
        MOV AH, 4Ch
        INT 21h   
    
main ENDP
END main
        
    