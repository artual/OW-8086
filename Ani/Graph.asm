IDEAL
CODESEG

proc mainAnimation ; 0255
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
	
	
	; if the key isn't between 1, 4 (Mvm), jmp
actionCodeNOT80h:
	cmp ax, 4
	JG actionCodeBIG4
	
	push [actionCode + bx]
	push [colorObject + bx]
	push [xCordsPast + bx]
	push [yCordsPast + bx]
	call charMvmAni
	
	jmp endMainAnimationLoop
	
actionCodeBIG4:
	cmp ax, 5
	JG actionCodeBIG5
	
	JMP endMainAnimationLoop ; REMOVE THIS ONCE THE FIGHTING ANIMATION IS DONE
	
	push bx
	call givePunch
	
	jmp endMainAnimationLoop
	
actionCodeBIG5:
	cmp ax, 6
	JG actionCodeBIG6
	
	call gettingHitAni
	
	jmp endMainAnimationLoop
	
actionCodeBIG6:
	cmp ax, 7
	JG actionCodeBIG7
	
	mov dl, 'a'
	mov ah, 2
	int 21h
	mov ax, 4c00h ; NEED TO REMOVE THIS IN THE END PLEAAAAAAAAAAAAAAAAAAAAAAAAAAASE ; ITS TESTINGGG
	int 21h
	
	jmp endMainAnimationLoop
	
	
	
actionCodeBIG7:
	
endMainAnimationLoop:
	
	inc bx
	inc bx
	cmp bx, 4h
	JNZ mainAnimationLoop
	
	
	
	pop bx
	pop ax
	pop bp
	ret
endp mainAnimation