IDEAL
CODESEG

proc mainCalculation
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	push bx
	
	
	
	
	; ; mov 0 to all action codes and reset past coordinates
	; ; {
	; xor bx, bx
; resetActLoop:
	; cmp [word ptr aniStatus + bx], 1h
	; JZ endResetActLoop
	
	; mov [word ptr actionCode + bx], 0h
	
	; mov ax, [xCords + bx]
	; mov [xCordsPast + bx], ax
	; mov ax, [yCords + bx]
	; mov [yCordsPast + bx], ax
	
; endResetActLoop:
	; inc bx
	; inc bx
	; cmp bx, 4h
	; JNZ resetActLoop
	; ; }
	
	
	; ; calculate the punches
	; ; {
	; xor bx, bx
; punchingCals:
	; cmp [aniStatus + bx], 1h
	; JZ endPunchingCals
	
	; push bx
	; call charPunchCheck ; NEED TO ADD THIS PROC
	
	
; endPunchingCals:
	; inc bx
	; inc bx
	; cmp bx, 4h
	; JNZ punchingCals
	; ; }
	
	
	; ANOTHER VERSION
	
	
	; xor bx, bx
; mainCalculationLoop:

	; mov ax, [xCords + bx]
	; mov [xCordsPast + bx], ax
	; mov ax, [yCords + bx]
	; mov [yCordsPast + bx], ax

	; push bx
	; call charMvmCal
	
	
	; inc bx
	; inc bx
	; cmp bx, 4h
	; JNZ mainCalculationLoop
	
	
	
	; ANOTHER VERSION
	


xor bx, bx
mainCalculationLoop:
	
	; is the object in animation
	cmp [word ptr aniStatus + bx], 1h
	JZ endMainCalculationLoop
	
	; put the cords in old cords
	mov ax, [xCords + bx]
	mov [xCordsPast + bx], ax
	mov ax, [yCords + bx]
	mov [yCordsPast + bx], ax
	
	mov ax, [keyCode + bx]
	
	; if the key isn't between 0, 4 (Mvm), jmp
	cmp ax, 1000b
	JG keyCodeBIG4
	
	push bx
	call charMvmCal
	jmp endMainCalculationLoop
	
keyCodeBIG4:
	
	cmp ax, 10000b
	JG keyCodeBIG5
	
	push bx
	call charPunchCheck
	jmp endMainCalculationLoop
	
keyCodeBIG5:
	
	cmp ax, 100000b
	JG keyCodeBIG6
	
	push bx
	call gettingHit
	
	; mov [word ptr actionCode + bx], 6
	; dec [word ptr living + bx]
	; WHEN ADDING LIVES:
	;
	; this is where the lives are deced.
	; 
	; add here that if the person is dead...
	;
	;
	jmp endMainCalculationLoop
	
keyCodeBIG6:
	
	mov [word ptr actionCode + bx], 80h
	
	
	
	
	
endMainCalculationLoop:
	inc bx
	inc bx
	cmp bx, 4h
	JNZ mainCalculationLoop



	
	pop bx
	pop ax
	pop bp
	ret
endp mainCalculation