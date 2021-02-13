By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
call gtdir(dir$)
dir$ = secukupnya huruf ternyata 64

15A1:0100 55            PUSH    BP            'save
15A1:0101 89E5          MOV     BP,SP         'ok
15A1:0103 1E            PUSH    DS            'save
15A1:0104 8B1E0000      MOV     BX,[0000]     'bx adalah string segment
15A1:0108 C57606        LDS     SI,[BP+06]    'ds si menunjuk pada par paling kanan pertama
15A1:010B 8B7402        MOV     SI,[SI+02]    'si adalah string offset
15A1:010E B80047        MOV     AX,4700       'ax 47 layanan untuk cur dir$
15A1:0111 8EDB          MOV     DS,BX         'ds
15A1:0113 BA0000        MOV     DX,0000       'dan dx mengarah pada string parameter paling kanan
15A1:0116 CD21          INT     21            'lakukan
15A1:0118 1F            POP     DS            'load
15A1:0119 5D            POP     BP            'load
