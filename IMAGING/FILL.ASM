By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
call fill (banyak,word,seg,off)
15A1:0100 55            PUSH    BP
15A1:0101 89E5          MOV     BP,SP
15A1:0103 1E            PUSH    DS
15A1:0104 C57606        LDS     SI,[BP+06]
15A1:0107 8B3C          MOV     DI,[SI]
15A1:0109 C5760A        LDS     SI,[BP+0A]
15A1:010C 8E04          MOV     ES,[SI]
15A1:010E C5760E        LDS     SI,[BP+0E]
15A1:0111 8B04          MOV     AX,[SI]
15A1:0113 C57612        LDS     SI,[BP+12]
15A1:0116 8B0C          MOV     CX,[SI]
15A1:0118 F3            REPZ
15A1:0119 AB            STOSW
15A1:011A 1F            POP     DS
15A1:011B 5D            POP     BP
