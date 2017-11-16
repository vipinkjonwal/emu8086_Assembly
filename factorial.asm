DATA SEGMENT
    NUMBER DW 5                     ;Initializing the NUMBER, emu8086 is capable of calculating the factorial upto 8
    FACTORIAL DW ?                  
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA,CS:CODE
    
START:
    MOV AX,DATA
    MOV DS,AX
    MOV AX,1                        ;Base Case of Factorial i.e, fact(0) = 1
    MOV CX,NUMBER

AGAIN:
    MUL CX
    MOV FACTORIAL,AX
    LOOP AGAIN    
    MOV FACTORIAL,AX                ;Setting value of AX to the variable FACTORIAL

CODE ENDS
END START
