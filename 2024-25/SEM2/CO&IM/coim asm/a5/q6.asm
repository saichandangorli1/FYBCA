
.model small
.stack 100h

.data
    msg1    db 0Dh, 0Ah, 'Value at 2000h: $'

.code
main proc
    mov ax, @data       
    mov ds, ax

    
    mov ax, 0           
    mov es, ax          

    
    mov ax, es:[2000h]  

    
    mov ah, 09h
    lea dx, msg1
    int 21h

    
    mov dx, ax
    call display_hex

    
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