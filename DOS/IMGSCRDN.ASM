By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
syntax imgscrdn(layar,jarakscrol)

push bp
mov bp,sp
push ds

lds si,[bp+06]
mov bx,[si]

lds si,[bp+0A]
mov ds,[si]
push ds
pop es
xor si,si
xor di,di

mulai:114
 mov dx,00C8

pindah:117
 dec dx,1
 mov si,dx
 shl si,1
 shl si,1
 add si,dx
 shl si,1
 shl si,1
 shl si,1
 shl si,1
 shl si,1
 shl si,1
 mov di,si
 add di,140
 mov cx,A0
 rep movsw
 mov cx,dx
 jcxz next
 jmp pindah


next:
 dec bx
 jz selesai
 jmp mulai

selesai:
 pop ds
 pop bp


 pop ds
 pop bp

