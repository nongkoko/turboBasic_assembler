;call pankal(memofont%[0], teks$, panjangpixel)

panjangpixel	equ	[bp+06]
teks		equ	[bp+10]
memofont		equ	[bp+14]

varpanjang	equ	[bp-04]

.model tiny
.code
.186
	org 100h

	push bp	;>1
	mov bp,sp
	push ds	;>2

	push 0	;>3

	mov bx,[0]		;bx = segstring
	lds si, teks		;ds:si tunjuk teks
	mov cx,[si]		;cx = panjang teks
	cmp cx,0
	je kirimnol		;jika cx = 0 maka langsung ajah kirim nol
	mov si,[si+2]	;si = offstr teks
	mov ds,bx		;ds = seg string

nexthuruf:
	cmp cx,0
	je kirimpanjang		;if panjang teks = 0 then kirim panjang
	dec cx		;panjangteks = panjang teks - 1
	mov bh,[si]	;bh = huruf yang dimaksud
	inc si
	push ds	;>4 segstring
	push si	;>5 offstring
	push cx	;>6 panjang teks
	lds si, memofont	;ds = seg memofont
	mov ah,[si]		;ah = N
	mov dh,0
	mov dl,ah		;dx = counter = n
	inc si		;si = offset sample
	xor cx,cx		;cx = possamp = 0

ceksam:
	lodsb		;al = huruf sample
	cmp al,bh
	je getpanjang		;if huruf pada sample = huruf yang dimaksud then getpanjang
	inc cx		;possamp = possamp + 1
	dec dx		;counter = counter - 1
	jz notprovided		;if counter = 0 then notprovided
	jmp ceksam

getpanjang:		;cx = real possamp
	xchg ah,al		;ax = huruf sample & N
	mov ah,0		;ax = N
	inc cx		;cx = possamp + 1
	add ax,cx		;ax = N + possamp + 1
	mov si,ax		;si = offset panjang
	lodsb		;al = panjang huruf
	mov ah,0		;ax = panjang huruf
	inc ax		;ax = panjang huruf + 1

	add ss:varpanjang, ax
	pop cx	;<6 cx = panjang teks
	pop si	;<5 si = offstring
	pop ds	;<4 ds = segstring
	jmp nexthuruf

kirimnol:
	les di, panjangpixel
	mov word es:[di],0
	jmp short selesai

notprovided:
	add word ss:varpanjang, 3
	pop cx	;<6
	pop si	;<5
	pop ds	;<4
	jmp nexthuruf

kirimpanjang:
	les di, panjangpixel
	mov ax, ss:varpanjang
	dec ax
	stosw

selesai:
	pop ax
	pop ds
	pop bp
.end

