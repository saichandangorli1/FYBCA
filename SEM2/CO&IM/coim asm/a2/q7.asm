
.model small
.stack 100h

.data
    source  dw 10h, 20h, 30h, 40h, 50h    
    dest    dw 5 dup(0)                  
    msg1    db 0Dh, 0Ah, 'Source Array: $'
    msg2    db 0Dh, 0Ah, 'Destination Array: $'

.code
main proc
    mov ax, @data    
    mov ds, ax

    
    mov ah, 09h
    lea dx, msg1
    int 21h

    
    lea si, source
    mov cx, 5        
disp_source:
    mov dx, [si]
    call display_hex
    mov dl, ' '      
    mov ah, 02h
    int 21h
    add si, 2        
    loop disp_source

    
    lea si, source   
    lea di, dest     
    mov cx, 5        
copy_loop:
    mov ax, [si]     
    mov [di], ax     
    add si, 2        
    add di, 2        
    loop copy_loop

    
    mov ah, 09h
    lea dx, msg2
    int 21h

    
    lea si, dest
    mov cx, 5        
disp_dest:
    mov dx, [si]
    call display_hex
    mov dl, ' '      
    mov ah, 02h
    int 21h
    add si, 2        
    loop disp_dest

    
    mov ah, 4Ch
    int 21h
main endp


display_hex proc
    push ax
    push bx
    push dx

    mov bx, dx       
    mov ah, bh       
    call display_byte
    mov ah, bl       
    call display_byte

    pop dx
    pop bx
    pop ax
    ret
display_hex endp


display_byte proc
    push ax
    mov al, ah       
    mov ah, al       
    shr al, 4        
    call convert
    mov dl, al
    mov ah, 02h
    int 21h

    mov al, ah       
    and al, 0Fh      
    call convert
    mov dl, al
    mov ah, 02h
    int 21h

    pop ax
    ret
display_byte endp


convert proc
    cmp al, 9
    jbe add_30h
    add al, 37h      
    ret
add_30h:
    add al, 30h      
    ret
convert endp

end main