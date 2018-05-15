IDEAL
CODESEG

proc mainCalculation
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	push bx
	
	
	
	


xor bx, bx
mainCalculationLoop:


	mov ax, [xCords + bx]
	mov [xCordsPast + bx], ax
	mov ax, [yCords + bx]
	mov [yCordsPast + bx], ax
	
	mov ax, [keyCode + bx]
	
	cmp ax, 80h
	JZ enemyAct80h
	cmp ax, 0001b
	JZ enemyAct0001b
	cmp ax, 0010b
	JZ enemyAct0010b
	cmp ax, 0100b
	JZ enemyAct0100b
	cmp ax, 1000b
	JZ enemyAct1000b
	
enemyAct80h:
	mov [word ptr actionCode + bx], 80h ; do nothing
	jmp endEnemyCal
enemyAct0001b:
	mov [word ptr actionCode + bx], 0001b ; go up
	dec [word ptr yCords + bx]
	jmp endEnemyCal
enemyAct0010b:
	mov [word ptr actionCode + bx], 0010b ; go left
	dec [word ptr xCords + bx]
	jmp endEnemyCal
enemyAct0100b:
	mov [word ptr actionCode + bx], 0100b ; go down
	inc [word ptr yCords + bx]
	jmp endEnemyCal
enemyAct1000b:
	mov [word ptr actionCode + bx], 1000b ; go right
	inc [word ptr xCords + bx]
	
endEnemyCal:

	inc bx
	inc bx
	cmp bx, 4h
	JNZ mainCalculationLoop



	pop bx
	pop ax
	pop bp
	ret
endp mainCalculation