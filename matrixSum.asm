DATA SEGMENT
    MATRIX1 DW 01H,02H,03H
            DW 04H,05H,06H 
            DW 07H,08H,09H
    MATRIX2 DW 09H,08H,07H 
            DW 06H,05H,04H 
            DW 03H,02H,01H
    MATRIX DW 9 DUP(?)
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE
    
START:  
    MOV AX,DATA
    MOV DS,AX
        
    MOV SI,0
    MOV DI,0
    MOV CX,9
    MOV AX,0
    
AGAIN:
    ADD AX, MATRIX1[SI]
    ADD AX, MATRIX2[SI]
    INC SI
    INC SI
    MOV MATRIX[DI],AX
    INC DI
    INC DI
    MOV AX,0
    LOOP AGAIN
    
CODE ENDS
END START