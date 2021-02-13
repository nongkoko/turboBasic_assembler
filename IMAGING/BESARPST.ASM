'besarpst (namafile$,  x%,   y%)
               0E     0A    06
push bp
mov bp,sp
push ds
mov ax,[0]
lds si,[bp+0e]
mov dx,[si+02]
mov ds,ax
push ds
push dx
mov ax,3D00
int 21
mov bx,ax
lds dx,[bp+0a]
mov cx,2
mov ah,3f
int 21
lds dx,[bp+06]
mov ah,3F
int 21
mov ah,3E
pop dx
pop ds
int 21
pop ds
pop bp