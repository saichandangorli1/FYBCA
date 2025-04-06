.model small
.stack 100h

.data
    org 2000h
    dest dw 5 dup(?)    

.code
main proc
    
    mov ax, @data
    mov ds, ax

    
    mov ax, 1234h      

    
    mov bx, 2000h      
    mov cx, 5          
copy_loop:
    mov [bx], ax       
    add bx, 2          
    loop copy_loop

    
    mov bx, 2000h      
    mov cx, 5          
display_loop:
    push cx            
    push bx            
    
    
    mov ax, [bx]       
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

    
    mov dl, ' '
    mov ah, 02h
    int 21h

    pop bx             
    pop cx             
    add bx, 2          
    loop display_loop  

    
    mov ah, 4Ch
    int 21h

main endp
end main