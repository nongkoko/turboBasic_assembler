;call str2str(str1$, off1%, str2$, banyakbyte%)

banyak	equ	[bp+06]
str2	equ	[bp+10]
offset	equ	[bp+14]
str1	equ	[bp+18]

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
	lds si,str2
	mov di,[si+02]
	lds si,offset
	lodsw
	lds si,str1
	mov si,[si+02]
	add si,ax
	mov ds,bx
	mov es,bx
	rep
	movsb
	pop ds
	pop bp
.end
