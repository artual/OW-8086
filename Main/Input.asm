




IDEAL
CODESEG

proc mainInput
push bp
mov bp, sp
inc bp
inc bp
push ax
push es




heroInput:
	
	call playerInput
	mov [keyCodePlayer], al
	
	
evilInput:
	
	mov ax, 40h
	mov es, ax
	mov ax, clock
	cmp ax, [tempClock]
	JZ notTimeYet
	
	mov [tempClock], ax
	push mx
	push my
	push [xEnemy]
	push [yEnemy]
	call enemyInput
	mov [keyCodeEnemy], al
	jmp endEvilInput
	
notTimeYet:
	mov [keyCodeEnemy], 80h
	
endEvilInput:
	


	
	pop es
	pop ax
	pop bp
	ret
endp mainInput