DATA SEGMENT
    ;MATRIX 1
    MAT1 DW 11H,21H,17H
         DW 35H,06H,09H
         DW 19H,26H,12H  
         
    MAT2 DW 15H,27H,27H
         DW 15H,03H,19H
         DW 09H,16H,16H
    MAT3 DW 9 DUP(?)
    
    ROW1 DW 03H
    ROW2 DW 03H
    COL1 DW 03H
    COL2 DW 03H
    
DATA ENDS

STACK SEGMENT
    DW 20 DUP(?)
    TOS LABEL WORD
STACK ENDS

CODE SEGMENT
    ASSUME DS:DATA,CS:CODE,SS:STACK

START:    
    MOV AX,DATA
    MOV DS,AX
    
    MOV AX,STACK
    MOV SS,AX
    MOV SP,TOS
    
    CALL ADDITION
    
    ADDITION PROC 
        PUSH CX
        PUSH AX
        PUSH SI
        
        MOV CX,ROW1
        MOV SI,0
        
        OUTER:
            PUSH CX
            MOV CX,COL1
            
            INNER:
                MOV AX,MAT1[SI]
                ADD AX,MAT2[SI]
                MOV MAT3[SI],AX
                INC SI
                INC SI
                LOOP INNER
            POP CX
            LOOP OUTER
    ADDITION ENDP
CODE ENDS
END START
            

    