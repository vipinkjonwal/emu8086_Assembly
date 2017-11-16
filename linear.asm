;***** ASSEMBLY LANGUAGE PROGRAM *****
;LINEAR SEARCH
;AUTHOR : VIPIN KUMAR (44)

DATA SEGMENT
    ARRAY DB 12H,04H,19H,17H,07H            ;INDEX starts at 0, Initializing of array ARRAY            
    ELE DB 04H                              ;ELE Variable, element need to be searched in ARRAY
    INDEX DW ?                              ;Memory Allocation for INDEX of ELE found.
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA,CS:CODE
    
    START:
        MOV AX,DATA
        MOV DS,AX
        
        XOR AX,AX                           ;Setting AX = 0 and clearing all flags of PSW    
        MOV SI,0
        MOV CX,5                            ;Initializing counter value to 5
        MOV BX,OFFSET ARRAY                 ;Setting of address of ARRAY to register BX
        
    SEARCH:
        MOV DL,BX[SI]
        CMP DL,ELE
        JZ FOUND                            ;If ELE found, jump to label FOUND
        INC SI
        LOOP SEARCH

    NOTFOUND:
        MOV INDEX,-1                        ;INDEX=-1 implies ELEMENT NOT FOUND.
        JMP EXIT
        
    FOUND:
        MOV INDEX,SI                        ;INDEX = SI implies ELEMENT FOUND AT INDEDX SI
                
EXIT:
CODE ENDS
END START
