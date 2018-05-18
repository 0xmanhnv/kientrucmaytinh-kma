.Model Small
.Stack 100h
.Data 
    ; khai bao bien
    input dw 'Moi ban nhap vao ky tu: $'; 
    kt db ?  
    thuong db 13, 10,'THuong $'
    hoa db 13, 10,'Hoa $'
    notKT db 13, 10,'Khong phai la ky tu $' 
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
        
        CMP kt, 41 ; neu be thu 41
        JB  notKyTu ; khong phai la ky tu
        
        CMP kt, 122 ; lon hon 122
        JA  notKyTu ; khong phai la ky tu
        
        JMP ktThuong
        
        
       
       ktThuong:
           MOV AH, 9
           lea DX, br
           INT 21H
           MOV AH, 9
           lea dx, thuong
           INT 21H
           JMP EXIT
       ktHoa: 
           MOV AH, 9
           lea DX, br
           INT 21H
           MOV AH, 9
           lea dx, hoa
           INT 21H
           JMP EXIT 
       notKyTu: 
           MOV AH, 9
           lea DX, br
           INT 21H
           MOV AH, 9
           lea dx, notKT
           INT 21H
           JMP EXIT 
       ssKT:
           CMP kt, 97
           JB  ktHoa 
                
    EXIT:
        MOV AH, 4CH
        INT 21H 
        
        
        
    MAIN endp
END MAIN