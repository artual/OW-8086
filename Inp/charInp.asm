;	this file has the first step in the loop, the input.
;	
;	the player gets the input from the keyboard and the enemy from
;	their position compared to the player's.
;	
;	
;	
;	
;	
;	
IDEAL

par5 equ [bp + 10]
par4 equ [bp + 8]
par3 equ [bp + 6]
par2 equ [bp + 4]
par1 equ [bp + 2]

CODESEG

;----------------------------------------------------------------------------------------------------|
;                         Player                                                                     |
;____________________________________________________________________________________________________|

; gets nothing
; returns key code in al
proc playerInput
	push bp
	mov bp, sp
	inc bp
	inc bp
	push bx
	push cx
	push dx
	push si
	push di
	
startPlayerInput:
	
	mov ah, 1
	int 16h
	JZ playerKey80h
	mov ah, 0h
	int 16h
	
	cmp ah, 11h ; 11h = W
	JZ playerKey0001b
	cmp ah, 1eh ; 1eh = A
	JZ playerKey0010b
	cmp ah, 1fh ; 1fh = S
	JZ playerKey0100b
	cmp ah, 20h ; 20h = D
	JZ playerKey1000b
	JMP startPlayerInput
	
playerKey80h:
	mov ax, 80h
	jmp endPlayerInput
playerKey0001b:
	mov ax, 0001b
	jmp endPlayerInput
playerKey0010b:
	mov ax,0010b
	jmp endPlayerInput
playerKey0100b:
	mov ax, 0100b
	jmp endPlayerInput
playerKey1000b:
	mov ax, 1000b
	
endPlayerInput:
	
	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop bp
	ret
endp playerInput


;----------------------------------------------------------------------------------------------------|
;                         Enemy                                                                      |
;____________________________________________________________________________________________________|

; gets player's x, player's y, it's x, it's y
; returns key code in al
proc enemyInput
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
	mov ax, 80h
	jmp endEnemyInput
enemyAction0001b:
	mov ax, 0001b
	jmp endEnemyInput
enemyAction0010b:
	mov ax, 0010b
	jmp endEnemyInput
enemyAction0100b:
	mov ax, 0100b
	jmp endEnemyInput
enemyAction1000b:
	mov ax, 1000b

endEnemyInput:
	
	pop bx
	pop bp
	ret 8
endp enemyInput
















