By: Livan di Jakarta pada saat PKL
jika anda ingin menggunakannya anda
harus menyertakan nama saya pada credit anda
SYNTAX ABLVKINT(no_int,seg,off)
15A1:0100 55            PUSH    BP
15A1:0101 89E5          MOV     BP,SP
15A1:0103 1E            PUSH    DS
15A1:0104 B435          MOV     AH,35
15A1:0106 C5760E        LDS     SI,[BP+0E]
15A1:0109 8A04          MOV     AL,[SI]
15A1:010B CD21          INT     21
15A1:010D 8CC0          MOV     AX,ES
15A1:010F C47E0A        LES     DI,[BP+0A]
15A1:0112 AB            STOSW
15A1:0113 89D8          MOV     AX,BX
15A1:0115 C47E06        LES     DI,[BP+06]
15A1:0118 AB            STOSW
15A1:0119 1F            POP     DS
15A1:011A 5D            POP     BP