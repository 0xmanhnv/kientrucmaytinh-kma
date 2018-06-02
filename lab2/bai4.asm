.MODEL small
.DATA
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
BEGIN:
    mov ax,@data
    mov ds,ax
    mov cx, 0Ah   
    mov si,0 
    inHo: 
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
            mov ah, 09h
            lea dx, enter
            int 21h 
    loop inHo
    
    mov ah,4ch
    int 21h
END BEGIN