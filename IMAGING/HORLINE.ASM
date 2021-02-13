;By: Livan
;Kamu harus mengkredit nama saya bila gunain asm ini
;call horline(seg%, y%, x1%, x2%, w%)

warna equ [bp+06]
x2 equ [bp+10]
x1 equ [bp+14]
ye equ [bp+18]
segm equ [bp+22]

.model tiny
.186
.code
	org 100h
	push bp
	mov bp,sp
	push ds

	lds si,segm
	mov es,[si]

	lds si,x1
	lodsw
	lds si,x2
	mov cx,[si]
	cmp ax,cx
	jl mulai
	xchg cx,ax
; ax = x1 cx = x2
mulai:
 	sub cx,ax	;cx = x2-x1
	inc cx		;cx = panjang garis
	push ax		;ax = x1
	lds si,ye
	lodsw		;ax = ye
	mov di,ax	;di = ye
	shl di,1	;di = ye*2
	shl di,1
	add di,ax	;di = ye*5
	shl di,1
	shl di,1
	shl di,1
	shl di,1
	shl di,1
	shl di,1	;di=ye*320
	pop ax		;ax=x1
	add di,ax	;di=x1 + 320y
	lds si,warna
	lodsb		;al=warna
	repnz
	stosb		;sebanyak cx lakukan stosb
	pop ds
	pop bp
.end







