;call verline(seg%, x%, y1%, y2%, w%)

warna equ [bp+06]
y2    equ [bp+10]
y1    equ [bp+14]
ex    equ [bp+18]
segm  equ [bp+22]

.model tiny
.186
.code
	org 100h

	push bp
	mov bp,sp
	push ds

	lds si,segm
	mov es,[si]

	lds si,y2
	mov dx,[si]

	lds si,y1
	mov cx,[si]

	cmp cx,dx
	jl mulai
	xchg cx,dx

;dx = y2
;cx = y1
mulai:
	sub dx,cx	;dx=y2-y1
	inc dx,1	;dx=panjang garis
	mov di,cx	;di=y1
	shl di,1	;di=y1*2
	shl di,1	;di=y1*4
	add di,cx	;di=y1*4+y1 = y1*5
	shl di,1	;di=y1*10
	shl di,1	;di=y1*20
	shl di,1
	shl di,1
	shl di,1
	shl di,1	;di=y1*320
	lds si,ex
	lodsw		;ax=ex
	add di,ax	;di=y1+ex
	lds si,warna
	lodsb		;al=warna
 
tiga:
	stosb		;out al pada es:di
	dec dx		;panjang dikurangi 1
	jz selesai
	add di,319
	jmp short tiga

selesai:
	pop ds
	pop bp
.end