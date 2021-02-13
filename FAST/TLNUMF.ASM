syntax tlnumf(handler%,num,banyak)

PUSH    BP
MOV     BP,SP
PUSH    DS

LDS     SI,[BP+06]
MOV     CX,[SI]
LDS     SI,[BP+0E]
MOV     BX,[SI]
LDS     DX,[BP+0A]
MOV     AH,40
INT     21

POP     DS
POP     BP
