DATA SEGMENT
    ARRAY DW 09H, 06H, 16H, 07H, 37H, 24H
    ELEMENT DW 26H
    INDEX DW ?
    TWO DB 2
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE
    
START:
    MOV AX,DATA
    MOV DS,AX
    
    MOV AX,0
    MOV SI,0
    MOV CX,6
    MOV BX,OFFSET ARRAY
    
    MYSEARCH PROC NEAR    
        SEARCH:
            MOV DX,BX[SI]
            CMP DX,ELEMENT
            JZ FOUND
            INC SI
            INC SI
            LOOP SEARCH
        
        NOTFOUND:
            MOV INDEX,-1
            MOV AH,4CH
            INT 21H
            
        FOUND:
            MOV AX, SI
            DIV TWO
            MOV AH,0
            MOV SI, AX
            MOV INDEX,SI
            MOV AH,4CH
            INT 21H
        
        RET  
    MYSEARCH ENDP

CALL MYSEARCH
    
CODE ENDS
END START
    


    
            

    