By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini

call tlfilstr(filehandler%, string$, offstr%, banyakbyte%)

push bp
mov bp,sp
push ds
mov ax,[0]
lds si,[bp+06]
mov cx,[si]
lds si,[bp+0a]
mov bx,[si]
lds si,[bp+0e]
mov dx,[si+02]
add dx,bx
lds si,[bp+12]
mov bx,[si]
mov ds,ax
mov ah,40
int 21
pop ds
pop bp

r cx

