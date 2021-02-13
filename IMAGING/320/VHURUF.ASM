;call vhuruf(fontmemori%[0], segmen%, x, y, teks$, warna)

warna		equ	[bp+06]
teks		equ	[bp+10]
ye		equ	[bp+14]
ex		equ	[bp+18]
segmen		equ	[bp+22]
memori		equ	[bp+26]

offsum		equ	[bp-04]
verpos		equ	[bp-05]
banyak		equ	[bp-06]


.model tiny
.code
.186
	org 100h
	jmp mulai

bs2pxy proc near uses di
	;parameternya (offsum, verpos, banyak) ds harus mengarah pada segmen memofont sedangkan offsum didapat dari 5n+offset
	mov cl, ss:verpos
tambah:
	cmp cl,0
	je lewattambah
	add di,320
	dec cl
	jnz tambah

lewattambah:
	push ds
	lds si,warna
	mov ah,[si]			;ah = warna
	pop ds
	mov dh, ss:banyak
	mov si, ss:offsum

mulaiproc:
 	cmp dh,0
	je selesaiproc
	push di
	dec dh
	lodsb
	mov bl,al
	mov dl,1
	mov cl,8
banding:
	and al,dl
	jnz tembak
geser:
	mov al,bl
	add di,320
	shl dl,1
	dec cl,1
	jnz banding
	pop di
	inc di
	jmp mulaiproc
tembak:
	es:
	mov [di],ah
	jmp geser
selesaiproc:
	ret
	endp
;procedure bs2pxy(offsum, verpos, banyak) ds harus mengarah pada segmen memofont sedangkan offsum didapat dari 5n+offset

mulai:
	push bp	;>1
	mov bp,sp
	push ds	;>2

	push ax	;>3
	push ax	;>4

	mov bx,[0]
setesdi:
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
	add di, [si]		;di = offset gambar
	lds si,segmen
	mov es,[si]		;es = segmen gambar
	lds si,teks
	mov cx,[si]		;cx = panjang teks
	mov si,[si+2]
	mov ds,bx
	mov bh,0		;bh = possamp = 0

hurufdalamteks:
	cmp cx,0
	je selesai			;if panjangteks = 0 then goto selesai
	dec cx		;cx = cx - 1
	lodsb		;al = huruf yang akan digambar
	push ds	;>5 sstr
	push si	;>6 ostr
	push cx	;>7 pjgteks
	lds si,memori	;ds tunjuk memfont
	mov ah,[si]		;ah = jumlah huruf provided (n)
	mov bl,ah		;bl = counter u/ cari sample
	inc si
	mov bh,0

ceksam:
	cmp [si], al
	je getpan			;if al = sample maka cari panjang huruf, tapi jika bukan cari ke sample berikutnya
	inc bh		;bh = bh + 1
			;possamp = possamp + 1
	dec bl		;bl = bl - 1
	jz notprovided		;if counter = 0 then goto notprovided
	inc si		;si = si + 1
			;si tunjuk ke sample berikutnya
	jmp ceksam	;cek lagi sample

notprovided:
	add di,3		;gambar spasi
	pop cx	;<7	;cx = pjgteks
	pop si	;<6	;si = ostr
	pop ds	;<5	;ds = sstr
	jmp hurufdalamteks	;ambil huruf berikutnya

getpan:			;bh = possamp
	mov dl,bh
	mov dh,0
	mov cx,ax
	xchg ch,cl
	mov ch,0		;cx = n = jumlah huruf provided
	mov si, dx
	add si, cx
	mov bl,[si+1]
	mov ss:banyak,bl
	add si, cx
	
	mov bl,[si+1]
	mov ss:verpos,bl

	add si, cx		;si = a + n + n + n
	add si, dx		;si = a+a+n+n+n
	mov dx,[si+1]	;dx = offset data huruf
	mov ax, cx
	shl ax,1
	shl ax,1
	add ax, cx
	add ax, dx		;AX = 5*n + offset
	inc ax
	mov ss:offsum,ax
	call bs2pxy
	mov cx, ss:banyak
	mov ch,0
	add di,cx
	inc di
	pop cx		;<7 cx = panjang teks
	pop si		;<6 si = offstring
	pop ds 		;<5 ds = segstring
	jmp hurufdalamteks
	
selesai:
	pop ax		;<4
	pop ax		;<3

	pop ds		;<2
	pop bp		;<1
.end