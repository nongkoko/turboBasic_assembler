By: Livan di Jakarta pada saat PKL
jika anda ingin menggunakannya anda
harus menyertakan nama saya pada credit anda

Syntax ABLTGL (tgl,bulan,tahun)
15A1:0100 55            PUSH    BP
15A1:0101 89E5          MOV     BP,SP
15A1:0103 1E            PUSH    DS
15A1:0104 B42A          MOV     AH,2A
15A1:0106 CD21          INT     21
15A1:0108 C47E0E        LES     DI,[BP+0E]
15A1:010B 88D0          MOV     AL,DL
15A1:010D AA            STOSB
15A1:010E C47E0A        LES     DI,[BP+0A]
15A1:0111 88F0          MOV     AL,DH
15A1:0113 AA            STOSB
15A1:0114 C47E06        LES     DI,[BP+06]
15A1:0117 89C8          MOV     AX,CX
15A1:0119 AB            STOSW
15A1:011A 1F            POP     DS
15A1:011B 5D            POP     BP