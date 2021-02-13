;call tpfil(handler%)

.model tiny
.code
.186
	org 100h
	PUSH    BP
	MOV     BP,SP
	PUSH    DS

	lds si,[bp+06]
	mov bx,[si]
	mov ah,3eh
	INT     21h
	POP     DS
	POP     BP
.end
