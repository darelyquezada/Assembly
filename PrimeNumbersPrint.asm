
; Prime numbers
; Valeria Paola Chavez Flores
; Darely Quezada Guerrero
; 01/04/2025
; Assembler  

.model small     
.stack 100h
.data    
    ; Original array of numbers
    array DB 2, 3, 4, 5, 10, 11, 20, 40, 14   
    count DW 9
    jump DB 10, 13, "$" 
    num DB " ", "$"  
    yes DB "Prime $"  
    no DB "Not prime $"
                  
    
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
        
        ; Verify if the number is above 9
        CMP BL, 9
        JA PRINTBOTH    
   
        PRINTONE:  
            MOV AH, BL     ; Move original array number to AH
            ADD AH, 48     ; ASCII conversion                                                          
            MOV num, AH    ; Move AH (number) to num
            CALL PRINTJUMP            
            MOV AH, 09H    ; Print original array number
            LEA DX, num
            INT 21H    
            JMP CONTINUE   ; Continue program
            
        PRINTBOTH: 
            CALL PRINTJUMP
            MOV BH, 10     ; Move number 10 to BH
            MOV AL, BL     ; Store BL in AL to perform the division
            XOR AH, AH     ; Prepare AH for the division
            DIV BH         ; AL / BH = number / 10; AL = quotient, AH = residue 
            
            MOV BH, AH     ; Store residue in BH
            ADD AL, 48     ; ASCII conversion                                                          
            MOV num, AL    ; Move AH (number) to num 
            MOV AH, 09H    ; Print number (quotient)
            LEA DX, num
            INT 21H          
            
            ADD BH, 48     ; ASCII conversion                                                          
            MOV num, BH    ; Move AH (number) to num
            MOV AH, 09H    ; Print number (residue)
            LEA DX, num
            INT 21H  
            
     CONTINUE:
        ; Verify if the number is below 2 (not prime)
        CMP BL, 2
        JB NOTPRIME
        
        ; Number 2 is prime
        CMP BL, 2
        JE STOREPRIME   
        
        ; In case the number is above 2, test if there is any divider between 2 and (n - 1)
        MOV DL, 2   ; DL will be the divider, starting at 2
            
        PRIMELOOP:                                                                          
            MOV AL, BL      ; Set the verification number in AL          
            XOR AH, AH      ; Clean AH for the division (AX = BL)      
            DIV DL          ; Divide BL (AL) by DL; AL = quotient, AH = residue       
            CMP AH, 0       
            JE NOTPRIME     ; If the residue is 0, BL is dividable by DL, then it it not a prime number 
            INC DL          ; Increment divisor
            CMP DL, BL      ; Continue while DL < BL
            JL PRIMELOOP    ; 
        
        ; If the loop completes whithout finding a divisor, the number is prime
        STOREPRIME: 
            CALL PRINTJUMP
            
            MOV AH, 09H       ; Print message "Prime"
            LEA DX, yes
            INT 21H    
            
            XOR AH, AH   
            
            CALL PRINTJUMP
                              ; 
            MOV AL, BL  
            MOV Primes[DI], AL 
            INC DI
            JMP DONECHECK
            
        NOTPRIME: 
            XOR AH, AH
            CALL PRINTJUMP
            MOV AH, 09H    ; Print message "Not prime"
            LEA DX, no
            INT 21H     
            
            XOR AH, AH  
            
            CALL PRINTJUMP
            
        
        DONECHECK:
            INC SI
            LOOP NEXTNUMBER
            
            MOV totPrimes, DI
            
            MOV AH, 4Ch
            INT 21h     
        
        PRINTJUMP: 
            MOV AH, 09H    ; Print jump
            LEA DX, jump
            INT 21H   
            RET        
        
main ENDP
END main
            
        