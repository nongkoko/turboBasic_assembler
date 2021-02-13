By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
SYNTAX SETPAL(COLORNUMBER,R,G,B)
15A1:0100 55            PUSH    BP
15A1:0101 89E5          MOV     BP,SP
15A1:0103 1E            PUSH    DS
15A1:0104 C57612        LDS     SI,[BP+12]
15A1:0107 8A04          MOV     AL,[SI]
15A1:0109 BAC803        MOV     DX,03C8
15A1:010C EE            OUT     DX,AL
15A1:010D BAC903        MOV     DX,03C9
15A1:0110 C5760E        LDS     SI,[BP+0E]
15A1:0113 8A04          MOV     AL,[SI]
15A1:0115 EE            OUT     DX,AL
15A1:0116 C5760A        LDS     SI,[BP+0A]
15A1:0119 8A04          MOV     AL,[SI]
15A1:011B EE            OUT     DX,AL
15A1:011C C57606        LDS     SI,[BP+06]
15A1:011F 8A04          MOV     AL,[SI]
15A1:0121 EE            OUT     DX,AL
15A1:0122 1F            POP     DS
15A1:0123 5D            POP     BP
