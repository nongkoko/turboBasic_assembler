;viewpst non transparent non buffer 320 read from file langsung
;call vptnb(namaFileSumber,segmTarget,xTarget,yTarget)

ye	equ	[bp+06]
ex	equ	[bp+10]
segm	equ	[bp+14]
nama	equ	[bp+18]
lebar	equ	SS:[bp-4]
panjang	equ	SS:[bp-6]

.model tiny
.code
.186
	org 100h

	push bp							;>1
	mov bp,sp						;bp = sp
	push ds							;>2 sp = bp-2

	push 0							;>3 sp = bp-4; ruang untuk lebar
	push 0							;>4 sp = bp-6; untuk panjang

	mov bx,[0]						;bx = segstring

	lds si,segm
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
	shl di,1
	lds si,ex
	lodsw
	add di,ax

open:
	lds si,nama
	mov dx,[si+2]						;dx = offstring nama
	mov ds,bx						;ds = segstring
	mov ax, 3D00h						;ax = 3D00h
	int 21h							;ax = filehandler

read:
	mov bx,ax						;bx = filehandler
	mov ah,3Fh						;ah = 3F
	mov cx,4							;cx = 4 byte pembacaan

	push ss							;sp = bp - 8
	pop ds							;sp = bp - 6
									;ds = ss
	mov dx,sp						;dx = bp - 6  = panjang
	int 21h							;ax = jumlahbyte
	
								;SS:[bp-6] = panjang gbr
								;SS:[bp-4] = lebar gbr
	mov dx,di			;dx = offtuj
bacasebaris:
	mov ah,3Fh			;ah = 3F
	;bx = filehandler
	push es				;sp = bp - 8
	pop ds				;sp = bp - 6
	mov cx,panjang			;cx = panjang gbr
	int 21h				;ax = jumlah byte
	add dx, 320			;dx = dx + 320
	dec word lebar			;lebar = lebar - 1
	jnz bacasebaris			;if lebar <> 0 then bacasebaris
	
tutup:
	mov ah,3Eh
	;bx = filehandler
	int 21h

selesai:
	pop ax							;freemem
	pop ax							;freemem
	pop ds
	pop bp
.end
