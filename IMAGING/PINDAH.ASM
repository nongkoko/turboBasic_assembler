By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
Call PDHARGAM(posi)

push bp
mov bp,sp
push ds

mov ax,4F05
mov bx,0000
lds si,[bp+06]
mov dx,[si]
int 10
pop ds
pop bp
ret
