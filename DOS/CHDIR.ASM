By: Livan gratis
Kamu harus mengkredit nama gwa di program lo
call chdirs (dir$,erno%)

push bp
mov bp,sp
push ds

mov bx,[0]

lds si,[bp+0A]
mov dx,[si+02]

mov ax,3B00
mov ds,bx
int 21
jnc @1
les di,[bp+06]
mov al,ah
stosb

@1
pop ds
pop bp
ret




