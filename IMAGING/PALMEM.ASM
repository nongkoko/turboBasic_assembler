palleting dari memory, 256 warna, data diperlukan 768 byte
syntax palmem(segmen%, offset%)
		0a	06
format penyimpanan r,g,b,r,g,b,..... (untuk pst palette)

push bp
mov bp,sp
push ds
mov al,0
mov dx,3C8
out dx,al
lds si,[bp+0a]
lodsw			'ax segmen
lds si,[bp+06]
mov si,[si]		'si offset
mov ds, ax		'ds segmen. ds:si menunjuk pada bank memory
mov cx, 100		'cx 256 dengan sistem kerja dulu baru kurangi dan test nol
			'jadi total loop = 256, test 1 dikerjain dulu kurangi satu berhenti = satu kali
@2:118
 mov bx, 3
@1:11B
 lodsb			'al = data
 mov dx, 3C9
 out dx, al		'paleting
 dec bx
 jnz @1			'kalo bx belum nol loncat @1. kalo udah nol maka
 dec cx			'cx kurangi satu
 jz selese		'kalo cx udah abis selese. kalo belon maka
 jmp @2
selese:
 pop ds
 pop bp