.model small
.stack 100
.data       
    menu db 13,10,'1. Nhap vao 2 so co mot chu so trong dona [0 - 4] '             
    db 13,10,'2. Tinh tong 2 so va in ket qua ra man hinh ' 
    db 13,10,'3. Tinh hieu cua so lon cho so be va in ket qua ra man hinh '  
    db 13,10,'4. Ket thuc'
    db 13,10,'Chon $'
    s1 db 13,10,'Nhap so thu nhat: $'
    s2 db 13,10,'Nhap so thu hai: $'    
    s3 db 13,10,'Tong cua 2 so la: $'
    s4 db 13,10,'Hieu cua so lon cho so be la: $'   
     
.code
main proc
    BATDAU:
        mov ax,@data
        mov ds,ax
        mov ah, 9
        lea dx, menu
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
        je KETHUC
        jmp BATDAU
    KETHUC: 
        mov ah,4ch
        int 21h
main endp         
func1 proc
    mov ah, 9
    lea dx, s1
    int 21h   
    mov ah, 1
    int 21h
    mov bh, al 
    mov ah, 9
    lea dx, s2
    int 21h
    mov ah, 1
    int 21h 
    mov bl, al 
    jmp BATDAU 
func1 endp     
func2 proc
    mov ah, 9
    lea dx, s3
    int 21h    
    mov dl , bh
    add dl, bl 
    sub dl, '0'
    mov ah, 2
    int 21h
    jmp BATDAU 
func2 endp 
func3 proc
    mov ah, 9
    lea dx, s4
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
    jmp BATDAU 
func3 endp
end main
    