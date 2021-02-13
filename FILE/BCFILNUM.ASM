call bcfilnum(filehandler%, numvar%, offnum%, banyak%)
                 12           0e       0a        06

push bp
mov bp,sp
push ds
lds si,[bp+06]
mov cx,[si]
lds si,[bp+12]
mov bx,[si]
lds si,[bp+0a]
lodsw
lds dx,[bp+0e]
add dx,ax
mov ah,3F
int 21
pop ds
pop bp

r cx



