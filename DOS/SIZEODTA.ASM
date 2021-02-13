call sizeodta(dta%[22],ukufil&)

push bp
mov bp,sp
push ds
les di,[bp+06]
lds si,[bp+0a]
add si,1A
movsw
movsw
pop ds
pop bp
