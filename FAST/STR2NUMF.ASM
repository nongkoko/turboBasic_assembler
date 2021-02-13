;call str2num(string$, offstr%, varnum%, banyak%)

banyak	equ	[bp+06]
varnum	equ	[bp+10]
offset	equ	[bp+14]
string	equ	[bp+18]

.model tiny
.code
.186
	org 100h

	push bp
	mov bp,sp
	push ds

	mov bx,[0]
	lds si,banyak
	mov cx,[si]
	les di,varnum
	lds si,offset
	lodsw
	lds si,string
	mov si,[si+02]
	add si,ax
	mov ds,bx
	rep
	movsb
	pop ds
	pop bp
.end

	
	


