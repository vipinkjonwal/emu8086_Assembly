;***** ASSEMBLY LANGUAGE PROGRAM *****
;MOVE BLOCK OF DATA TO ANOTHER LOCATION
;AUTHOR : VIPIN KUMAR (44)

DATA SEGMENT                        
    OLD DB 0AH,03H,01H,08H,04H,02H              ;OLD LOCATION   
    NEW DB 6 DUP(?)                             ;NEW LOCATION
DATA ENDS                           

CODE SEGMENT                        
    ASSUME DS:DATA,CS:CODE  

    START:                          
        MOV AX , DATA
        MOV DS , AX             
                
        LEA BX , OLD         
        LEA BP , NEW         
        MOV CX , 6            
    NEXT: 
        MOV AL , BX + SI         
        MOV BP + DI , AL         
        INC SI                  
        INC DI                  
        LOOP NEXT               
          
CODE ENDS                          
 
END START                       
