;***** ASSEMBLY LANGUAGE PROGRAM *****
;LINEAR SEARCH
;AUTHOR : VIPIN KUMAR (44)

DATA SEGMENT
    ARRAY DB 12H,04H,19H,17H,07H    ;INDEX starts at 0            
    ELE DB 04H
    INDEX DW ?
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA,CS:CODE
    
    START:
        MOV AX,DATA
        MOV DS,AX
        
        MOV AX,0
        MOV SI,0
        MOV CX,5
        MOV BX,OFFSET ARRAY
        
    SEARCH:
        MOV DL,BX[SI]
        CMP DL,ELE
        JZ FOUND
        INC SI
        LOOP SEARCH

    NOTFOUND:
        MOV INDEX,-1                ;INDEX=-1 implies ELEMENT NOT FOUND.
        JMP EXIT
        
    FOUND:
        MOV INDEX,SI                ;INDEX=SI implies ELEMENT FOUND AT INDEDX SI
        JMP EXIT
        
EXIT:
CODE ENDS
END START