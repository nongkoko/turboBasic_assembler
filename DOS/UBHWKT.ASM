By: Livan
Kamu harus mengkredit nama saya bila gunain asm ini
(jam,menit,detik,perseratusdetik)
15A1:0100 55            PUSH    BP
15A1:0101 89E5          MOV     BP,SP
15A1:0103 1E            PUSH    DS
15A1:0104 C57606        LDS     SI,[BP+06]
15A1:0107 8A14          MOV     DL,[SI]
15A1:0109 C5760A        LDS     SI,[BP+0A]
15A1:010C 8A34          MOV     DH,[SI]
15A1:010E C5760E        LDS     SI,[BP+0E]
15A1:0111 8A0C          MOV     CL,[SI]
15A1:0113 C57612        LDS     SI,[BP+12]
15A1:0116 8A2C          MOV     CH,[SI]
15A1:0118 B42D          MOV     AH,2D
15A1:011A CD21          INT     21
15A1:011C 1F            POP     DS
15A1:011D 5D            POP     BP
