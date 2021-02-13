By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
mvblok (segsum, x, y,segtuj, x, y,panjang,lebar)
            22   1E 1A   16    12 0E    0A     06
push bp
mov bp,sp
push ds

lds si,[bp+06]
mov dx,[si]

lds si,[bp+0A]
mov cx,[si]

lds si,[bp+16]
mov es,[si]

lds si,[bp+0E]
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
shl di,1
lds si,[bp+12]
lodsw
add di,ax

lds si,[bp+1A]
lodsw
mov bx,ax
shl bx,1
shl bx,1
add bx,ax
shl bx,1
shl bx,1
shl bx,1
shl bx,1
shl bx,1
shl bx,1
lds si,[bp+1E]
lodsw
add bx,ax
lds si,[bp+22]
lodsw

mov ds,ax
mov si,bx

mov bx,cx

pindahkan:
 rep movsb
 dec dx
 jz selesai
 add di,140
 sub di,bx
 mov cx,bx
 add si,140
 sub si,bx
 jmp pindahkan

selesai:
 pop ds
 pop bp

ret
