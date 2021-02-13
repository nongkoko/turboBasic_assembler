By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini

this prosedure write a data on string$ to the filehandler
without any offset and len

call tlstrf(filehandler%, string$)

push bp
mov bp,sp
push ds

mov ax,[0]
lds si,[bp+06]
mov cx,[si]
mov dx,[si+02]
lds si,[bp+0a]
mov bx,[si]
mov ds,ax
mov ah,40
int 21
pop ds
pop bp

