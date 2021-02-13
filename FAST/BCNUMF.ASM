'bc file sbg num scr cpt tidak bertele-tele

call bcnumf(handler%, num, banyak)

push bp
mov bp,sp
push ds
lds si,[bp+06]
mov cx,[si]
lds si,[bp+0e]
mov bx,[si]
lds dx,[bp+0a]
mov ah,3F
int 21
pop ds
pop bp