;call instalfont(memorihuruf%[setengahukuranfile], namafont$, erno%)

erno		equ	[bp+06]
namafont	equ	[bp+10]
memori		equ	[bp+14]

dump		equ	[bp-46]	;22 integer

.model tiny
.code
.186
	org 100h
	push bp
	mov bp,sp
	push ds
				;ds local
	mov bx,[0]		;bx = segstring
	mov cx,22		;cx = 22

pushlagi:
	push ax
	dec cx
	jnz pushlagi

setdta:
	mov ah,1Ah		;ah = 1A
	push ss
	pop ds			;ds = ss
	mov dx,sp		;dx = bp-46
	int 21h

findfirst:
	mov ah,4Eh		;ah = 4Eh
	mov cx,23		;cx = 23
	lds si,namafont		;ds:si tunjuk namafont
	mov dx,[si+2]		;dx = offstring nama
	mov ds,bx		;ds = segstring
	int 21h
	jc short filenotfound
	jmp short getlen

filenotfound:
	les di,erno		;es:di tunjuk erno
	mov ax,2			;ax = 2
	stosw			;di = di + 2
	jmp short selesai

getlen:
	mov si,sp		;si = bp-46
	add si,26			;si tunjuk ukuran file
	mov cx,ss:[si]		;cx = word ukuran file

openfile:
	mov ax,3D00h		;ax = 3D00
	int 21h			;ax = filehandler
	mov bx,ax		;bx = filehandler

readentire:
	mov ah,3Fh		;ah = 3Fh
	lds dx,memori		;ds:dx tunjuk memori
	int 21h			;jumlah byte yang dipindahkan

closefile:
	mov ah,3Eh		;ah = 3eh
	int 21h

selesai:
	mov cx,22		;cx = 22
poplagi:
	pop ax
	dec cx
	jnz poplagi	

	pop ds
	pop bp
.end
