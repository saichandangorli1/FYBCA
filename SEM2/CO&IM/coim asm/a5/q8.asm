
.model small
.stack 100h

.data
    number db 45h
    sum    db 0
    msg1   db 0Dh, 0Ah, 'Number (decimal): $'
    msg2   db 0Dh, 0Ah, 'Sum of digits: $'

.code
main proc
                    mov  ax, @data
                    mov  ds, ax

    
                    mov  ah, 09h
                    lea  dx, msg1
                    int  21h

    
                    mov  al, number
                    call display_decimal

    
                    mov  al, number
                    mov  ah, 0
                    mov  bl, 10
                    div  bl

                    add  al, ah
                    mov  sum, al

    
                    mov  ah, 09h
                    lea  dx, msg2
                    int  21h
                    mov  al, sum
                    call display_decimal

    
                    mov  ah, 4Ch
                    int  21h
main endp


display_decimal proc
                    push ax
                    push bx
                    push dx

                    mov  ah, 0
                    mov  bl, 10
                    div  bl

                    cmp  al, 0
                    je   skip_tens
                    add  al, 30h
                    mov  dl, al
                    mov  ah, 02h
                    int  21h

    skip_tens:      
                    mov  al, ah
                    add  al, 30h
                    mov  dl, al
                    mov  ah, 02h
                    int  21h

                    pop  dx
                    pop  bx
                    pop  ax
                    ret
display_decimal endp

end main