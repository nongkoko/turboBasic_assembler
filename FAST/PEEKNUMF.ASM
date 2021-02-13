call peeknum(segmen, offset, varnum, banyakbyte)

push bp
mov bp,sp
push ds

lds si,[bp+06]
mov cx,[si]
lds si,[bp+0E]
mov dx,[si]
lds si,[bp+12]
mov ds,[si]
mov si,dx
les di,[bp+0A]
rep
movsb

pop ds
pop bp
