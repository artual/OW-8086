

IDEAL
CODESEG

proc mainInput
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	push bx
	push es



	xor bx, bx
mainInputLoop:
	cmp [word ptr living + bx], 0
	jz endmainInputLoop
	
	cmp bx, 0h
	JNZ evilInputs
	
	
	; mov ax, 40h
	; mov es, ax
	; mov ax, clock
	; cmp ax, [charClock + bx]
	; JZ notTimeYet
	
	; push bx
	call playerInput
	mov [keyCode + bx], ax
	jmp endmainInputLoop
	
	
evilInputs:
	
	mov ax, 40h
	mov es, ax
	mov ax, clock
	cmp ax, [charClock + bx]
	JZ notTimeYet
	
	mov [charClock + bx], ax
	
	push [facing + bx]
	push [xCords + 0h]
	push [yCords + 0h]
	push [xCords + bx]
	push [yCords + bx]
	call enemyInput
	mov [keyCode + bx], ax
	jmp endmainInputLoop
	
notTimeYet:
	mov [word ptr keyCode + bx], 80h
	
endmainInputLoop:
	
	inc bx
	inc bx
	cmp bx, numberOfObjectsNow
	JNZ mainInputLoop
	
	

	
	pop es
	pop bx
	pop ax
	pop bp
	ret
endp mainInput