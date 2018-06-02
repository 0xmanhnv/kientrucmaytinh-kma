.model small
.stack 100
.data      
    s1 db 13, 10, 'Nhap n: ','$'     
    s2 db 13, 10, 'Tong cac so chia het cho 5 va nho hon bang n: ','$'   
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
        
        ;Tinh toan Tong % 5 = 0 && < n    
            mov cx, bx          ; so lan lap
            xor bx, bx          ; gan bx = 0  
            xor ax, ax          ; gan ax = 0
            cmp cx, 0
            jna break
            lap:      
                xor dx, dx          ; gan dx = 0 
                mov ax, cx      ; ax = cx 
                mov si, 5       ; si = 5
                div si          ; ax / si = ax du dx
                cmp dx, 0       ; ax % 5 == 0? 
                jne  continue
                add bx, cx      
                continue:      
            loop lap 
            break:         
 
        ;HienThi   %10 de lay tung chu so
            ;Chan
            mov ah, 9       ; xuong dong
            lea dx, s2
            int 21h
 
            mov ax, bx  ; ax = bx
            xor cx, cx  ; gan cx = 0
            mov bx, 10  ; so chia la 10
            chia:
                xor dx, dx  ; gan dx = 0
                div bx      ; ax = ax / bx; dx = ax % bx
                push dx
                inc cx
                cmp ax, 0   ; kiem tra xem thuong bang khong chua?
                jne chia    ; neu khong bang thi lai chia
                mov ah, 2
            hien:
                pop dx
                add dl, 30h
                int 21h
                loop hien

        mov ah, 4ch
        int 21h
         
    main endp

     
end main