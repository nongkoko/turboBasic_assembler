find byte in variable numeric
call fbnum(start%, numersumber%, ygdicari%, banyakpencarian%, posisi%)
             16        12            0e          0a             06
push bp
mov bp,sp
push ds
lds si, [bp+0a]
mov cx, [si]
lds si, [bp+0e]
mov ah, [si]
lds si, [bp+16]
mov dx, [si]
lds si, [bp+12]
add si, dx
xor bx,bx

checklagi:11A
 jcxz selesai		'jika cx = 0 maka selesai
 lodsb			'al = yang didapat
 cmp ah,al		'bandingkan ah dengan al
 jz hampirselesai	'kalo sama, maka hampir selesai
 inc bx			'kalo tidak sama, maka naikkan bx
 dec cx			'kurangi cx dong lalu
 jmp checklagi		'check byte lagi

hampirselesai:125
 les di,[bp+06]
 add bx, dx
 es:
 mov [di],bx
selesai:12D
pop ds
pop bp




