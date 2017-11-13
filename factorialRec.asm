DATA SEGMENT
    NUM DW 05H
    RESULT DW ?
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE
    
START:
    MOV AX,DATA
    MOV DS,AX
    MOV AX,01H
    CALL FACTORIAL
    MOV AH,04H
    INT 21H
    
    
    FACTORIAL PROC NEAR
        CMP NUM,0
        JE DONE
        MUL NUM
        DEC NUM
        CALL FACTORIAL
        
    DONE:
    MOV RESULT,AX
    
    RET
    FACTORIAL ENDP
CODE ENDS
END START
     