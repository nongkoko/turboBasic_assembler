By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
PRNT132 (seg, y , x,teks$,warna)
        16  12  0E   0A     06

y*264+x*2+0,karakter
y*264+x*2+1,warna

push bp
mov bp,sp
push ds

mov ds,[0]
push ds

		lds si,[bp+0A]
		mov cx,[si]

mov si,[si+02]
push si

		lds si,[bp+16]
		mov es,[si]

lds si,[bp+12]
lodsw          y
mov di,ax      y
shl di,1       y*2
shl di,1       y*4
add di,ax      y*4+y = y*5
shl di,1       y*10
add di,ax      y*10+y = y*11
mov ax,di      ax = y*11
shl di,1       (y*11) * 2
add di,ax      (y*11) * 2 + (y*11)  = (y*11)*3 = y * 33
shl di,1       y*66
shl di,1       y*132
shl di,1       y*264
lds si,[bp+0E]
lodsw          x
shl ax,1       x*2
add di,ax      di = y*264+x*2 = untuk karakter

lds si,[bp+06]
lodsw

pop si
pop ds

satu:
movsb
stosb
loopnz satu

pop ds
pop bp


