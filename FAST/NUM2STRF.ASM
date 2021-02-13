;call num2str(varnum%, offset%, string$, banyak%)
;string harus terdefinisi panjangnya;minimal banyak%+offstr% karakter
;mengambil byte(s) dari varnum dengan offset tertentu ke dalam string dalam posisi offstr%, sebanyak banyak% byte(s)

banyak	equ	[bp+06]
string	equ	[bp+10]
offset	equ	[bp+14]
varnum	equ	[bp+18]

.model tiny
.code
.186
	org 100h

	push bp
	mov bp,sp
	push ds

	mov es,[0]
	lds si,banyak
	mov cx,[si]
	lds si,string
	mov di,[si+02]
	lds si,offset
	lodsw
	lds si,varnum
	add si,ax
	repz
	movsb

	pop ds
	pop bp
.end
