;call garis(segmen,x1,y1,x2,y2,warna)

warna equ [bp+6]
y2 equ [bp+10]
x2 equ [bp+14]
y1 equ [bp+18]
x1 equ [bp+22]
segmen equ [bp+26]

intx2		equ	SS:[bp-4]
inty2		equ	SS:[bp-6]
kenaikan		equ	SS:[bp-8]

.model tiny
.186
.code
	org 100h

	push bp		; > 1
	mov bp,sp	;bp = sp
	push ds		; > 2

	push 0		;sp = bp - 4
	push 0		;sp = bp - 6
	push 0		;sp = bp - 8

	lds si,segmen
	mov es,[si]	;es = segmen
	lds si,x1
	mov ax,[si]	;ax = x1
	lds si,x2
	mov bx,[si]	;bx = x2
	cmp ax,bx
	je vertikal	;if x1 = x2 then vertikal

	lds si,y1
	mov cx,[si]	;cx = y1
	lds si,y2
	mov dx,[si]	;dx = y2
	cmp cx,dx
	je horizontal	;if y1 = y2 then horizontal
	jmp short general

vertikal:
	lds si, y1
	mov dx,[si]	;dx = y1
	lds si, y2
	mov cx,[si]	;cx = y2
	cmp cx,dx
	jg lanjut		;lanjut
	xchg cx,dx	;cx,dx berubah
lanjut:
			;cx = y2
			;dx = y1
	mov di,dx
	shl di,1
	shl di,1
	add di,dx
	shl di,1
	shl di,1
	shl di,1
	shl di,1
	shl di,1
	shl di,1
	add di,ax		;di = y1*320 + x1
	sub cx,dx	;cx = y2-y1
	inc cx,1		;cx = tinggi garis <selalu positif>
	lds si,warna
	lodsb		;al = berubah
cetak:
	stosb
	add di,319
	dec cx		;cx berubah
	jnz cetak
	jmp selesai

horizontal:
			;ax = x1
			;bx = x2
			;cx = y1
			;dx = y2
	cmp ax,bx
	jl short langsunghor
			;jika x1 < x2 maka langsung aja
	xchg ax,bx
langsunghor:
	mov di,cx
	shl di,1
	shl di,1
	add di,cx
	shl di,1
	shl di,1
	shl di,1
	shl di,1
	shl di,1
	shl di,1
	add di,ax
	mov cx,bx	;cx = x2

	sub cx,ax	;cx = x2-x1
	inc cx,1		;cx =x2 - x1 + 1 = panjang garis
	lds si,warna
	lodsb
	repnz
	stosb
	jmp selesai

general:
			;ax = x1
			;bx = x2
			;cx = y1
			;dx = y2
	mov inty2,dx

	sub dx,cx	;dx = y2 - y1
	cmp dx,0
	jg DELTAEX	;kalo dx > 0 maka cari deltaex
	not dx
	inc dx,1		;dx = -dx
deltaex:
			;DX = DELTAYE SELALU POSITIF
	mov intx2,bx	;intx2 = x2
	sub bx,ax	;bx = x2 - x1
	cmp bx,0
	jg KEMIRINGAN	;kalo bx > 0 maka kemiringan
	not bx
	inc bx,1		;bx = -bx
kemiringan:
			;BX = DELTAEX SELALU POSITIF
	cmp dx,bx
	jg CURAM	;if deltaye > deltaex maka curam
			;LANDAI
	cmp ax,intx2
	jl LANDAIMULAI	;kalo x1 < x2 maka landaimulai
			;kalo x1 > x2 maka tukar dulu kedua elemen titik

	xchg ax, intx2
	xchg cx, inty2

landaimulai:
			;ax = x1
			;intx2 = x2
			;si = intx2
			;BX = DELTAEX ABSOLUTE
	mov dx,inty2
	sub dx,cx	;dx = y2 - y1
	cmp dx,0		;dx = deltaye
	jg kbawah	;if deltaye > 0 maka kbawah
			;bagian sini deltaye negatif
	mov word kenaikan,-320
			;kenaikan = -320
	not dx
	inc dx,1
			;deltaye = positif
	jmp short mulaigambar
kbawah:
	mov word kenaikan, 320

mulaigambar:
			;DX = DELTAYE SELALU POSITIF
	mov di,cx	;di = y1
	shl di,1
	shl di,1
	add di,cx
	shl di,1
	shl di,1
	shl di,1
	shl di,1
	shl di,1
	shl di,1
	add di,ax		;di = 320 * y1 + x1

	mov cx, bx	;cx = deltaex

	mov bx,dx	;bx = deltaye
	sub bx,cx	;bx = deltaye - deltaex
	shl bx,1		;bx = increment 2

	shl dx,1		;dx = increment 1
	mov ax,dx	;ax = increment 1
	sub ax,cx	;ax = cnt
	inc cx,1		;cx = panjang garis

	mov intx2,ax	;intx2 = cnt

	lds si,warna
	lodsb

doting:
	stosb
	cmp word intx2, 0
	jl kanan		;jika cnt < 0 maka geser kanan
	add intx2,bx	;cnt = cnt + increment 2
	add di,kenaikan
	dec cx		;cx berubah
	jnz doting
	jmp selesai
kanan:
	add intx2,dx	;cnt = cnt + increment 1
	dec cx		;cx berubah
	jnz doting
	jmp short selesai

curam:
	cmp cx, inty2
	jl CURAMMULAI	;jika y1 < y2 maka terus ke curammulai
	xchg cx, inty2
	xchg ax, intx2

curammulai:
			;dx = DELTAYE ABSOLUTE
	mov bx,intx2

	sub bx,ax	;bx = x2 - x1 = DELTAEX
	cmp bx,0
	jg SETGEKAN	;kalo DELTAEX > 0
	not bx
	inc bx,1		;BX = -BX
	mov word kenaikan, -1	;kenaikan  = -1
	jmp short gambarcuram
setgekan:
			;BX = DELTAEX POSITIF
	mov word kenaikan,1	;kenaikan = 0
gambarcuram:
	mov di,cx
	shl di,1
	shl di,1
	add di,cx
	shl di,1
	shl di,1
	shl di,1
	shl di,1
	shl di,1
	shl di,1
	add di,ax
	
	mov cx,dx	;cx = DELTAYE
	mov ax,bx	;ax = deltaex
	shl ax,1		;ax = increment 1
	mov dx,ax	;dx = increment 1
	sub ax, cx	;ax = increment 1 - deltaye
			;ax = CNT
	mov intx2, ax

	sub bx,cx	;bx = DELTAEX - DELTAYE
	shl bx,1		;bx = increment 2
	inc cx,1		;cx = DELTAYE + 1
			;cx = tinggi garis

	lds si,warna
	lodsb		;al = warna

dotingc:	
	stosb
	add di,319
	
	cmp word intx2,0
	jl biasa		;jika cnt < 0 maka biasa
	add intx2,bx	;cnt = cnt + increment 2
	add di, kenaikan
	dec cx
	jnz dotingc
	jmp short selesai

biasa:
	add intx2, dx	;cnt = cnt + increment 1
	dec cx
	jnz dotingc
selesai:
	pop ax
	pop ax
	pop ax

	pop ds
	pop bp
.end
