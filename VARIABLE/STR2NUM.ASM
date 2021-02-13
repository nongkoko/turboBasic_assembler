call str2num(string$, offstr%, varnum%, offset%, banyak%)
               16        12      0e       0A       06

push bp
mov bp,sp
push ds
mov dx,[0]
lds si,[bp+06]
mov cx,[si]
lds si,[bp+0a]
lodsw
les di,[bp+0e]
add di,ax
lds si,[bp+12]
lodsw
lds si,[bp+16]
mov si,[si+02]
add si,ax
mov ds,dx
rep
movsb
pop ds
pop bp