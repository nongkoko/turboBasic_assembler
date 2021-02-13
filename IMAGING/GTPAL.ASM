By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
call gtpal(warna,r,g,b)

push bp
mov bp,sp
push ds

lds si,[bp+12]
mov cl,[si]

mov dx,3C8
mov al,cl
out dx,al

mov dx,3C9
in al,dx
mov ah,al

in al,dx
mov bl,al

in al,dx
les di,[bp+06]
stosb

les di,[bp+0A]
mov al,bl
stosb

les di,[bp+0E]
mov al,ah
stosb

pop ds
pop bp



