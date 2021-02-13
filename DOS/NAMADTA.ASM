syntax namadta(dta%[22],nama$[12])
                  0a     06

push bp
mov bp,sp
push ds
mov ax,[0]
lds si,[bp+06]
mov di,[si+02]
lds si,[bp+0A]
add si,1E
mov es,ax
mov cx,0C
rep
movsb
pop ds
pop bp
