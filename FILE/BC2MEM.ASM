By: Livan di Jakarta pada saat PKL
jika anda ingin menggunakannya anda
harus menyertakan nama saya pada credit anda
syntax BC2MEM (no_handler,seg,off,banyak)
banyak dalam byte
15A1:0100 55            PUSH    BP
15A1:0101 89E5          MOV     BP,SP
15A1:0103 1E            PUSH    DS
15A1:0104 C57612        LDS     SI,[BP+12]
15A1:0107 8B1C          MOV     BX,[SI]
15A1:0109 C5760A        LDS     SI,[BP+0A]
15A1:010C 8B14          MOV     DX,[SI]
15A1:010E C57606        LDS     SI,[BP+06]
15A1:0111 8B0C          MOV     CX,[SI]
15A1:0113 C5760E        LDS     SI,[BP+0E]
15A1:0116 8E1C          MOV     DS,[SI]
15A1:0118 B8003F        MOV     AX,3F00
15A1:011B CD21          INT     21
15A1:011D 1F            POP     DS
15A1:011E 5D            POP     BP
