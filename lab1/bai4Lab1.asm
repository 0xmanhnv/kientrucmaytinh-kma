.Model Small
.Stack 100h
.Data 
    ; khai bao bien
    input dw 'Moi ban nhap vao mot so: $'; 
    kt db ?  
    khong db 'Khong$'
    mot db 'Mot$'
    hai db 'hai$'
    ba db 'ba$'
    bon db 'bon$'
    nam db 'nam$'
    sau db 'sau$'
    bay db 'Bay$'
    tam db  'tam$'
    chin db 'chin$' 
    br db 13, 10, '$'
.Code
    MAIN proc
        MOV ax, @data
        MOV ds, ax
    NHAP:
        MOV AH, 9
        lea DX, input
        INT 21H
        
        ; nhap vao ky tu
        MOV AH, 1
        INT 21H 
        MOV kt, al 
        
        ; so sanh
        CMP kt, 48
        JE inKhong
        
        CMP kt, 49
        JE inMot  
        
        CMP kt, 50
        JE inHai  
        
        CMP kt, 51
        JE inBa 
        
        CMP kt, 52
        JE inBon
        
        CMP kt, 53
        JE inNam 
        
        CMP kt, 54
        JE inSau 
        
        CMP kt, 55
        JE inBay 
        
        CMP kt, 56
        JE inTam
        
        CMP kt, 57
        JE inChin
        
       
       inKhong:
           MOV AH, 9
           lea DX, br
           INT 21H
           MOV AH, 9
           lea dx, khong
           INT 21H
           JMP EXIT
       inMot: 
           MOV AH, 9
           lea DX, br
           INT 21H
           MOV AH, 9
           lea dx, mot
           INT 21H
           JMP EXIT
       inHai:
           MOV AH, 9
           lea DX, br
           INT 21H
           MOV AH, 9
           lea dx, hai
           INT 21H
           JMP EXIT
       inBa:
           MOV AH, 9
           lea DX, br
           INT 21H
           MOV AH, 9
           lea dx, ba
           INT 21H
           JMP EXIT
       inBon:
           MOV AH, 9
           lea DX, br
           INT 21H
           MOV AH, 9
           lea dx, bon
           INT 21H
           JMP EXIT
       inNam:
           MOV AH, 9
           lea DX, br
           INT 21H
           MOV AH, 9
           lea dx, nam
           INT 21H
           JMP EXIT
       inSau:
           MOV AH, 9
           lea DX, br
           INT 21H
           MOV AH, 9
           lea dx, sau
           INT 21H
           JMP EXIT
        inBay:
           MOV AH, 9
           lea DX, br
           INT 21H
           MOV AH, 9
           lea dx, bay
           INT 21H
           JMP EXIT
        inTam:
            MOV AH, 9
           lea DX, br
           INT 21H
           MOV AH, 9
           lea dx, tam
           INT 21H
           JMP EXIT
       inChin:
           MOV AH, 9
           lea DX, br
           INT 21H
           MOV AH, 9
           lea dx, chin
           INT 21H
           JMP EXIT   
                
    EXIT:
        MOV AH, 4CH
        INT 21H 
        
        
        
    MAIN endp
END MAIN