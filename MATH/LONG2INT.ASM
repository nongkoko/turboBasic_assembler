By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
sub LONG2INT inline '(asf&,hiint%,loint%)
 push bp
 mov bp,sp
 push ds
 lds si,[bp+0E]
 db 66
 mov dx,[si]
 mov ax,dx
 les di,[bp+06]
 stosw
 mov cl,10h
 DB 66
 shr dx,cl
 mov ax,dx
 les di,[bp+0A]
 stosw
 pop ds
 pop bp
end sub
