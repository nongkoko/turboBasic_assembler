;By: Livan Kamu harus mengkredit nama saya bila gunain asm ini
;CALL SYNTAX (bUFFERINT%[162],NAMFIL$,SEG,X,Y) 'MODEL 320-TR-buff
ye	equ	[bp+06]
ex	equ	[bp+10]
seg	equ	[bp+14]
nama	equ	[bp+18]
buff	equ	[bp+22]

.model tiny
.code
.186
	org 100h

	PUSH    BP			;>1
	MOV     BP,SP
	PUSH    DS			;>2
	MOV     bx,[0000]			;bx = segstring
	LDS     SI,ye
	LODSW
	MOV     DI,AX
	SHL     DI,1
	SHL     DI,1
	ADD     DI,AX
	SHL     DI,1
	SHL     DI,1
	SHL     DI,1
	SHL     DI,1
	SHL     DI,1
	SHL     DI,1
	LDS     SI,ex
	LODSW
	ADD     DI,AX			;di = offtuj
	LDS     SI,seg
	MOV     ES,[SI]			;es = segtuj
openfile:
	LDS     SI,nama			;ds:si tunjuk nama
	MOV     DX,[SI+02]			;dx offstring nama
	mov ds,bx			;ds segstring
	MOV     AX,3D00h
	INT     21h			;ax = file handler
readfour:
	mov bx,ax			;bx = file handler
	LDS     DX,buff			;ds = segmen buff
					;dx = offset buff
	MOV     AH,3Fh			;ah = 3F
	mov cx,4				;cx = 4
	INT     21h			;ax = jumlah byte
takepanjanglebar:
	mov si,dx			;si = offset buff
	MOV CX,[SI]			;cx = panjang
	mov ax,[si+02]			;ax = lebar
	add dx,4				;dx = offset buff + 4
bacasatubaris:
	push cx				;>3
	push di				;>4
	push ax				;>5
	mov ah,3Fh			;ah = 3F
	;bx = file handler
	;cx = panjang
	;ds segmen buff
	;dx offset buff+4
	int 21h				;ax = jumlah byte
	mov si,dx			;si = offset buff + 4
bacawarna:
	lodsb				;al = warna
	cmp al,0				;apakah warna = 0
	je nol				;jika sama maka ke nol
	es:
	mov [di],al
nol:
	inc di
	dec cx				;panjang = panjang - 1
	jnz bacawarna
	pop ax				;<5 ax = lebar
	pop di				;<4 di = offset tujuan
	pop cx				;<3 cx = panjang
	add di,320
	dec ax
	jnz bacasatubaris			;if lebar <> 0 then bacasatubaris
closefile:
	mov ah,3Eh
	;bx = filehandler
	int 21h
recover:
	pop ds
	pop bp
.end
