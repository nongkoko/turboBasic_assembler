By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini

call getmousepos (xm%, ym%, tm%)

push bp
mov bp,sp
push ds

mov ax, 3
int 33

lds si,[bp+06]
mov [si], bx
lds si,[bp+0A]
mov [si], dx
lds si,[bp+0E]
mov [si], cx

pop ds
pop bp


