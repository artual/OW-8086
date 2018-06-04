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

; gets charNum
; returns key code in al
proc playerInput ; 006c
	push bp
	mov bp, sp
	inc bp
	inc bp
	push bx
	push es
	
startPlayerInput:
	
	; mov ah, 7h
	; int 21h
	
	; cmp al, 77h ; ascci 77h
	; JZ playerKey00001b
	; cmp al, 61h ; ascii 61h
	; JZ playerKey00010b
	; cmp al, 73h ; ascii 73h
	; JZ playerKey00100b
	; cmp al, 64h ; ascii 64h
	; JZ playerKey01000b
	; cmp al, 6ah ; ascii 6ah
	; JZ playerKey10000b
	; JMP startPlayerInput
	
	
	mov ah, 1
	int 16h
	JZ playerKey80h
	mov ah, 0h
	int 16h
	
	
	; in al, 64h
	; cmp al, 10b
	; jne newKeyInBuffer
	
	; mov bx, par1
	; push [keyCode + bx]
	; call noNewKey
	; mov ax, 80h
	; jmp endPlayerInput
	
; newKeyInBuffer:
	; mov ax, 40h
    ; mov es, ax                  ;access keyboard data area via segment 40h
    ; mov [word ptr es:1ah], 1eh  ;set the kbd buff head to start of buff
    ; mov [word ptr es:1ch], 1eh  ;set the kbd buff tail to same as buff head
                                ; ;the keyboard typehead buffer is now cleared
	; xor ah, ah
	; in al, 60h
	
	; mov al, 11h
	
	; test al, 80h
	; jz acceptKey
	
	; mov bx, par1
	; mov bx, [lastScanCode + bx]
	; or bl, 80h
	; cmp bl, al
	; je playerKey80h
	; jmp endPlayerInput
	
	
	
	
	
	
; acceptKey:
	
	; mov bx, par1
	; mov [lastScanCode + bx], ax
	
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
	mov ax, 80h
	jmp endPlayerInput
playerKey00001b:
	mov ax, 00001b
	jmp endPlayerInput
playerKey00010b:
	mov ax, 00010b
	jmp endPlayerInput
playerKey00100b:
	mov ax, 00100b
	jmp endPlayerInput
playerKey01000b:
	mov ax, 01000b
	jmp endPlayerInput
playerKey10000b:
	mov ax, 10000b
	jmp endPlayerInput
	
endPlayerInput:
	
	pop es
	pop bx
	pop bp
	ret
endp playerInput


; ; gets previous keyCode
; ; returns new KeyCode in ax
; proc noNewKey
	; push bp
	; mov bp, sp
	; inc bp
	; inc bp
	; push bx
	
	; mov bx, par1
	
	; cmp bx, 80h
	; je resetTo80h
	; cmp bx, 6
	; je resetTo80h
	; cmp bx, 5
	; je resetTo80h
	
	
	; mov ax, bx
	; jmp endNoNewKey
	
; resetTo80h:
	; mov ax, 80h
	
	
; endNoNewKey:
	
	; pop bx
	; pop bp
	; ret 2
; endp noNewKey
	
	
;----------------------------------------------------------------------------------------------------|
;                         Enemy                                                                      |
;____________________________________________________________________________________________________|

; gets facing, (x, y) it's, (x, y) player
; returns key code in ax
proc enemyInput ; 0097
	push bp
	mov bp, sp
	inc bp
	inc bp
	push bx
	
	
	
	push par5
	push par4
	push par3
	push par2
	push par1
	call punchOrMove
	
	cmp al, 0
	JZ movingAlgo ; jump if move
	
	; create a random number in bx
	; then do a 1 in 16 chance, if chance is met -
	; - it will punch
	mov ax, 40h
	mov es, ax
	mov bx, clock
	xor bx, [cs:bx]
	
	and bx, 00001111h
	cmp bl, 1
	JNZ movingAlgo
	
	
	mov ax, 10000b ; move ax, keyCode for punch
	JMP endEnemyInput
	
	
movingAlgo:
	
	
	
	
	push par4
	push par3
	push par2
	push par1
	call enemyMvmAlgo
	
	
	
	
	

endEnemyInput:
	
	pop bx
	pop bp
	ret 10
endp enemyInput
















