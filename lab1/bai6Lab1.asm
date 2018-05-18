.Model Small
.Stack 100h
.Data 
    ; khai bao bien
    input db 'Moi ban nhap vao ky tu: $'; 
    kt db ?
    br db 13, 10, '$'  
.Code
    MAIN proc
        MOV ax, @data
        MOV ds, ax
    NHAP:
        MOV AH, 9
        lea DX, input
        INT 21H
                        
        ;so lan lap
        MOV cx, 5                
        ; nhap vao ky tu
        MOV AH, 1
        INT 21H 
        MOV kt, al
        
         
        
    SHOW:
        ; cong len 1 don vi
        INC kt  
        ; xuong dong
        MOV AH, 9
        lea DX, br
        INT 21H
        ; in ra man hinh
        MOV AH, 2
        MOV dl, kt
        INT 21H
        LOOP SHOW  
                
    EXIT:
        MOV AH, 4CH
        INT 21H 
        
        
        
    MAIN endp
END MAIN