tujuan: mencetak isi variabel numerik sebagai string
y dan x tidak standar Turbo Basic yaitu dari 0,0 sampai 24,79

call cetnum(segmen,  y,  x, numvar%, offnumvar%, banyakbyte%, warna%)
             1E     1A  16    12         0e          0a         06

push bp
mov bp,sp
push ds

lds si,[bp+1e]
mov es,[si]
lds si,[bp+1a]
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
lds si,[bp+16]
lodsw
shl ax,1
add di,ax
'es:di sudah siap

lds si,[bp+06]
lodsb
lds si,[bp+0a]
mov cx,[si]
lds si,[bp+0e]
mov bx,[si]
lds si,[bp+12]
add si,bx

pindah:13A
jcxz selese
movsb
stosb
dec cx
jmp pindah

selese:141
pop ds
pop bp