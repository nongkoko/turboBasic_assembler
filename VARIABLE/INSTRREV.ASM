master$ = "Livan Afryanto"
           01234567890123
call instrrev(master$, char%, start%, pos%)

pan% = len(master$)
byte% = char%
mulai% = start%
kalo start% > pan% maka error
ds = segstring
si = offstring(master$)+start%-1
counter% = 0

baca:
 kalo pan% = 0 maka taktemu
 al = ambil satu byte
 kalo al% = byte% maka temu
 naikkan counter%
 dec si 
 dec si
 dec pan%
 goto baca

error:
 pos% = FFFF
 les di,[bp+06]
 stosb
 jmp selesai

taktemu:
 pos% = 0

push bp
mov bp,sp
push ds

mov bx,[0]
lds si,[bp+0e]
mov ah,[si]
lds si,[bp+0a]
mov dx,[si]
lds si,[bp+12]
mov cx,[si]
mov si,[si+02]
mov ds,bx
cmp dx, cx
jg error

add si,dx
dec si
mov bx,dx
5

baca: 125
 cmp bx,0
 jz taktemu
 lodsb
 cmp ah,al
 jz ktemu
 dec si
 dec si
 dec bx
 jmp baca
15

taktemu: 134
 mov ax,0
 les di,[bp+06]
 stosw
 jmp selesai
9

ktemu:13D
 les di,[bp+06]
 es:
 mov [di],bx
 jmp selesai
8
error:145
 mov ax,FFFF
 les di,[bp+06]
 stosw
7
selesai: 14c
 pop ds
 pop bp 
