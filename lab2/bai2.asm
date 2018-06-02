.MODEL small
.DATA
tb1B2 DB 13,10,'Chuoi ban dau: $'
tb2B2 DB 13,10,'Chuoi sau khi dich ma: $'
sB2 DB 'ABCFEDJTES','$'
.CODE
BEGIN:
    mov ax,@data
    mov ds,ax
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
    mov ah,4ch
    int 21h
END BEGIN