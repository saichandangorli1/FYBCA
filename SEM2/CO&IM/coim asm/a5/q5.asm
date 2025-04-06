.model small
.stack 100h

.data
          org 2000h
    value dw  1234h

.code
main proc
    
                 mov  ax, @data
                 mov  ds, ax

  
                 mov  ax, [2000h]

   
                 mov  bx, ax
                 mov  cx, 4

    convert_loop:
                 rol  bx, 4
                 mov  dl, bl
                 and  dl, 0Fh
    
   
                 cmp  dl, 9
                 jbe  add_30h
                 add  dl, 7h
    add_30h:     
                 add  dl, 30h
    
   
                 mov  ah, 02h
                 int  21h
    
                 loop convert_loop
   
                 mov  ah, 4Ch
                 int  21h

main endp
end main