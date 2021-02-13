By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
call stpss(y,x,page)
15A1:0100 55            PUSH    BP
15A1:0101 89E5          MOV     BP,SP
15A1:0103 1E            PUSH    DS
15A1:0104 C57606        LDS     SI,[BP+06]
15A1:0107 8A3C          MOV     BH,[SI]
15A1:0109 C5760A        LDS     SI,[BP+0A]
15A1:010C 8A14          MOV     DL,[SI]
15A1:010E C5760E        LDS     SI,[BP+0E]
15A1:0111 8A34          MOV     DH,[SI]
15A1:0113 B402          MOV     AH,02
15A1:0115 CD10          INT     10
15A1:0117 1F            POP     DS
15A1:0118 5D            POP     BP
