PUSH    BP
MOV     BP,SP
PUSH    DS
LDS     SI,[BP+06]
MOV     DI,[SI]
LDS     SI,[BP+0A]
MOV     ES,[SI]
LDS     SI,[BP+0E]
MOV     DX,[SI]
LDS     SI,[BP+12]
MOV     BX,[SI]
PUSH    BX
PUSH    DX
LDS     SI,[BP+16]
MOV     DX,[SI]
LDS     SI,[BP+1A]
MOV     BX,[SI]
MOV     SI,DX
MOV     DS,BX
POP     DX
POP     BX
MOV     AX,BX
STOSW
MOV     AX,DX
STOSW
MOV     CX,DX
@1:
MOV     DX,CX
PUSH    SI
MOV     CX,BX
REPZ
MOVSB
POP     SI
ADD     SI,0140
MOV     CX,DX
LOOP    @1:
POP     DS
POP     BP
