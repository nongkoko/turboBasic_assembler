By: Livan gratis
Kamu harus mengkredit nama gwa di program lo

syntax call Carilagi(dta%[22],erno%)

push bp
mov bp,sp
push ds
mov ah,1a
lds dx,[bp+0a]
int 21
mov ax,4F00
int 21
xor ah,ah
les di,[bp+06]		
stosw
pop ds
pop bp

