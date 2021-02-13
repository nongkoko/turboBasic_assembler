By: Livan di Jakarta pada saat PKL
jika anda ingin menggunakannya anda
harus menyertakan nama saya pada credit anda
zsyntax bagi96(angka%,angka2%)

push bp
mov bp,sp
push ds

lds si,[bp+0A]
mov ax,[si]
shr ax,1
shr ax,1
shr ax,1
shr ax,1
shr ax,1
div ax,3
les di,[bp+0A]
stosw

pop ds
pop bp
ret