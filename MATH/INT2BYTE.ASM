call int2byte(int%, high%, low%)

push bp
mov bp,sp
push ds
lds si,[bp+0e]
lodsw
les di,[bp+06]
stosb
mov al,ah
les di,[bp+0a]
stosb
pop ds
pop bp
