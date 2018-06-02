.model small
.stack 100
.data      
    s1 db 13, 10, 'Nhap n: ','$'     
    s2 db 13, 10, 'Tong cac so chan va nho hon bang n: ','$'    
    s3 db 13, 10, 'Tong cac so le va nho hon bang n: ','$'  
.code
    main proc      
        mov ax, @data
        mov ds, ax                          
    ;Nhap   n = kytu1*100+kytu2*10+kytucuoicung  
        mov ah, 9    
        lea dx, s1
        int 21h
    
        xor bx, bx              ;reset bx thanh 0
        xor cx, cx              ;reset cx thanh 0
        mov ah, 1
        int 21h
        tiepTuc:  
            mov ah, 00h         ; reset ah thanh 0
            sub al, 30h         ; ky tu thanh so
            push ax             ; cat vao ngan xep // backup
            mov ax, 10          ; ax = 10      
            mul bx              ; ax = 10.bx
            mov bx, ax          ; bx = ax
            pop ax              ; lay lai ax tu ngan xep
            add bx, ax          ; 10 = 1*10+0 
            mov ah, 1
            int 21h
            cmp al, 13          ; da enter chua?
            jne tiepTuc         ; nhap tiep
        
        ;Tinh toan        
            mov cx, bx          ; so lan lap
            xor bx, bx          ; Tong chan  
            xor ax, ax          ; gan ax = 0
            xor di, di          ; Tong le 
            cmp cx, 0           ; Check cx = 0
            jna xongTinhToan
            lap:                      
                xor dx, dx      ; gan dx = 0 
                mov ax, cx      ; ax = cx 
                mov si, 2       ; si = 5
                div si          ; ax / si = ax du dx
                cmp dx, 0       ; ax % 5 == 0? 
                jne  continue   ; %2 <>0
                add bx, cx
                jmp next      
                continue: 
                add di, cx
                next:     
            loop lap         
            xongTinhToan: 
        ;HienThiChan   %10 de lay tung chu so
            ;Chan
            mov ah, 9       ;
            lea dx, s2
            int 21h
 
            mov ax, bx  ; ax = bx
            xor cx, cx  ; gan cx = 0
            mov bx, 10  ; so chia la 10
            chiaChan:
                xor dx, dx  ; gan dx = 0
                div bx      ; ax = ax / bx; dx = ax % bx
                push dx
                inc cx
                cmp ax, 0   ; kiem tra xem thuong bang khong chua?
                jne chiaChan    ; neu khong bang thi lai chia
                mov ah, 2
            hienChan:
                pop dx
                add dl, 30h
                int 21h
                loop hienChan
         
                 ;HienThiChan   %10 de lay tung chu so
            ;Le
            mov bx, di
            
            mov ah, 9       
            lea dx, s3
            int 21h
 
            mov ax, bx  ; ax = bx
            xor cx, cx  ; gan cx = 0
            mov bx, 10  ; so chia la 10
            chiaLe:
                xor dx, dx  ; gan dx = 0
                div bx      ; ax = ax / bx; dx = ax % bx
                push dx
                inc cx
                cmp ax, 0   ; kiem tra xem thuong bang khong chua?
                jne chiaLe    ; neu khong bang thi lai chia
                mov ah, 2
            hienLe:
                pop dx
                add dl, 30h
                int 21h 
                loop hienLe
        mov ah, 4ch
        int 21h
         
    main endp

     
end main