;tujuan: mencetak isi variabel numerik sebagai string
;y dan x tidak standar Turbo Basic yaitu dari 0,0 sampai 24,79
;call cetnum(segmen,  y,  x, numvar%, banyakbyte%, warna%)

warna	equ	[bp+06]
banyak	equ	[bp+10]
numvar	equ	[bp+14]
ex	equ	[bp+18]
ye	equ	[bp+22]
segmen	equ	[bp+26]

.model tiny
.code
.186
	org 100h
	push bp
	mov bp,sp
	push ds

	lds si,segmen
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
	lds si,ex
	lodsw
	shl ax,1
	add di,ax
			;es:di sudah siap
	lds si,warna
	lodsb
	lds si,banyak
	mov cx,[si]
	lds si,numvar
pindah:
	jcxz short selese
	movsb
	stosb
	dec cx
	jmp short pindah
selese:
	pop ds
	pop bp
.end
