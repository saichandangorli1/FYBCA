.model small
.stack 100h

.code
main proc
    
    mov ax, @data
    mov ds, ax

    
    mov ax, 1A3Fh      
    mov bx, 0B2Ch      
    mov dx, ax         

    
    call display_hex   
    mov bx, 0B2Ch      

    
    mov dl, '-'
    mov ah, 02h
    int 21h

    
    mov dl, ' '
    mov ah, 02h
    int 21h

    
    mov ax, bx
    call display_hex

    
    mov dl, '='
    mov ah, 02h
    int 21h

    
    mov dl, ' '
    mov ah, 02h
    int 21h

    
    mov ax, dx         
    sub ax, bx         
    call display_hex

    
    mov ah, 4Ch
    int 21h

main endp


display_hex proc
    push bx            
    push cx
    mov bx, ax         
    mov cx, 4          

hex_loop:
    rol bx, 4          
    mov dl, bl
    and dl, 0Fh        
    cmp dl, 9
    jbe add_30h
    add dl, 7h
add_30h:
    add dl, 30h        
    mov ah, 02h
    int 21h
    loop hex_loop

    pop cx             
    pop bx
    ret
display_hex endp

end main