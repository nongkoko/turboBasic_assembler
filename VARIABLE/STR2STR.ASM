string ke string

call str2str(str1$, off1%, str2$, off2%, banyakbyte%)

push bp
mov bp,sp
push ds

mov bx,[0]
lds si,[bp+0a]
lodsw
lds si,[bp+0e]
mov di,[si+02]
add di,ax
lds si,[bp+06]
mov cx,[si]
lds si,[bp+12]
lodsw
lds si,[bp+16]
mov si,[si+02]
add si,ax
mov ds,bx
mov es,bx
rep
movsb
pop ds
pop bp

r cx


