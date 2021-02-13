;call onekey(ascii,scancode)
scancode equ [bp+06]
ascii equ [bp+10]

.model tiny
.186
.code
	org 100h

	push bp
	mov bp,sp
	push ds

	xor ah,ah
	int 16h

	les di, ascii
	stosb
	lds si,scancode
	mov [si], ah
	
	pop ds
	pop bp
.end