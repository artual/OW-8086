IDEAL
DATASEG

message db "The enemy got hit", 10, 13, '$'

CODESEG

; gets object number
proc gettingHit
	
	mov ax, 2h
	int 10h
	
	mov dx, offset message
	mov ah, 9h
	int 21h
	
	mov ax, 4c00h
	int 21h
	
endp gettingHit