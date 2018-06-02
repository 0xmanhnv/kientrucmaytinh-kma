.MODEL small
.STACK
.DATA            
menuB3 db 13,10,'1. Nhap khoa thuoc doan [1 - 9]'              
db 13,10,'2. Ma hoa'  
db 13,10,'3. Giai ma'
db 13,10,'4. Ket thuc' 
db 13,10,'Chon: $'      
tb2B3 DB 13,10,'Xau ro: $'
tb3B3 DB 13,10,'Xau ma: $'
tb4B3 DB 13,10,'Nhap mot khoa thuoc doan [1 - 9]: $'
sB3 DB 'ABCFEDJTES','$'
.CODE
MAIN PROC
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
        mov ah,4ch
        int 21h

MAIN ENDP
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
END MAIN