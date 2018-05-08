




IDEAL
CODESEG

proc mainInput
push bp
mov bp, sp
inc bp
inc bp
push ax




heroInput:
	
	call playerInput
	mov [keyCodes], al
	
	
evilInput:
	
	call enemyInput
	mov [keyCodes + 2], al
	


	
	pop ax
	pop bp
	ret
endp mainInput