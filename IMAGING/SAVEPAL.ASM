'erno%
'ah = 1 then err in crea

call savepal(bufferint%[384], namafile$)

push bp >1
mov bp,sp
push ds >2

creatfile:
 mov bx,[0]
 mov ah,3C
 lds si,[bp+06]
 mov dx,[si+02]
 mov cx,0
 mov ds,bx
 int 21
 jc selesai
dumping:
 push ds >3
 push dx >4
 les di,[bp+0a]
 push ax >5 filehandler
 mov cx,100
 xor ax,ax
 mov dx,3C8
 out dx,al
 mov dx,3c9
simpan: 12B
 in al,dx
 stosb
 in al,dx
 stosb
 in al,dx
 stosb
 loopnz simpan
saving:
 mov ah,40
 lds dx,[bp+0a]
 pop bx <5 filehandler
 mov cx,300
 int 21
tutupfile:
 mov ah,3e
 pop dx <4
 pop ds <3
 int 21
selesai: 144
 pop ds <2
 pop bp <1



