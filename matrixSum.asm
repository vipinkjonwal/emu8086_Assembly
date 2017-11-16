DATA SEGMENT
    MATRIX1 DW 01H,02H,03H              ;Initializing Matrix1
            DW 04H,05H,06H 
            DW 07H,08H,09H
    MATRIX2 DW 09H,08H,07H              ;Initializing Matrix2
            DW 06H,05H,04H 
            DW 03H,02H,01H
    MATRIX DW 9 DUP(?)                  ;Matrix xontaining sum of Matrix1 and Matrix2
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE             
    
START:  
    MOV AX,DATA
    MOV DS,AX
        
    MOV SI,0                            ;Initializing the indices
    MOV DI,0
    MOV CX,9                            ;Initializing the counter
    XOR AX,AX                           ;Setting AX to ZERO and clearing all flags in PSW
    
AGAIN:
    ADD AX, MATRIX1[SI]
    ADD AX, MATRIX2[SI]
    INC SI
    INC SI                              ;Incrementing SI twice due to DW
    MOV MATRIX[DI],AX
    INC DI
    INC DI
    MOV AX,0
    LOOP AGAIN
    
CODE ENDS
END START
