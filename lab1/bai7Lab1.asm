.Model Small
.Stack 100h
.Data 
    ; khai bao bien  
.Code
    MAIN proc
        MOV ax, @data
        MOV ds, ax
                        
        ;so lan lap
        MOV cx, 3                  
        
    RING:
        ; keu teng bip
        MOV AH, 2h
        MOV dl, 7h
        INT 21H
        LOOP RING  
                
    EXIT:
        MOV AH, 4CH
        INT 21H 
        
        
        
    MAIN endp
END MAIN