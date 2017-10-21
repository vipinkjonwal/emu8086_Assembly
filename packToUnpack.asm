DATA SEGMENT
    PACKED DB 23H       ; a variable of byte sized in packed form having value 23H
    UNPACKED DW 0H
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA      ;populating ds with starting address of data segment
    ASSUME CS:CODE
    
START:
        MOV AX,DATA
        MOV DS,AX
        
        MOV AX,0
        MOV AL,PACKED
        MOV AH,0
        ROL AX,4
        ROR AL,4
        MOV UNPACKED,AX
CODE ENDS
END START
        
