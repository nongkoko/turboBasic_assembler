call cetmem(segtuj,  y, x, segsum,offsum,banyak,warna)
               1e  1a  16   12     0e     0a    06

push bp
mov bp,sp
push ds

lds si,[bp+0a]
mov cx,[si]
lds si,[bp+1a]
lodsw
mov di,ax
shl di,1
shl di,1
add di,ax
shl di,1
shl di,1
shl di,1
shl di,1
shl di,1
lds si,[bp+16]
lodsw
shl ax,1
add di,ax
lds si,[bp+1e]
mov es,[si]
lds si,[bp+06]
lodsb
lds si,[bp+12]
mov bx,[si]
lds si,[bp+0e]
mov si,[si]
mov ds,bx

baca: 13c
movsb
stosb
loopnz baca

pop ds
pop bp
