DATA SEGMENT
    NUM DW 05H                      ;Initializing the NUM
    RESULT DW ?                     ;Memory Allocation for final RESULT 
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE
    
START:
    MOV AX,DATA
    MOV DS,AX
    MOV AX,01H                      ;Base Case of Factorial i.e, fact(0) = 1
    CALL FACTORIAL                  ;Calling the Procedure FACTORIAL 
    MOV AH,04H                      ;Forceful Exit, though it's not advisable.
    INT 21H
    
    
    FACTORIAL PROC NEAR             ;Definition of FACTORIAL procedure
        CMP NUM,0
        JE DONE
        MUL NUM
        DEC NUM
        CALL FACTORIAL
        
    DONE:
    MOV RESULT,AX                   ;DONE Label to set value of AX to RESULT Variable.
    
    RET
    FACTORIAL ENDP                  ;END of FACTORIAL PROC 
CODE ENDS
END START
     
