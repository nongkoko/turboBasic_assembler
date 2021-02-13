By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
mvnzblok (segsum, x, y,segtuj, x, y,panjang,lebar)
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
mov ds,[si]
mov si,bx

mov bx,cx

pindahkan:158
 lodsb                     ds:si+1
 cmp al,0
 jz lewat
 stosb                     es:di+1
 dec di                    es:di-1

lewat:15F
 inc di                    es:di+1
 loopnz 158
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
