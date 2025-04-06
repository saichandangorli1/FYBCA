.model small
.stack 100h

.code
main proc
    
    mov ax, @data
    mov ds, ax

    
    mov ax, 45         

    
    mov bl, 10         
    div bl             

    
    mov bh, al         
    mov bl, ah         

    
    mov dl, bh
    add dl, 30h        
    mov ah, 02h        
    int 21h

    
    mov dl, '+'
    mov ah, 02h
    int 21h

    
    mov dl, bl
    add dl, 30h        
    mov ah, 02h
    int 21h

    
    mov dl, '='
    mov ah, 02h
    int 21h

    
    mov al, bh         
    mov ah, 0          
    add al, bl         
    mov bl, 10
    div bl             

    
    cmp al, 0
    je skip_tens
    add al, 30h        
    mov dl, al
    mov ah, 02h
    int 21h
skip_tens:

    
    mov al, ah         
    add al, 30h        
    mov dl, al
    mov ah, 02h
    int 21h

    
    mov ah, 4Ch
    int 21h

main endp
end main