
.model small
.stack 100h

.data
    array  dw 2h, 3h, 4h, 5h, 6h
    result dd 0
    msg1   db 0Dh, 0Ah, 'Array elements: $'
    msg2   db 0Dh, 0Ah, 'Product: $'

.code
main proc
                 mov  ax, @data
                 mov  ds, ax

    
                 mov  ah, 09h
                 lea  dx, msg1
                 int  21h

                 lea  si, array
                 mov  cx, 5
    disp_loop:   
                 mov  dx, [si]
                 call display_hex
                 mov  dl, ' '
                 mov  ah, 02h
                 int  21h
                 add  si, 2
                 loop disp_loop

    
                 lea  si, array
                 mov  cx, 5
                 mov  ax, 1
                 mov  dx, 0
    mult_loop:   
                 mov  bx, [si]
                 mul  bx
                 add  si, 2
                 loop mult_loop

    
                 mov  word ptr result, ax
                 mov  word ptr result+2, dx

    
                 mov  ah, 09h
                 lea  dx, msg2
                 int  21h
                 mov  dx, word ptr result+2
                 call display_hex
                 mov  dx, word ptr result
                 call display_hex

    
                 mov  ah, 4Ch
                 int  21h
main endp


display_hex proc
                 push ax
                 push bx
                 push dx

                 mov  bx, dx
                 mov  ah, bh
                 call display_byte
                 mov  ah, bl
                 call display_byte

                 pop  dx
                 pop  bx
                 pop  ax
                 ret
display_hex endp


display_byte proc
                 push ax
                 mov  al, ah
                 mov  ah, al
                 shr  al, 4
                 call convert
                 mov  dl, al
                 mov  ah, 02h
                 int  21h

                 mov  al, ah
                 and  al, 0Fh
                 call convert
                 mov  dl, al
                 mov  ah, 02h
                 int  21h

                 pop  ax
                 ret
display_byte endp


convert proc
                 cmp  al, 9
                 jbe  add_30h
                 add  al, 37h
                 ret
    add_30h:     
                 add  al, 30h
                 ret
convert endp

end main