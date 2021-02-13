call panstr(strin$,panjang%)

push bp
mov bp,sp
push ds
lds si,[bp+0a]
les di,[bp+06]
movsw
pop ds
pop bp
