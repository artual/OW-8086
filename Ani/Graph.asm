IDEAL
CODESEG

proc mainAnimation
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	push bx
	
	
	
	xor bx, bx
mainAnimationLoop:
	
	
	push [actionCode + bx]
	push [colorObject + bx]
	push [xCordsPast + bx]
	push [yCordsPast + bx]
	call charAnimation
	
	inc bx
	inc bx
	cmp bx, 4h
	JNZ mainAnimationLoop
	
	
	
	pop bx
	pop ax
	pop bp
	ret
endp mainAnimation