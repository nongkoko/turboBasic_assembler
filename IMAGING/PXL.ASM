;By: Livan
;Kamu harus mengkredit nama saya bila gunain asm ini
;call pxl (seg,x,y,w)
warna	equ	[bp+06]
ye	equ	[bp+10]
ex	equ	[bp+14]
seg	equ	[bp+18]

.model tiny
.186
.code
	org 100h

	push bp
	mov bp,sp
	push ds

	lds si,seg
	mov es,[si]

	lds si,ye
	lodsw
	mov di,ax
	shl di,1
	shl di,1
	add di,ax
	shl di,1
	shl di,1
	shl di,1
	shl di,1
	shl di,1
	shl di,1
	lds si,ex
	lodsw
	add di,ax
	lds si,[bp+06]
	movsb

	pop ds
	pop bp
.end


