By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
'leaf fun

call lock(ascii)

push bp
mov bp,sp
push ds

 lds si,[bp+06]
 mov bl,[si]

scan:
 xor ax,ax
 int 16
 cmp al,bl
 jz exit
 jmp scan

exit:
pop ds
pop bp
ret