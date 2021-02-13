By: Livan gratis
Kamu harus mengkredit nama gwa di program lo
'syntax dirprint(segs%,y,x,teks$,attr%)

push bp
mov bp,sp
push ds

mov ax,[0]
push ax

lds si,[bp+12]
mov bx,[si]
mov ax,bx
mov bx,5
mul bx     'ax= y * 5
shl ax,1   'ax = y * 10
shl ax,1   'ax = y * 20
shl ax,1   'ax = y * 40
shl ax,1   'ax = y * 80
shl ax,1   'ax = y * 160

lds si,[bp+0E]
mov cx,[si]
shl cx,1

mov di,ax
add di,cx

lds si,[bp+16]
mov es,[si]

lds si,[bp+0A]
mov cx,[si]
mov bx,[si+02]
push bx

lds si,[bp+06]
lodsb

pop si
pop ds

@1:
movsb        'dari STRING ADDRESS ke ES:DI , SI = SI + 1 , DI = DI + 1
stosb
loop @1
pop ds
pop bp

