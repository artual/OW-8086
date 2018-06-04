IDEAL
DATASEG

message db " Got hit", 10, 13, '$'

CODESEG

; gets objectNumber
proc gettingHit
	push bp
	mov bp, sp
	inc bp
	inc bp
	push bx
	
	mov bx, par1
	
	mov [word ptr keyCode + bx], 100000b
	mov [word ptr actionCode + bx], 10
	
	
	
	pop bx
	pop bp
	ret 2
endp gettingHit





; gets objectNumber
proc gettingHitAni
	push bp
	mov bp, sp
	inc bp
	inc bp
	push bx
	
	
	push 0
	push 200
	push 320
	push 0
	push 0
	call rectangle
	
	
	xor bx, bx
gettingHitAniLoop:
	cmp [word ptr living + bx], 0
	je endGettingHitAniLoop
	cmp bx, par1
	je endGettingHitAniLoop
	
	push [colorObject + bx]
	push [xCords + bx]
	push [yCords + bx]
	call spawn
	
endGettingHitAniLoop:
	inc bx
	inc bx
	cmp bx, numberOfObjectsNow
	jne gettingHitAniLoop
	
	
	
	
	
	
	
	
	; mov bx, par1
	
	; push 0
	; push [xCords + bx]
	; push [yCords + bx]
	; call spawn
	
	; push 0
	; mov ax, [xCords + bx]
	; add ax, 10
	; push ax
	; mov ax, [yCords + bx]
	; add ax, 2
	; push ax
	; call redDot
	
	; push 0
	; mov ax, [xCords + bx]
	; dec ax
	; push ax
	; mov ax, [yCords + bx]
	; add ax, 2
	; push ax
	; call redDot
	
	
	
	; mov ax, 2h
	; int 10h
	
	; mov dx, par1
	; xor dh, dh
	; add dl, 30h
	; mov ah, 2
	; int 21h
	
	; mov dx, offset message
	; mov ah, 9h
	; int 21h
	
	; mov ax, 4c00h
	; int 21h
	
	pop bx
	pop bp
	ret 2
endp gettingHitAni