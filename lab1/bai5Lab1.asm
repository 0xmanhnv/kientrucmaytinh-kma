.Model Small
.Stack 100h
.Data 
    ; khai bao bien
    input dw 'Moi ban nhap vao ky tu: $'; 
    kt db ?  
    chuso db 13, 10,'La Chu So $'
    khongchuso db 13, 10,'Khong phai La Chu So $' 
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
        JE isChuSo
        
        CMP kt, 49
        JE isChuSo  
        
        CMP kt, 50
        JE isChuSo  
        
        CMP kt, 51
        JE isChuSo 
        
        CMP kt, 52
        JE isChuSo
        
        CMP kt, 53
        JE isChuSo 
        
        CMP kt, 54
        JE isChuSo 
        
        CMP kt, 55
        JE isChuSo 
        
        CMP kt, 56
        JE isChuSo
        
        CMP kt, 57
        JE isChuSo
        
        JMP notChuSo
        
       
       isChuSo:
           MOV AH, 9
           lea DX, br
           INT 21H
           MOV AH, 9
           lea dx, chuso
           INT 21H
           JMP EXIT
       notChuSo: 
           MOV AH, 9
           lea DX, br
           INT 21H
           MOV AH, 9
           lea dx, khongchuso
           INT 21H
           JMP EXIT   
                
    EXIT:
        MOV AH, 4CH
        INT 21H 
        
        
        
    MAIN endp
END MAIN