IDEAL
CODESEG

proc mainCalculation
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	
	
	
	
	
	
	
	mov ax, mx
	mov mxPast, ax
	mov ax, my
	mov myPast, ax
	
	mov al, [keyCodePlayer]
	
	cmp al, 80h
	JZ playerAct80h
	cmp al, 0001b
	JZ playerAct0001b
	cmp al, 0010b
	JZ playerAct0010b
	cmp al, 0100b
	JZ playerAct0100b
	cmp al, 1000b
	JZ playerAct1000b
	
playerAct80h:
	mov [actionCodePlayer], 80h ; do nothing
	jmp endPlayerCal
playerAct0001b:
	mov [actionCodePlayer], 0001b ; go up
	dec my
	jmp endPlayerCal
playerAct0010b:
	mov [actionCodePlayer], 0010b ; go left
	dec mx
	jmp endPlayerCal
playerAct0100b:
	mov [actionCodePlayer], 0100b ; go down
	inc my
	jmp endPlayerCal
playerAct1000b:
	mov [actionCodePlayer], 1000b ; go right
	inc mx
	
	
endPlayerCal:

	mov ax, [xEnemy]
	mov [xEnemyPast], ax
	mov ax, [yEnemy]
	mov [yEnemyPast], ax
	
	mov al, [keyCodeEnemy]
	
	cmp al, 80h
	JZ enemyAct80h
	cmp al, 0001b
	JZ enemyAct0001b
	cmp al, 0010b
	JZ enemyAct0010b
	cmp al, 0100b
	JZ enemyAct0100b
	cmp al, 1000b
	JZ enemyAct1000b
	
enemyAct80h:
	mov [actionCodeEnemy], 80h ; do nothing
	jmp endEnemyCal
enemyAct0001b:
	mov [actionCodeEnemy], 0001b ; go up
	dec [yEnemy]
	jmp endEnemyCal
enemyAct0010b:
	mov [actionCodeEnemy], 0010b ; go left
	dec [xEnemy]
	jmp endEnemyCal
enemyAct0100b:
	mov [actionCodeEnemy], 0100b ; go down
	inc [yEnemy]
	jmp endEnemyCal
enemyAct1000b:
	mov [actionCodeEnemy], 1000b ; go right
	inc [xEnemy]
	
endEnemyCal:






	pop ax
	pop bp
	ret
endp mainCalculation