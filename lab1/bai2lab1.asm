.Model Small
.Stack 100h
.Data
    ; khai bao bien
    ten dw 'Ten: Nguyen Manh$'
    tuoi dw 'Tuoi: 21 $'
    lop dw 'Lop: AT12C$'
    br db 13,10,'$'
.Code
    MAIN Proc
        ; chuen data vao thanh ghi ds
        MOV ax, @data
        MOV ds, ax
        ; chuong trinh chinh 
        
        ; in ten
        MOV AH, 9
        lea DX, ten
        INT 21H
        ; xuong dong
        MOV AH, 9
        lea DX, br
        INT 21H
        
        ; in tuoi 
        MOV AH, 9
        lea DX, tuoi
        INT 21H 
        
        ; xuong dong
        MOV AH, 9
        lea DX, br
        INT 21H
        
        ; in lop 
        MOV AH, 9
        lea DX, lop
        INT 21H 
    EXIT:
        MOV AH, 4CH
        INT 21H
        MAIN endp
    END MAIN