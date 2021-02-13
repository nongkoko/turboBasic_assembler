push bp
mov bp,sp
push ds

mov bx,[0]
lds dx,[bp+0a]
mov ah, 1A
int 21

lds si,[bp+0e]
mov dx,[si+02]
mov cx, 17
mov ax, 4E00
mov ds, bx
int 21

mov ah,00
les di,[bp+06]
stosw

pop ds
pop bp