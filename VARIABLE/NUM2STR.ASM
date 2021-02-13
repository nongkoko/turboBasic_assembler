call num2str(varnum%, offset%, string$, offstr%, banyak%)
               16       12       0E       0A        06
'string harus terdefinisi panjangnya;minimal banyak%+offstr% karakter
'mengambil byte(s) dari varnum dengan offset tertentu ke dalam string dalam posisi offstr%, sebanyak banyak% byte(s)


push bp
mov bp,sp
push ds

mov es,[0]
lds si,[bp+06]
mov cx,[si]
lds si,[bp+0A]
lodsw
lds si.[bp+0e]
mov di,[si+02]
add di,ax
lds si,[bp+12]
lodsw
lds si,[bp+16]
add si,ax
rep
movsb

pop ds
pop bp