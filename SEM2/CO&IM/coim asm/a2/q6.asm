
.model small
.stack 100h

.data
    msg1 db 0Dh, 0Ah, 'AX = $'    
    msg2 db 0Dh, 0Ah, 'BX = $'    
    msg3 db 0Dh, 0Ah, 'CX = $'    

.code
main proc
    mov ax, @data    
    mov ds, ax

    
    mov ax, 05h      
    mov bx, 0Ah      
    mov cx, 0Fh      

    
    mov ah, 09h      
    lea dx, msg1     
    int 21h          

    mov dl, ah       
    call display_hex
    mov dl, al       
    call display_hex

    
    mov ah, 09h
    lea dx, msg2     
    int 21h          

    mov dl, bh       
    call display_hex
    mov dl, bl       
    call display_hex

    
    mov ah, 09h
    lea dx, msg3     
    int 21h          

    mov dl, ch       
    call display_hex
    mov dl, cl       
    call display_hex

    
    mov ah, 4Ch
    int 21h

main endp


display_hex proc
    push ax          
    push dx

    mov al, dl       
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

    pop dx           
    pop ax
    ret
display_hex endp


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