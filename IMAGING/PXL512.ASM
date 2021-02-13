By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
call pxl (seg,x,y,w)

push bp
mov bp,sp
push ds
lds si,[bp+12]
mov es,[si]
lds si,[bp+0A]
mov di,[si]
shl di,1
shl di,1
shl di,1
shl di,1
shl di,1
shl di,1
shl di,1
shl di,1
shl di,1
lds si,[bp+0E]
lodsw
add di,ax
lds si,[bp+06]
movsb
pop ds
pop bp