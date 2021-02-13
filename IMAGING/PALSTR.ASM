palleting dari strin, 256 warna, data diperlukan 768 karakter

call palstr(strin$)

push bp
mov bp,sp
push ds

mov ax,[0]
lds si,[bp+06]
mov si,[si+02]
mov ds,ax
mov dx,3C8
xor ax,ax
out dx,al
mov dx,3C9
mov cx,100

baca:11B
 lodsb
 out dx,al
 lodsb
 out dx,al
 lodsb
 out dx,al
 loopnz baca

selesai:
pop ds
pop bp
