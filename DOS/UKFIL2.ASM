;ukuran file
;make sistem dta
;call ukfil(namafile$+chr$[0], ukuranfile&)
;		0A		06

ukuran	equ	[bp+06]
namafile	equ	[bp+0Ah]
dump	equ	[bp-46]

.model tiny
.186
.code
	org 100h

	push bp
	mov bp,sp
	push ds

	mov cx,22
lpush:
	push ax
	dec cx
	jnz lpush
				;sp = bp-46
	mov bx,[0]		;bx = segstring
setdta:
	mov dx,sp		;dx = dump
	push ss
	pop ds			;ds = SS
	push ds
	push dx
	mov ah,1Ah
	int 21h

	lds si,namafile
	mov dx,[si+02]		;dx = offstring
	mov cx,23		;cx = all but vol label attribute
	mov ds,bx		;ds:dx = segstring:offstring
	mov ah,4Eh		;ah = findfirst
	int 21h			;do it

	pop si			;si = off dump
	pop ds			;ds = seg dump
	add si,26			;si = ukuran
	les di,ukuran		;es:di tunjuk ukuran
	movsw
	movsw

	mov cx,22
lpop:
	pop ax
	dec cx
	jnz lpop

	pop ds
	pop bp
.end
