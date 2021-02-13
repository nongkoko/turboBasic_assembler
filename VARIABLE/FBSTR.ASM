find char in str

call fbstr(str$, char%, start%, bancari%, pos%)
            16    12     0E       0A      06

push bp
mov bp,sp
push ds
mov bx,[0]
lds si,[bp+0A]
mov cx,[si]
lds si,[bp+12]
mov ah,[si]
lds si,[bp+0E]
mov dx,[si]
lds si,[bp+16]
mov si,[si+02]
add si,dx
mov ds,bx
xor bx,bx

baca: 123
jcxz taktemu
lodsb
cmp ah,al
jz ktemu
dec cx
inc bx
jmp baca

taktemu: 12e
mov ax,FFFF
les di,[bp+06]
stosw
jmp selesai

ktemu: 137
add bx,dx
les di,[bp+06]
es:
mov [di],bx

selesai:
pop ds
pop bp