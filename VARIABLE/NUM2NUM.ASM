num2num asm memungkinkan kita untuk mendapatkan byte
didalam array numeric

call num2num(numsum%, offsum%, numtuj%, offtuj%, jumbyte%)

push bp
mov bp,sp
push ds

lds si,[bp+06]
mov cx,[si]
lds si,[bp+0a]
lodsw
les di,[bp+0e]
add di, ax
lds si,[bp+12]
lodsw
lds si,[bp+16]
add si,ax
rep
movsb
pop ds
pop bp

