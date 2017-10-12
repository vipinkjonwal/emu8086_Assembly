DATA SEGMENT
    PACKED DB 23H
    UNPACKED DW 0H
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA
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
        