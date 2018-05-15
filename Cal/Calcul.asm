IDEAL
CODESEG

proc mainCalculation
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	push bx
	
	
	
	
	; mov 0 to all action codes and reset past coordinates
	; {
	xor bx, bx
resetActLoop:
	cmp [word ptr aniStatus + bx], 1h
	JZ endResetActLoop
	
	mov [word ptr actionCode + bx], 0h
	
	mov ax, [xCords + bx]
	mov [xCordsPast + bx], ax
	mov ax, [yCords + bx]
	mov [yCordsPast + bx], ax
	
endResetActLoop:
	inc bx
	inc bx
	cmp bx, 4h
	JNZ resetActLoop
	; }
	
	
	
	
	
	
	


xor bx, bx
mainCalculationLoop:
	
	
	push bx
	call charMvmCal
	
	
	

	inc bx
	inc bx
	cmp bx, 4h
	JNZ mainCalculationLoop



	pop bx
	pop ax
	pop bp
	ret
endp mainCalculation