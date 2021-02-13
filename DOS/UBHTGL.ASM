By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
15A1:0100 55            PUSH    BP
15A1:0101 89E5          MOV     BP,SP
15A1:0103 1E            PUSH    DS
15A1:0104 B42B          MOV     AH,2B
15A1:0106 C57606        LDS     SI,[BP+06]
15A1:0109 8B0C          MOV     CX,[SI]
15A1:010B C5760A        LDS     SI,[BP+0A]
15A1:010E 8A34          MOV     DH,[SI]
15A1:0110 C5760E        LDS     SI,[BP+0E]
15A1:0113 8A14          MOV     DL,[SI]
15A1:0115 CD21          INT     21
15A1:0117 1F            POP     DS
15A1:0118 5D            POP     BP
