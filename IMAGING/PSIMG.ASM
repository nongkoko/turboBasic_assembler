By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini

SYNTAX CALL PSIMG(NAMAFILE,SEGTUJ,OFFTUJ,NEXTOFF)
                    12       0E     0A      06
push bp
mov bp,sp
push ds

mov ax,[0]
push ax

lds si,[bp+12] : mov dx,[si+02]
                 pop ds
                 PUSH DS
                 PUSH DX
                 mov ax,3D00
                 int 21

                 mov bx,ax
                 MOV AX,4202
                 XOR CX,CX
                 XOR DX,DX
                 INT 21
                 PUSH AX
                 MOV AX,4200
                 INT 21

                 POP CX
                 MOV AH,3F
LDS SI,[BP+0A]:  MOV DX,[SI]
LDS SI,[BP+0E]:  MOV DS,[SI]
                 INT 21
LES DI,[BP+06]:  ADD AX,DX
                 STOSW
                 MOV AH,3E
                 POP DX
                 POP DS
                 INT 21
                 POP DS
                 POP BP
                 RET