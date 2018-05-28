IDEAL
DATASEG

message db "The enemy got hit", 10, 13, '$'

CODESEG

; gets objectNumber
proc gettingHit
	push bp
	mov bp, sp
	inc bp
	inc bp
	
	mov bx, par1
	
	mov [word ptr keyCode + bx], 100000b
	mov [word ptr actionCode + bx], 6
	
	
	
	
	pop bp
	ret 2
endp gettingHit






proc gettingHitAni

	mov ax, 2h
	int 10h
	
	mov dx, offset message
	mov ah, 9h
	int 21h
	
	mov ax, 4c00h
	int 21h
	
endp gettingHitAni