.MODEL small
.STACK
.DATA      
menu db 13,10,'1. Bai1'              
db 13,10,'2. Bai2'  
db 13,10,'3. Bai3'
db 13,10,'4. Bai4'    
db 13,10,'5. Ket thuc' 
db 13,10,'Chon: $'      
;************************************************************************************************
menuB1 db 13,10,'1. Nhap vao 2 so co mot chu so trong dona [0 - 4] '             
db 13,10,'2. Tinh tong 2 so va in ket qua ra man hinh ' 
db 13,10,'3. Tinh hieu cua so lon cho so be va in ket qua ra man hinh '  
db 13,10,'4. Ket thuc'
db 13,10,'Chon $'
s1B1 db 13,10,'Nhap so thu nhat: $'
s2B1 db 13,10,'Nhap so thu hai: $'    
s3B1 db 13,10,'Tong cua 2 so la: $'
s4B1 db 13,10,'Hieu cua so lon cho so be la: $' 
;************************************************************************************************
tb1B2 DB 13,10,'Chuoi ban dau: $'
tb2B2 DB 13,10,'Chuoi sau khi dich ma: $'
sB2 DB 'ABCFEDJTES','$'
;************************************************************************************************
menuB3 db 13,10,'1. Nhap khoa thuoc doan [1 - 9]'              
db 13,10,'2. Ma hoa'  
db 13,10,'3. Giai ma'
db 13,10,'4. Ket thuc' 
db 13,10,'Chon: $'      
tb2B3 DB 13,10,'Xau ro: $'
tb3B3 DB 13,10,'Xau ma: $'
tb4B3 DB 13,10,'Nhap mot khoa thuoc doan [1 - 9]: $'
sB3 DB 'ABCFEDJTES','$'
;************************************************************************************************
sv1B4 DB 'Tram Anh','$' 
sv2B4 DB 'Tam Tit','$'
sv3B4 DB 'Bao Tran','$'
sv4B4 DB 'Chi Pu','$'
sv5B4 DB 'Kha Ngan','$'
sv6B4 DB 'Quynh Anh Shyn','$'
sv7B4 DB 'Chau Bui','$'
sv8B4 DB 'Kieu Trinh','$'
sv9B4 DB 'Hai Tu','$'
sv10B4 DB 'Ho Thu Anh','$'  
enter DB 13,10,'$'  
.CODE
MAIN PROC
MOV AX, @DATA
MOV DS,AX
    BATDAU:
        mov ax,@data
        mov ds,ax
        mov ah, 9
        lea dx, menu
        int 21h
        mov ah, 1
        int 21h
        Mot:
        cmp al, '1'
        jne Hai
        call Bai1
        jmp BATDAU
        Hai:      
        cmp al, '2'
        jne Ba:
        call Bai2
        jmp BATDAU
        Ba:    
        cmp al, '3'
        jne Bon        
        call Bai3
        jmp BATDAU  
        Bon:
        cmp al, '4'
        jne Nam        
        call Bai4
        jmp BATDAU
        Nam:   
        cmp al, '5'
        jne BATDAU        
    KETHUC: 
        mov ah,4ch
        int 21h

MAIN ENDP
Bai1 proc
    BATDAUB1:
        mov ax,@data
        mov ds,ax
        mov ah, 9
        lea dx, menuB1
        int 21h
        mov ah, 1
        int 21h
        cmp al, '1'
        je call func1      
        cmp al, '2'
        je call func2    
        cmp al, '3'
        je call func3   
        cmp al, '4'
        je KETHUCB1
        jmp BATDAUB1
    KETHUCB1: 
    RET
Bai1 endp         
func1 proc
    mov ah, 9
    lea dx, s1B1
    int 21h   
    mov ah, 1
    int 21h
    mov bh, al 
    mov ah, 9
    lea dx, s2B1
    int 21h
    mov ah, 1
    int 21h 
    mov bl, al 
    jmp BATDAUB1 
