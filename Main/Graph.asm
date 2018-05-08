IDEAL
CODESEG

proc mainAnimation
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	
	
	
	
	xor bx, bx
mainGraphLoop:
	
	
	
	inc bx
	inc bx
	cmp bx, 4h
	JE mainGraphLoop
	
	
heroAnimation:
	mov al, [actionCodes + 0h]
	xor ah, ah
	push ax ; actionCode
	push 28h ; char(color)
	push mxPast
	push myPast
	call charMvmAni
	
evilAnimation:
	mov al, [actionCodes + 2h]
	xor ah, ah
	push ax
	push 40h
	push [xCordsPast + 2h]
	push [yCordsPast + 2h]
	call charMvmAni
	
	
	pop ax
	pop bp
	ret
endp mainAnimation