By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
mendapatkan suatu word dari segmen:offset
call peekw (segmen, offset, variable word)

15A1:0100 55            PUSH    BP
15A1:0101 89E5          MOV     BP,SP
15A1:0103 1E            PUSH    DS
15A1:0104 C5760A        LDS     SI,[BP+0A]
15A1:0107 8B14          MOV     DX,[SI]
15A1:0109 C5760E        LDS     SI,[BP+0E]
15A1:010C 8B1C          MOV     BX,[SI]
15A1:010E 8EDB          MOV     DS,BX
15A1:0110 89D6          MOV     SI,DX
15A1:0112 AD            LODSW
15A1:0113 1F            POP     DS
15A1:0114 C47E06        LES     DI,[BP+06]
15A1:0117 AB            STOSW
15A1:0118 5D            POP     BP