func1 endp     
func2 proc
    mov ah, 9
    lea dx, s3B1
    int 21h    
    mov dl , bh
    add dl, bl 
    sub dl, '0'
    mov ah, 2
    int 21h
    jmp BATDAUB1 
func2 endp 
func3 proc
    mov ah, 9
    lea dx, s4B1
    int 21h
    cmp bh,bl
    jg LONHON
    mov dl, bl
    sub dl, bh
    jmp HIENTHI
    LONHON:
    mov dl, bh
    sub dl, bl
    HIENTHI:    
    add dl, '0'
    mov ah, 2
    int 21h
    jmp BATDAUB1 
func3 endp   


Bai2 PROC
    mov cx,10 
    mov ah, 9
    lea dx, tb1B2   
    int 21h
    mov ah, 9
    lea dx, sB2   
    int 21h
    mov si,0 
    dichMa:
        add sB2[si], 2 
        inc si
    loop dichMa
    mov ah, 9
    lea dx, tb2B2   
    int 21h
    mov ah, 9
    lea dx, sB2   
    int 21h  
    RET
Bai2 endp   
   
   
   
Bai3 PROC
MOV AX, @DATA
MOV DS,AX
    BATDAUB3:
        mov ax,@data
        mov ds,ax
        mov ah, 9
        lea dx, menuB3
        int 21h
        mov ah, 1
        int 21h
        MotB3:
        cmp al, '1'
        jne HaiB3
        call nhapKhoaB3
        jmp BATDAUB3
        HaiB3:      
        cmp al, '2'
        jne BaB3:
        call MaHoaB3
        jmp BATDAUB3
        BaB3:    
        cmp al, '3'
        jne BonB3        
        call GiaiMaB3
        jmp BATDAUB3
        BonB3:   
        cmp al, '4'
        jne BATDAUB3        
    KETHUCB3: 
    RET

Bai3 ENDP
;**************************************
; Nhap khoa
nhapKhoaB3 proc
    mov ah, 9
    lea dx, tb4B3
    int 21h 
    mov ah, 1
    int 21h
    mov bl, al   
    sub bl, '0'
    ret 
nhapKhoaB3 endp      
;**************************************
; MaHoa
maHoaB3 PROC
    mov cx,10 
    mov ah, 9
    lea dx, tb2B3   
    int 21h
    mov ah, 9
    lea dx, sB3   
    int 21h
    mov si,0 
    MHoa:
        add sB3[si], bl 
        inc si
    loop MHoa
    mov ah, 9
    lea dx, tb3B3   
    int 21h
    mov ah, 9
    lea dx, sB3   
    int 21h  
    ret    
maHoaB3 ENDP
;**************************************
; MaHoa
giaiMaB3 PROC
    mov cx,10 
    mov ah, 9
    lea dx, tb3B3   
    int 21h
    mov ah, 9
    lea dx, sB3   
    int 21h
    mov si,0 
    GMa:
        sub sB3[si], bl 
        inc si
    loop GMa
    mov ah, 9
    lea dx, tb2B3   
    int 21h
    mov ah, 9
    lea dx, sB3   
    int 21h  
    ret  
giaiMaB3 ENDP

Bai4 PROC
    mov ax,@data
    mov ds,ax 
    mov cx, 0Ah   
    mov si,0 
    inHo:
       mov ah, 09h
       lea dx, enter
       int 21h  
       docKyTu:
        mov dl, sv1B4[si] 
        inc si
        cmp dl, '$'
        je NextSv 
        cmp dl, ' ' 
        je docChoHetTen
        mov ah, 02h 
        int 21h
        jmp docKyTu 
        docChoHetTen:
            mov dl, sv1B4[si] 
            inc si
            cmp dl, '$'
            je NextSv 
            jmp docChoHetTen
        NextSv:    
    loop inHo
    
    RET
Bai4 ENDP
