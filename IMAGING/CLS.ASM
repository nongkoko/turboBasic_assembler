;call cls(segmen%)

.model tiny
.code
.186
	push bp
	mov bp,sp
	push ds

	lds si,[bp+06]
	mov es,[si]
	xor di,di
	mov cx,8000h
	xor ax,ax
	repz
	stosw

	pop ds
	pop bp
.end
