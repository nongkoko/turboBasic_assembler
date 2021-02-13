By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
mode 00 ptr pindah ke cx:dx dari awal file
mode 01 ptr maju sebanyak cx:dx
mode 02 ptr berada di akhir file ditambah dengan
        cx:dx dengan hasil di ax:dx

PDPTR (hand%,cx,dx,mode)
        12   0e 0a  06

push bp
mov bp,sp
push ds

lds si,[bp+12]
mov bx,[si]
lds si,[bp+0E]
mov cx,[si]
lds si,[bp+0A]
mov dx,[si]
lds si,[bp+06]
lodsb
mov ah,42
int 21

pop ds
pop bp
ret