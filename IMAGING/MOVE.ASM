By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
sub move(segsum, offsum, segtuj, offtuj, banyak word)
15A1:0100 55            PUSH    BP
15A1:0101 89E5          MOV     BP,SP
15A1:0103 1E            PUSH    DS
15A1:0104 C57606        LDS     SI,[BP+06]
15A1:0107 8B0C          MOV     CX,[SI]
15A1:0109 C5760A        LDS     SI,[BP+0A]
15A1:010C 8B3C          MOV     DI,[SI]
15A1:010E C5760E        LDS     SI,[BP+0E]
15A1:0111 8E04          MOV     ES,[SI]
15A1:0113 C57612        LDS     SI,[BP+12]
15A1:0116 8B1C          MOV     BX,[SI]
15A1:0118 C57616        LDS     SI,[BP+16]
15A1:011B 8B14          MOV     DX,[SI]
15A1:011D 8EDA          MOV     DS,DX
15A1:011F 89DE          MOV     SI,BX
15A1:0121 F3            REPZ
15A1:0122 A5            MOVSW
15A1:0123 1F            POP     DS
15A1:0124 5D            POP     BP
