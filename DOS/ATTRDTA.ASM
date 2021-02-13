'mendapatkan attribut dari dta yang diberikan

call attrdta(dta%[22], attribut%)

push bp
mov bp,sp
push ds
 lds si,[bp+0a]
 les di,[bp+06]
 add si,15
 stosb
pop ds
pop bp

r cx

