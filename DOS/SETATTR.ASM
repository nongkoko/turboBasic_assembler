'call setattr(namafile$, attribut%)

push bp
mov bp,sp
push ds

mov ax,[0]
lds si,[bp+06]
mov cx,[si]
lds si,[bp+0A]
mov dx,[si+02]
mov ds,ax
mov ax, 4301
int 21

pop ds
pop bp