IDEAL
CODESEG

proc mainAnimation
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	
	
	
	
	
heroAnimation:
	mov al, [actionCodePlayer]
	xor ah, ah
	push ax ; actionCode
	push 28h ; char(color)
	push mxPast
	push myPast
	call charAnimation
	
evilAnimation:
	mov al, [actionCodeEnemy]
	xor ah, ah
	push ax
	push 40h
	push [xEnemyPast]
	push [yEnemyPast]
	call charAnimation
	
	
	
	pop ax
	pop bp
	ret
endp mainAnimation