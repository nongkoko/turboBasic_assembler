By: Livan di Jakarta pada saat PKL
jika anda ingin menggunakannya anda
harus menyertakan nama saya pada credit anda

akses:
0 - read
1 - write
2 - r / w
call bkfil(namafile$, akses, filehandler%)

push bp
mov bp,sp
push ds

mov bx,[0]
mov ah,3D
lds si,[bp+0a]
lodsb
lds si,[bp+0e]
mov dx,[si+02]
mov ds,bx
int 21

jc error
mov ah,00
les di,[bp+06]
stosw
jmp selese

error: 122
mov ah,80
les di,[bp+06]
stosw
 
selese:128
pop ds
pop bp

