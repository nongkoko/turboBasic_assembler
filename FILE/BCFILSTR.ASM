call bcfilstr(filehandler%, string$, offstr%, banyak%)
                 12           0e       0a       06
push bp
mov bp,sp
push ds
mov ax,[0]
lds si,[bp+06]
mov cx,[si]
lds si,[bp+0e]
mov dx,[si+02]
lds si,[bp+0a]
mov bx,[si]
add dx,bx
lds si,[bp+12]
mov bx,[si]
mov ds,ax
mov ah,3F
int 21
pop ds
pop bp

r cx

