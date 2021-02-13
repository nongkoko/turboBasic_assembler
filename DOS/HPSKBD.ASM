By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
15A1:0100 55            PUSH    BP
15A1:0101 89E5          MOV     BP,SP
15A1:0103 1E            PUSH    DS
15A1:0104 C57606        LDS     SI,[BP+06]
15A1:0107 8A04          MOV     AL,[SI]
15A1:0109 B40C          MOV     AH,0C
15A1:010B CD21          INT     21
15A1:010D 1F            POP     DS
15A1:010E 5D            POP     BP
