By: Livan gratis
Kamu harus mengkredit nama gwa di program lo
SYNTAX CALL BS2P640(SEGSUM,OFFSUM,SEGTUJ,OFFTUJ,WARNA,BANYAK)
15A1:0100 55            PUSH    BP
15A1:0101 89E5          MOV     BP,SP
15A1:0103 1E            PUSH    DS
15A1:0104 C57606        LDS     SI,[BP+06]
15A1:0107 8B14          MOV     DX,[SI]
15A1:0109 C5760A        LDS     SI,[BP+0A]
15A1:010C 8A24          MOV     AH,[SI]
15A1:010E C5760E        LDS     SI,[BP+0E]
15A1:0111 8B3C          MOV     DI,[SI]
15A1:0113 C57612        LDS     SI,[BP+12]
15A1:0116 8E04          MOV     ES,[SI]
15A1:0118 C57616        LDS     SI,[BP+16]
15A1:011B 8B0C          MOV     CX,[SI]
15A1:011D C5761A        LDS     SI,[BP+1A]
15A1:0120 8B1C          MOV     BX,[SI]
15A1:0122 8EDB          MOV     DS,BX
15A1:0124 89CE          MOV     SI,CX
15A1:0126 89D1          MOV     CX,DX
15A1:0128 FC            CLD
15A1:0129 89CA          MOV     DX,CX
15A1:012B 57            PUSH    DI
15A1:012C AC            LODSB
15A1:012D B301          MOV     BL,01
15A1:012F B90800        MOV     CX,0008
15A1:0132 50            PUSH    AX
15A1:0133 88C7          MOV     BH,AL
15A1:0135 20DF          AND     BH,BL
15A1:0137 7404          JZ      013D
15A1:0139 88E0          MOV     AL,AH
15A1:013B AA            STOSB
15A1:013C 4F            DEC     DI
15A1:013D 81C74001      ADD     DI,0280
15A1:0141 58            POP     AX
15A1:0142 D0E3          SHL     BL,1
15A1:0144 E2EC          LOOP    0132
15A1:0146 5F            POP     DI
15A1:0147 47            INC     DI
15A1:0148 89D1          MOV     CX,DX
15A1:014A E2DD          LOOP    0129
15A1:014C 1F            POP     DS
15A1:014D 5D            POP     BP
