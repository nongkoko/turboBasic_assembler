By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
memasukkan nilai segmen (dari aray yang dimasukkan) pada seg

call pointer (array(), seg%)

push bp
mov bp,sp
push ds

les di,[bp+06]

lds si,[bp+0A]

mov ax,ds

stosw

pop ds
pop bp
