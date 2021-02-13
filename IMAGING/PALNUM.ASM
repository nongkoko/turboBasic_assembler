call palnum(varnum%[384])

push bp
mov bp,sp
push ds

xor ax,ax
mov dx,3C8
out dx,al
lds si,[bp+06]
mov cx,100
mov dx,3C9

baca: 113
 jcxz selesai
 lodsb
 out dx,al
 lodsb
 out dx,al
 lodsb
 out dx,al
 dec cx
 jmp baca

selesai:11e
pop ds
pop bp