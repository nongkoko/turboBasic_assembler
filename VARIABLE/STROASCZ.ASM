By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
"ABCSAFS" = 7
"ASFSA"+chr$[0]+"asfas" = 5

syntax (string$,Lennya)

push bp
mov bp,sp
push ds
mov ax,[0]
xor bx,bx
lds si,[bp+0a]
mov cx,[si]
mov si,[si+02]
mov ds,ax

baca: 113
jcxz ktemunol
lodsb
cmp al,0
jz ktemunol
inc bx
dec cx
jmp baca

ktemunol:11e
mov ax, bx
les di,[bp+06]
stosw
pop ds
pop bp

