IDEAL
CODESEG


; gets facing, (x, y) it's, (x, y) player
; returns answer in al (1 if yes, 0 if no)
proc punchOrMove ; 0e3
	push bp
	mov bp, sp
	inc bp
	inc bp
	push bx
	
	mov bx, par5
	cmp bx, 1
	JZ punchOrMoveLeft
	
	
	
	; jmp if (xPlayer + 14) < xEnemy
	; if the enemy is 14 right to player
	mov ax, par4
	add ax, 14
	cmp ax, par2
	JL dontPunch_Move
	
	; jmp if (xPlayer - 10) > xEnemy
	; if the enemy is left 10 to player
	mov ax, par4
	sub ax, 10
	cmp ax, par2
	JG dontPunch_Move
	
	
	
	
	JMP punchOrMoveNeut
	
punchOrMoveLeft:
	
	
	
	; jmp if (xPlayer + 10) < xEnemy
	; if the enemy is 10 right to player
	mov ax, par4
	add ax, 10
	cmp ax, par2
	JL dontPunch_Move
	
	; jmp if (xPlayer - 14) > xEnemy
	; if the enemy is left 14 to player
	mov ax, par4
	sub ax, 14
	cmp ax, par2
	JG dontPunch_Move
	
	
	
	
punchOrMoveNeut:
	
	; jmp if (yPlayer + 10) < yEnemy
	; if the enemy is 10 below player
	mov ax, par3
	add ax, 10
	cmp ax, par1
	JL dontPunch_Move
	
	; jmp if (yPlyaer - 10) > yEnemy
	; if the enemy is 10 above player
	mov ax, par3
	sub ax, 10
	cmp ax, par1
	JG dontPunch_Move
	
	
punch_DontMove:
	mov al, 1
	pop bx
	pop bp
	ret 10
	
	
dontPunch_Move:
	mov al, 0
	pop bx
	pop bp
	ret 10
	
	
endp punchOrMove
	
	
	
	
	
	
	
; gets (x, y) it's, (x, y) player
; returns key code in ax
proc enemyMvmAlgo ; 0144
	push bp
	mov bp, sp
	inc bp
	inc bp
	push bx
	
	
	; push par4
	; push par3
	; push par2
	; push par1
	; call subXOrY
	
	
	mov ax, 80h
	
	
	mov bx, par3
	cmp bx, par1
	JE decideMoveX
	JG enemyAction0100b ; down
	JL enemyAction0001b ; up
	
enemyAction0001b:
	add ax, 0001b
	and ax, 7fh
	JMP decideMoveX
enemyAction0100b:
	add ax, 0100b
	and ax, 7fh
	
	
decideMoveX:
	mov bx, par4
	cmp bx, par2
	JE endEnemyMvmAlgo
	JG enemyAction1000b ; right
	JL enemyAction0010b ; left
	
enemyAction0010b:
	add ax, 0010b
	and ax, 7fh
	jmp endEnemyMvmAlgo
enemyAction1000b:
	add ax, 1000b
	and ax, 7fh
	jmp endEnemyMvmAlgo
	
	




	
	
	
endEnemyMvmAlgo:
	
	pop bx
	pop bp
	ret 8
endp enemyMvmAlgo
	
	
	
	
	
; gets (x, y) it's, (x, y) player
; returns 0 if sub y, 1 if sub x
proc subXOrY
	push bp
	mov bp, sp
	inc bp
	inc bp
	
	
	
	mov ax, par3
	sub ax, par1 ; delta y
	mov bx, 2
	mul bx
	
	mov bx, par4
	sub bx, par2 ; delta x
	
	cmp bx, ax
	JG subTheXCord
	
	mov ax, 0
	pop bp
	ret 8
	
	
subTheXCord:
	mov ax, 1
	pop bp
	ret 8
	
endp subXOrY
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	