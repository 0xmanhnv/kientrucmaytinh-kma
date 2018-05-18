.Model Small
.Stack 100h
.Data 
    ; KHai bao bien
    input DW 'Nhap  vao mot ky tu$'
    tb DW 'KY tu Ban vua nhap: $'
    kytu db ? 
    br db 13, 10, '$'
.Code
    MAIN proc
       MOV AX, @Data
       MOV DS, AX
       
       ; chuong trinh chinh 
       
       ; Bat dau nhap ky tu
       Nhap:
            ; in ra cau thong bao nhap
            MOV AH, 9
            lea DX, input
            INT 21H
            MOV AH, 1 ; Nhap ky tu
            INT 21H
            MOV kytu, AL ; luu gia tri vua nhap vao bien ky tu
            ; xuong dong
            MOV AH, 9
            lea DX, br
            INT 21H
       Hienthi: 
            ; hien thi thong bao ky tu
            MOV AH, 9
            Lea DX, tb
            INT 21H 
            ; hien thi ky tu
            MOV AH, 2
            mov dl, kytu
            INT 21H
       
       
    EXIT:
        MOV AH, 4CH
        INT 21H
    MAIN endp 
        ; chuong trinh con
END MAIN