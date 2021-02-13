'baca file sbg string secara cepat
'without any error information

call bcstrf(handler%,string$)

push bp
mov bp,sp
push ds

mov ax,[0]
lds si,[bp+06]
mov cx,[si]
mov dx,[si+02]
lds si,[bp+0a]
mov bx,[si]
mov ds,ax
mov ah,3F
int 21

pop ds
pop bp


