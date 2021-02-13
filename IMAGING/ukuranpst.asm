;call viewpst(handler,nama,x,y)

ye equ [bp+06]
ex equ [bp+10]
nama equ [bp+14]
handler equ [bp+18]

.model tiny
.186
.code
	org 100h

	push bp					;>1
	mov bp,sp	
	push ds					;>2
	
	mov bx,[0]				;BX = segstring

	mov ax,3D00h				;AX = 3D00
	lds si,nama				;DS:SI = tunjuk nama
	mov dx,[si+02]				;DX = offstring nama
	mov ds,bx					;DS = segstring
	push ds					;>3 SEGSTRING
	push dx					;>4 OFFSTRING
	int 21h					;AX file handler
	les di,handler				;ES:DI tunjuk handler
	stosw					;DI berubah
	mov bx,ax					;BX = file handler

	mov dx, offset panjang			;DS:DX = LOCAL:OFFSET panjang
	mov ah,3Fh				;AH = 3F
	mov cx,2					;CX = 2
	int 21h					;AX berubah

	mov dx, offset lebar				;DS:DX = LOCAL:OFFSET lebar
	mov ah,3Fh				;AH = 3F
	int 21h

	les di,ye					;ES:DI tunjuk ye
	mov ax,lebar				;AX = lebar
	stosw					;DI = DI + 2
	les di,ex					;ES:DI tunjuk ex
	mov ax,panjang				;AX = panjang
	stosw					;DI = DI + 2

tutupfile:
	mov ah,3eh
	pop dx					;DX = offstring
	pop ds					;DS = segstring
	int 21h
selesai:
	pop ds
	pop bp
	retf
panjang	dup	2,0
lebar	dup	2,0
.end