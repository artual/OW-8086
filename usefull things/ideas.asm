a proc on standby:

proc prc
	push bp
	mov bp, sp
	inc bp
	inc bp
	
	mov registers, [wordptrs 1]
	jmp [wordptr 2]
	
label1:
;
;
;
;
;
;
;
;
;
;
	cmp cx, 0h
	JZ
	mov [wordptr 2], label2
	ret
label2:

