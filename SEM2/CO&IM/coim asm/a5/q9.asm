.model small
.stack 100h

.data
    array dw 2, 3, 4, 5, 6    

.code
main proc
    
    mov ax, @data
    mov ds, ax

    
    mov bx, offset array    
    mov cx, 5               

display_numbers:
    mov ax, [bx]           
    call display_hex       
    add bx, 2              

    
    cmp cx, 1
    je skip_x
    mov dl, ' '
    mov ah, 02h
    int 21h
    mov dl, 'x'
    mov ah, 02h
    int 21h
    mov dl, ' '
    mov ah, 02h
    int 21h
skip_x:
    loop display_numbers

    
    mov dl, '='
    mov ah, 02h
    int 21h
    mov dl, ' '
    mov ah, 02h
    int 21h

    
    mov bx, offset array
    mov ax, 1              
    mov cx, 5

multiply_loop:
    mul word ptr [bx]      
    add bx, 2
    loop multiply_loop

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