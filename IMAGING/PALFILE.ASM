By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
call palfile(384buffer%(0),namfil$) 'ASCIIZ
push bp >1
mov bp,sp
push ds >2

mov ax,[0]           'ax segstring
lds si,[bp+06]       'lds si -> parameter kedua
mov dx,[si+02]       'dx offstring
mov ds,ax            'ds segstring
mov ax,3D00          'ah 3D al 00
int 21               'ax nomor handler

push ds >3           'segstring
push dx >4           'offstring
push ax >5           'nomor handler

mov bx, ax           'bx nomor handler
mov ah,3F            'ah 3F
lds dx,[bp+0A]       'ds:dx parameter pertama
mov cx, 300          'cx 768 byte
int 21               'ax jumlah byte yang terbaca

mov si, dx           'si = dx, ds:si = parameter pertama

mov dx, 03C8
mov al, 00
out dx, al
mov dx, 03C9

baca:12E
lodsb                'membaca satu byte dari parameter pertama
out dx, al           'merubah palette
loopnz baca          'lakukan sebanyak cx kali = 768 kali

pop bx <5            'bx = nomor handler
pop dx <4            'dx offstring
pop ds <3            'ds segstring

mov ah, 3E
int 21

pop ds
pop bp



