
; Bubble Sort
; Valeria Paola Chavez Flores
; Darely Quezada Guerrero
; 30/03/2025
; Assembler

.stack 100h

.data
    array DB 1, 15, 12, 20, 4, 2, 8, 35, 30 ; Array size = 9
    
.code

main PROC
    MOV AX, @data
    MOV DS, AX
    
    MOV CX, 8   ; Initialize the counter register with the number of comparations (array size - 1)
    
    LOOP_1:
    PUSH CX     ; Move CX value in the stack
    MOV SI, 0   ; Initialize indexes    
    MOV DI, 0
    
    LOOP_2:
    INC DI              ; Increment DI to compare with the next position
    MOV AL, array[SI]   ; Move the array value in position SI to AL register
    CMP AL, array[DI]   ; Compare with the array value in position DI
    JA  MORE            ; Jump to SWAP if its higher
    JB  SWAP            ; Jump to LESS if its lower   
    ; Ascending orden:
    ; JA SWAP 
    ; JB LESS 
    
    SWAP:
    MOV AH, array[DI]   ; Move the array value in DI to AH (Simulating an auxiliar variable) 
    MOV array[DI], AL   ; Move the value in AL to the array position DI (line 29)
    MOV array[SI], AH   ; Move the in AH to the array position SI
    
    MORE:
    INC SI              ; Increment SI allowing it to change to the next position 
    LOOP LOOP_2         ; Decrement CX in one and then jump to LOOP_2 if its different than 0
    POP CX              ; Move CX value out from the stack
    LOOP LOOP_1         ; Decrement CX in one and then jump to LOOP_1 if its different than 0
    
    TERMINATE:     
    ; Correct program termination
    MOV AH, 4Ch ;4Ch function: Terminate program in DOS
    INT 21h     ; Calling to interruption DOS
    
main ENDP
END main



