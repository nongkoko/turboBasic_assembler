call pokenum(segmen, offset, varnum, jbyteygakanditransf)

push bp
mov bp,sp
push ds

lds si,[bp+06]
mov cx,[si]
lds si,[bp+0E]
mov di,[si]
lds si,[bp+12]
mov es,[si]
lds si,[bp+0A]
rep
movsb

pop ds
pop bp
