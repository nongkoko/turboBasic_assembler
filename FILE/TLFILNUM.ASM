call tlfilnum(filehandler%, varnum%, offnum%, banyakbyte%)

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
mov ah, 40
int 21
pop ds
pop bp

r cx
