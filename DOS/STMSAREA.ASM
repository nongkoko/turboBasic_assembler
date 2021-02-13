;call mousearea(xmin,ymin,xmax,ymax)

ymax	equ	[bp+06]
xmax	equ	[bp+10]
ymin	equ	[bp+14]
xmin	equ	[bp+18]

.model tiny
.code
.186
	org 100h

	push bp
	mov bp,sp
	push ds

	lds si, xmin
	mov cx,[si]
	lds si, xmax
	mov dx, [si]
	mov al,7
	int 33h

	lds si, ymin
	mov cx,[si]
	lds si, ymax
	mov dx,[si]
	mov al,8
	int 33h

	pop ds
	pop bp
.end
