new bar model 320
call bar(panjang,lebar,warna,segment,x  ,y)
            1A     16   12    0E     0A  06
push bp
mov bp,sp
push ds
lds si,[bp+0e]
mov es,[si]
lds si,[bp+06]
lodsw
mov di,ax
shl di,1
shl di,1
add di,ax
shl di,1
shl di,1
shl di,1
shl di,1
shl di,1
shl di,1
lds si,[bp+0A]
lodsw
add di,ax

lds si,[bp+16]
mov bx,[si]
lds si,[bp+1A]
mov cx,[si]
lds si,[bp+12]
lodsb
mov dx,cx

tulis:
 rep
 stosb
 dec bx
 jz selesai
 add di,140
 sub di,dx
 mov cx,dx
 jmp tulis

selesai:
 

end
SYNTAX CALL BAR(PANJANG,LEBAR,WARNA,SEGMENT,OFFSET)
15A1:0100 55            PUSH    BP
15A1:0101 89E5          MOV     BP,SP
15A1:0103 1E            PUSH    DS
15A1:0104 C57606        LDS     SI,[BP+06]
15A1:0107 8B3C          MOV     DI,[SI]
15A1:0109 C5760A        LDS     SI,[BP+0A]
15A1:010C 8E04          MOV     ES,[SI]
15A1:010E C5760E        LDS     SI,[BP+0E]
15A1:0111 8A04          MOV     AL,[SI]
15A1:0113 C57612        LDS     SI,[BP+12]
15A1:0116 8B14          MOV     DX,[SI]
15A1:0118 C57616        LDS     SI,[BP+16]
15A1:011B 8B1C          MOV     BX,[SI]
15A1:011D 89D1          MOV     CX,DX
15A1:011F 89CA          MOV     DX,CX
15A1:0121 57            PUSH    DI
15A1:0122 89D9          MOV     CX,BX
15A1:0124 F3            REPZ
15A1:0125 AA            STOSB
15A1:0126 5F            POP     DI
15A1:0127 81C74001      ADD     DI,0140
15A1:012B 89D1          MOV     CX,DX
15A1:012D E2F0          LOOP    011F
15A1:012F 1F            POP     DS
15A1:0130 5D            POP     BP
