IDEAL
CODESEG

proc mainAnimation ; 0375
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	push bx
	
	
	
	xor bx, bx
mainAnimationLoop:
	
	
	mov ax, [actionCode + bx]
	
	
	cmp ax, 80h
	JZ endMainAnimationLoop
	
	
	; if the key isn't between 1, 8 (Mvm), jmp
actionCodeNOT80h:
	cmp ax, 8
	JG actionCodeBIG4
	
	push [actionCode + bx]
	push [colorObject + bx]
	push [xCordsPast + bx]
	push [yCordsPast + bx]
	call charMvmAni
	
	jmp endMainAnimationLoop
	
actionCodeBIG4:
	cmp ax, 9
	JG actionCodeBIG9
	
	; JMP endMainAnimationLoop ; REMOVE THIS ONCE THE FIGHTING ANIMATION IS DONE
	
	
	push bx
	call givePunch
	
	
	jmp endMainAnimationLoop
	
actionCodeBIG9:
	cmp ax, 10
	JG actionCodeBIG10
	
	push bx
	call gettingHitAni
	
	jmp endMainAnimationLoop
	
actionCodeBIG10:
	cmp ax, 11
	JG actionCodeBIG11
	
	mov dl, 'a'
	mov ah, 2
	int 21h
	mov ax, 4c00h ; NEED TO REMOVE THIS IN THE END PLEAAAAAAAAAAAAAAAAAAAAAAAAAAASE ; ITS TESTINGGG
	int 21h
	
	jmp endMainAnimationLoop
	
	
	
actionCodeBIG11:
	
endMainAnimationLoop:
	
	inc bx
	inc bx
	cmp bx, numberOfObjectsNow
	JNZ mainAnimationLoop
	
	
	
	pop bx
	pop ax
	pop bp
	ret
endp mainAnimation