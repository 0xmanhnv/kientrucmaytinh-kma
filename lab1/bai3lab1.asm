.Model Small
.Stack 100h
.Data
    ; khai bao bien
    msgT db 'Ban chon chuc nang $' 
    msgF db 'Khong co chuc nang $'
    chonLai db 'MOI ban chon lai: $'
    
    menu db '1. CHON 1 DE NHAP XAU',13,10,
         db '2. CHON 2 DE IN XAU DA NHAP',13,10
         db '3.Chon 3 de hien thi xau dao nguoc xau da nhap',13,10
         db '4. Chon 4 de chuyen xau da nhap sang chu hoa va in',13,10
         db '5. Chon 5 de kiem tra xem xau co la 1 so khong',13,10
         db '6. Chon 6 de ket thuc',13,10
         db '7. chon:$'
    kt db ? 
    br db 13,10, '$'
.Code
    MAIN proc
        ; chuyen data vao thanh ghi ds
        MOV Ax, @data
        MOV ds, AX
        ; chuong trinh chinh 
        ; hien thi menu
        MOV AH, 9
        Lea dx, menu
        INT 21h  
     NHAP:   
        ; nhap chon
        MOV AH, 1
        INT 21H 
        MOV kt, al

        ; so sanh
        CMP kt,49
        JE THONGBAOtrue
        CMP kt,50
        JE THONGBAOtrue
        CMP kt, 51
        JE THONGBAOtrue
        CMP kt, 52
        JE THONGBAOtrue
        CMP kt, 53
        JE THONGBAOtrue 
        JMP THONGBAOfalse ; chon khong dung chuc nang thi in ra loi
 
    THONGBAOtrue:
        ; xuong dong
        MOV AH, 9
        lea dx, br
        INT 21H
        
        ; hien thi thong bao
        MOV AH, 9
        lea dx, msgT
        INT 21H
        ; ky tu nhap vao
        MOV AH, 2  
        MOV dl, kt
        INT 21H
        
        ; thoat chuong trinh
        JMP EXIT 
        
     THONGBAOfalse:
        ; xuong dong
        MOV AH, 9
        lea dx, br
        INT 21H
        
        ; hien thi thong bao
        MOV AH, 9
        lea dx, msgF
        INT 21H
        ; ky tu nhap vao
        MOV AH, 2  
        MOV dl, kt
        INT 21H 
        
        ; xuong dong
        MOV AH, 9
        lea dx, br
        INT 21H
        ; moi chon lai
        MOV AH, 9
        lea dx, chonLai
        INT 21H 
        JMP NHAP
         
    EXIT:
        MOV AH, 4ch
        INT 21H
    MAIN endp
END MAIN