IDEAL
CODESEG









proc mainGathering
	push bp
	mov bp, sp
	inc bp
	inc bp
	push bx
	
	
	xor bx, bx
mainGatheringLoop:
	
	push bx
	call managingLife
	
	
	inc bx
	inc bx
	cmp bx, numberOfObjectsNow
	jne mainGatheringLoop
	
	pop bx
	pop bp
	ret
endp mainGathering
	
	
	
; gets objectNumber
proc managingLife
	push bp
	mov bp, sp
	inc bp
	inc bp
	push bx
	
	mov bx, par1
	
	cmp [word ptr actionCode + bx], 10
	jne keepAlive
	
	dec [word ptr living + bx]
	mov [word ptr actionCode + bx], 80h
	mov [word ptr aniStatus + bx], 0h
	
keepAlive:
	
	pop bx
	pop bp
	ret 2
endp managingLife
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	