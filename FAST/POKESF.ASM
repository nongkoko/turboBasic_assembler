By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
pokes(Segmen,offset,string$)


push bp
mov bp,sp
push ds

mov ax,[0]
lds si,[bp+0E]
MOV ES,[SI]
lds si,[bp+0A]
MOV DI,[SI]
lds si,[bp+06]
MOV CX,[SI]
MOV SI,[SI+02]
MOV DS,AX
rep
movsb
pop ds
pop bp
ret
