IDEAL

par5 equ [bp + 10]
par4 equ [bp + 8]
par3 equ [bp + 6]
par2 equ [bp + 4]
par1 equ [bp + 2]

CODESEG



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
	JZ playerKey00001b
	cmp ah, 1eh ; 1eh = A
	JZ playerKey00010b
	cmp ah, 1fh ; 1fh = S
	JZ playerKey00100b
	cmp ah, 20h ; 20h = D
	JZ playerKey01000b
	cmp ah, 24h ; 24h = J
	JZ playerKey10000b
	JMP startPlayerInput
	
playerKey80h:
	mov al, 80h
	jmp endPlayerInput
playerKey00001b:
	mov al, 00001b
	jmp endPlayerInput
playerKey00010b:
	mov al, 00010b
	jmp endPlayerInput
playerKey00100b:
	mov al, 00100b
	jmp endPlayerInput
playerKey01000b:
	mov al, 01000b
	jmp endPlayerInput
playerKey10000b:
	mov al, 10000b
	
endPlayerInput:
	
	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop bp
	ret
endp playerInput


