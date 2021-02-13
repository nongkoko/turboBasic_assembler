By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
'mengambil data pada segmen:offset sebanyak len(stringtujuan$) kedalam stringtujuan$
'Subrutin peek$(Segmen, Offset, StringTujuan$)
                  0E      0A         06
push bp
mov bp,sp
push ds
mov es,[0]
lds si,[bp+06]
mov cx,[si]
mov di,[si+02]
lds si,[bp+0E]
mov ax,[si]
lds si,[bp+0A]
mov si,[si]
mov ds,ax
rep
movsb
pop ds
pop bp







