'get attribut by : leaf fun
'call getattr(namafile$, attribut%)

push bp
mov bp,sp
push ds

mov ax,[0]
lds si,[bp+0A]
mov dx,[si+02]
mov ds,ax
mov ax, 4300
int 21
lds si,[bp+06]
mov [si], cx

pop ds
pop bp

