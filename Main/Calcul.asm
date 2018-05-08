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
	xor bx, bx
resetActLoop:
	mov [actionCodes + bx], 0h
	
	mov ax, [xCords + bx]
	mov [xCordsPast + bx], ax
	mov ax, [yCords + bx]
	mov [yCordsPast + bx], ax
	
	inc bx
	inc bx
	cmp bx, 4h
	JNZ resetActLoop
	
	
	
	
	; calculate the punches
	xor bx, bx
punchingCals:
	push bx
	call charPunchCheck
	
	inc bx
	inc bx
	cmp bx, 4h
	JNZ punchingCals
	
	
	
	
	; calculate the movements
	xor bx, bx
mvmActions:
	
	cmp [actionCodes + bx], 5h
	JZ notMvmActions
	cmp [actionCodes + bx], 6h
	JZ notMvmActions
	
	push bx
	call charMvmCal
	
notMvmActions:
	
	inc bx
	inc bx
	cmp bx, 4h
	JNZ mvmActions
	
	
	
	
	
	
	
	
	
	
	

	
	pop bx
	pop ax
	pop bp
	ret
endp mainCalculation