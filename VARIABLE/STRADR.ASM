By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
call stradr(string, segmen, offset)
15A1:0100 55            PUSH    BP
15A1:0101 89E5          MOV     BP,SP
15A1:0103 1E            PUSH    DS
15A1:0104 3E            DS:
15A1:0105 A10000        MOV     AX,[0000]
15A1:0108 C47E0A        LES     DI,[BP+0A]
15A1:010B AB            STOSW
15A1:010C C5760E        LDS     SI,[BP+0E]
15A1:010F 3E            DS:
15A1:0110 8B4402        MOV     AX,[SI+02]
15A1:0113 C47E06        LES     DI,[BP+06]
15A1:0116 AB            STOSW
15A1:0117 1F            POP     DS
15A1:0118 5D            POP     BP
