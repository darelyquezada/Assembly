
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
        
        ; -----------------------------------------------------------------------------
        ; PRINT NUMBERS
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
            JE NOTPRIME     ; If the residue is 0, BL can be divided by DL, then it is not a prime number 
            INC DL          ; Increment divisor
            CMP DL, BL      ; Continue while DL < BL
            JL PRIMELOOP    ; 
        
        ; If the loop is completed without finding a divisor, the number is prime
        STOREPRIME: 
            CALL PRINTJUMP
            
            MOV AH, 09H       ; Print message "Prime"
            LEA DX, yes
            INT 21H    
            
            XOR AH, AH   
            
            CALL PRINTJUMP
                              
            MOV AL, BL        ; AL = prime number
            MOV Primes[DI], AL; Store prime number in Primes array
            INC DI            ; Increment index for next prime number
            JMP DONECHECK
            
        NOTPRIME:  
            ; If the number is not prime, the number isn't stored and then the next number is evaluated 
            ; NOP           ; This instruction does nothing 
           
            CALL PRINTJUMP
            
            MOV AH, 09H     ; Print message "Not prime"
            LEA DX, no
            INT 21H     
            
            XOR AH, AH  
            
            CALL PRINTJUMP
            
        
        DONECHECK:
            INC SI              ; Go to next number in the original array
            LOOP NEXTNUMBER     ; Repeat this CX times (elements count)
                                ; LOOP --> This instruction compares CX to 0 repeatedly until CX is equal to 0
                                ; CX acts as a decrementing counter (CX--)
            
            ; At the end of the program, DI contains the total of prime numbers found
            MOV totPrimes, DI   
            
            ; Terminate program
            MOV AH, 4Ch
            INT 21h     
        
        PRINTJUMP: 
            MOV AH, 09H    ; Print jump
            LEA DX, jump
            INT 21H   
            RET        
        
main ENDP
END main
            
        