By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
call gtdrv(drv$)
drv$ = 1 huruf saja. harus disiapkan sebelumnya

15A1:0100 55            PUSH    BP
15A1:0101 89E5          MOV     BP,SP
15A1:0103 1E            PUSH    DS

15A1:0104 B419          MOV     AH,19
15A1:0106 CD21          INT     21
15A1:0108 3E            DS:
15A1:0109 8B1E0000      MOV     BX,[0000]
15A1:010D 53            PUSH    BX
15A1:010E C57606        LDS     SI,[BP+06]
15A1:0111 3E            DS:
15A1:0112 8B5C02        MOV     BX,[SI+02]
15A1:0115 53            PUSH    BX
15A1:0116 5F            POP     DI
15A1:0117 07            POP     ES
15A1:0118 0441          ADD     AL,41
15A1:011A AA            STOSB
15A1:011B 1F            POP     DS
15A1:011C 5D            POP     BP

perubahan
~~~~~~~~~
push bp
mov bp,sp
push ds
mov bx,[0]
mov ah,19
int 21
lds si,[bp+06]
mov di,[si+02]
mov es,bx
add al,41
stosb
pop ds
pop bp

