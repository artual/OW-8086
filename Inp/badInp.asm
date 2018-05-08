IDEAL

par5 equ [bp + 10]
par4 equ [bp + 8]
par3 equ [bp + 6]
par2 equ [bp + 4]
par1 equ [bp + 2]

CODESEG
	
; gets nothing
; puts in al the right keyCode
proc enemyInput
	push bp
	mov bp, sp
	inc bp
	inc bp
	push es
	
	mov ax, 40h
	mov es, ax
	mov ax, clock
	cmp ax, [tempClock]
	JZ notTimeYet
	
	mov [tempClock], ax
	push mx
	push my
	push [xCords + 2]
	push [yCords + 2]
	call evilAlgo
	jmp endEnemyInput
	
notTimeYet:
	mov al, 80h
	
endEnemyInput:
	
	push es
	pop bp
	ret
endp enemyInput

; gets mx, my, enemyX, enemyY
; returns key code in al
proc evilAlgo
	push bp
	mov bp, sp
	inc bp
	inc bp
	push bx
	
	mov ax, par3
	mov bx, par1
	cmp ax, bx
	JE yOfCharsEqual
	JG enemyAction0100b ; down
	JL enemyAction0001b ; up
	
yOfCharsEqual:
	mov ax, par4
	mov bx, par2
	cmp ax, bx
	JE enemyAction80h
	JG enemyAction1000b ; right
	JL enemyAction0010b ; left
	
enemyAction80h:
	mov al, 80h
	jmp endEvilAlgo
enemyAction0001b:
	mov al, 0001b
	jmp endEvilAlgo
enemyAction0010b:
	mov al, 0010b
	jmp endEvilAlgo
enemyAction0100b:
	mov al, 0100b
	jmp endEvilAlgo
enemyAction1000b:
	mov al, 1000b

endEvilAlgo:
	
	pop bx
	pop bp
	ret 8
endp evilAlgo