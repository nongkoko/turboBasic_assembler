;call num2numf(numsum,offset,numtuj,banyak byte)
banyak equ [bp+06]
numtuj equ [bp+10]
offset equ [bp+14]
numsum equ [bp+18]

.model tiny
.186
.code
	org 100h

	push bp
	mov bp,sp
	push ds

	lds si,banyak
	mov cx,[si]

	lds si,offset
	mov ax,[si]
	lds si,numsum
	add si,ax
	les di,numtuj
	repnz
	movsb

	pop ds
	pop bp
.end