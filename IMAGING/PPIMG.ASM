By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
SYNTAX PPIMG(SEGSUM,OFFSUM,SEGTUJ,OFFTUJ)

15A1:0100 55            PUSH    BP
15A1:0101 89E5          MOV     BP,SP
15A1:0103 1E            PUSH    DS
15A1:0104 C57606        LDS     SI,[BP+06]
15A1:0107 8B3C          MOV     DI,[SI]
15A1:0109 C5760A        LDS     SI,[BP+0A]
15A1:010C 8E04          MOV     ES,[SI]
15A1:010E C5760E        LDS     SI,[BP+0E]
15A1:0111 8B1C          MOV     BX,[SI]
15A1:0113 C57612        LDS     SI,[BP+12]
15A1:0116 8B14          MOV     DX,[SI]
15A1:0118 8EDA          MOV     DS,DX
15A1:011A 89DE          MOV     SI,BX
15A1:011C AD            LODSW
15A1:011D 89C3          MOV     BX,AX
15A1:011F AD            LODSW
15A1:0120 89C2          MOV     DX,AX
15A1:0122 89D1          MOV     CX,DX
15A1:0124 FC            CLD
15A1:0125 89CA          MOV     DX,CX
15A1:0127 57            PUSH    DI
15A1:0128 89D9          MOV     CX,BX
15A1:012A AC            LODSB
15A1:012B 08C0          OR      AL,AL
15A1:012D 7402          JZ      0131
15A1:012F AA            STOSB
15A1:0130 4F            DEC     DI
15A1:0131 47            INC     DI
15A1:0132 E2F6          LOOP    012A
15A1:0134 5F            POP     DI
15A1:0135 81C74001      ADD     DI,0140
15A1:0139 89D1          MOV     CX,DX
15A1:013B E2E8          LOOP    0125
15A1:013D 1F            POP     DS
15A1:013E 5D            POP     BP

\/\/\/\\/\/\/\/\/\/\/\/\/\/\/\/\\/\/\/\\/\/\/\\/\/\\/\/\/\\/\
NEW PPIMG (SEGSUM,OFFSUM,SEGTUJ,X,Y)
            16     12     0E   A  6
PUSH BP
MOV BP,SP
PUSH DS

LDS SI,[BP+06]
LODSW
MOV DI,AX
SHL DI,1
SHL DI,1
ADD DI,AX
SHL DI,1
SHL DI,1
SHL DI,1
SHL DI,1
SHL DI,1
SHL DI,1
LDS SI,[BP+0A]
LODSW
ADD DI,AX
LDS SI,[BP+0E]
MOV ES,[SI]
---------------------------------------
LDS SI,[BP+12]
LODSW
LDS SI,[BP+16]
MOV DS,[SI]
MOV SI,AX
---------------------------------------
LODSW
MOV BX,AX
LODSW
MOV CX,AX
MOV DX,BX

KOLOM:13A
 LODSB
 CMP AL,00
 JZ LEWAT
 STOSB
 DEC DI

LEWAT:141
 INC DI
 DEC DX
 JZ BARIS
 JMP KOLOM

BARIS:147
 DEC CX
 JZ SELESAI
 MOV DX,BX
 SUB DI,BX
 ADD DI,140
 JMP KOLOM

SELESAI:14
POP DS
POP BP
RET
