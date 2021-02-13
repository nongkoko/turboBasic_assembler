call tlfilmem(filehandler, segmen, offset, banyak)
                 12          0E      0A      06
push bp
mov bp,sp
push ds

lds si,[bp+06]
mov cx,[si]
lds si,[bp+12]
mov bx,[si]
mov ah, 40
lds si,[bp+0A]
mov dx,[si]
lds si,[bp+0E]
mov ds,[si]
int 21

pop ds
pop bp