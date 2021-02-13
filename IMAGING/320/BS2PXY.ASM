By: Livan gratis
Kamu harus mengkredit nama gwa di program lo
menggambar pset dari byte
bs2p
syntax call bs2p(segmensumber, ofsetsumber, segmentujuan, x, y, warna, banyak)
                      1E            1A           16      12 0E    0A     06

push bp  > 1
mov bp,sp
push ds  > 2

lds si,[bp+oe]
mov di,[si]             'di = y
lodsw                   'ax = y
shl di,1                'di = y * 2
shl di,1                'di = y * 4
add di,ax               'di = y * 5
shl di,1                'di = y * 10 
shl di,1                'di = y * 20
shl di,1                'di = y * 40
shl di,1                'di = y * 80
shl di,1                'di = y * 160
shl di,1                'di = y * 320

lds si,[bp+12]          
lodsw                   'ax = x
add di,ax               'di = y * 320 + x = ofsettujuan
push di >3              
lds si,[bp+16]          
mov es,[si]             'es = segmen tujuan

lds si,[bp+0a]          
mov dl,[si]             'dl = warna
lds si,[bp+06]          
mov dh,[si]             'dh = banyak
lds si,[bp+1a]
lodsw                   'ax = ofsetsumber
lds si,[bp+1e]          
mov ds,[si]             'ds = segmensumber
mov si,ax               'si = ofsetsumber
mov ah,dl               'ah = warna

mulai:
 cmp dh,0               
 jz selesai             'bila dh = 0 maka selesai
 lodsb                  'al = byte
 mov bl,al              'bl = byte
 mov dl,1               'dl = 1
 mov cl,8               'cl = 8

banding:
 and al,dl              'al akan berubah
 jnz tembak             'bila hasilnya bukan nol maka tembak
 
geser:
 mov al,bl              'al akan berisi byte kembali
 add di,140             'DI ditambah dengan 320
 shl dl,1               'dl dikali 2
 dec cl,1               'cl dikurangi dengan 1
 jnz banding            'apabila bukan nol maka ulangi ke banding

dec dh,1                'dh dikurangi dengan 1
pop di <3               'DI awal dikembalikan
inc di,1                'DI ditambah 1
push di >3              'DI disimpan kembali
jmp mulai               

tembak:
 es:                    'dengan segmen ES
 mov [di],ah            'kirim warna pada ofset DI
 jmp geser

selesai:
 pop di <3
 pop ds <2
 pop bp <1
 ret
