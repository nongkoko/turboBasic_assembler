By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
syntax: call gsrkn(integer%, jumlah%)
15A1:0100 55            PUSH    BP
15A1:0101 89E5          MOV     BP,SP
15A1:0103 1E            PUSH    DS
15A1:0104 C5760A        LDS     SI,[BP+0A]
15A1:0107 AD            LODSW
15A1:0108 C57606        LDS     SI,[BP+06]
15A1:010B 8B0C          MOV     CX,[SI]
15A1:010D F3            REPZ
15A1:010E D1E0          SHL     AX,1
15A1:0110 C47E0A        LES     DI,[BP+0A]
15A1:0113 AB            STOSW
15A1:0114 1F            POP     DS
15A1:0115 5D            POP     BP
