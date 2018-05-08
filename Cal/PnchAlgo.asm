IDEAL
CODESEG





; gets (x, y) player, (x, y) enemy
; returns answer in al (1 if yes, 0 if no)
proc punchRangeCheck
	push bp
	mov bp, sp
	inc bp
	inc bp
	
	
	; jmp if (xPlayer + 5) < xEnemy
	mov ax, par4
	add ax, 5
	cmp ax, par2
	JL doesntGetPunched
	
	; jmp if (xPlayer - 5) > xEnemy
	mov ax, par4
	sub ax, 5
	cmp ax, par2
	JG doesntGetPunched
	
	; jmp if (yPlayer + 5) < yEnemy
	mov ax, par3
	add ax, 5
	cmp ax, par1
	JL doesntGetPunched
	
	; jmp if (yPlyaer - 5) > yEnemy
	mov ax, par3
	sub ax, 5
	cmp ax, par1
	JG doesntGetPunched
	
	
doesGetPunched:
	mov al, 1
	pop bp
	ret 8
	
doesntGetPunched:
	mov al, 0
	pop bp
	ret 8
	
endp punchRangeCheck