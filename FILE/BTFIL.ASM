By: Livan gratis
Kamu harus mengkredit nama gwa di program lo

call BTFIL(NAMFIL$, attri%, hand%)

push bp
mov bp,sp
push ds

mov bx,[0]
lds si,[bp+0a]
mov cx,[si]
lds si,[bp+0e]
mov dx,[si+02]
mov ds, bx
mov ah, 3C
int 21

jc error
les di,[bp+06]
stosw
jmp selesai

error: 121
mov ah,80
les di,[bp+06]
stosw

selesai:
pop ds
pop bp