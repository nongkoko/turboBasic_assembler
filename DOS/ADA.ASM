;call ada(pathname$+chr$[0], yesno%)

adakah equ [bp+06]
nama equ [bp+10]

dump	equ	[bp-46]

.model tiny
.186
.code
	org 100h

	push bp
	mov bp,sp
	push ds

	mov bx,[0]		;bx = segstring

	mov cx,22
pushlagi:
	push ax
	dec cx
	jnz pushlagi

setdta:
	push ss
	pop ds			;ds = stack segmen
	mov dx,sp		;dx = memori 22 integer
	mov ah,1Ah		;ah = 1Ah
	int 21h
find:
	lds si,nama
	mov dx,[si+2]		;dx = offstring nama
	mov ds,bx		;ds = segstring
	mov ah,4Eh		;ah = 4Eh
	mov cx,23		;cx = 23
	int 21h
	jc gagal
	mov ax,-1
	les di, adakah
	stosw
	jmp short selesai
gagal:
	les di,adakah
	mov ax,0
	stosw
selesai:
	mov cx,22
poplagi:
	pop ax
	dec cx
	jnz poplagi

	pop ds
	pop bp
.end
