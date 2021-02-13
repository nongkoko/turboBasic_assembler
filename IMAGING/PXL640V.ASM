By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
sekarang gwe mau coba bikin asembler untuk membuat pixel
resolusi 640 400 tetapi pada vesa sehingga
program ini harus dapat pindah bank dan sebagainya.

sub pxl.640(x%,y%,w%)
shared dax%

 da%  = y% \ 96
 rye% = y% - da%*96

 if da% <> dax% then
  call pdhargam(da%*15)
  dax% = da%
 end if

 call pxl640(&HA000,x%,rye%,w%)
end sub

hei bagaimana mengalokasikan memory yang shared pada asembler
wah bakal susah nich, nanti saja lah bikinnya

sekarang mah bikin asembler
bagaimana membagi bilangan dengan 96

? 96 / 2 / 2 / 2 / 2 / 2 /3


syntax bagi96(angka%,angka2%)

push bp
mov bp,sp
push ds

lds si,[bp+0A]
mov ax,[si]
shr ax,1
shr ax,1
shr ax,1
shr ax,1
shr ax,1
div ax,3
les di,[bp+0A]
stosw

pop ds
pop bp
ret






