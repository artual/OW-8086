IDEAL
	include 'Ani\text\data.asm'
	
	
CODESEG


proc mainAnimation
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	push bx
	push dx
	
	mov dx, offset screen
	mov ah, 9h
	int 21h
	
	mov bx, 0h
mainAnimationLoop:
	
	
	
	mov [objectNumIW4], bl
	add [objectNumIW4], 30h
	
	mov ax, [living + bx]
	add al, 30h
	mov [livingIW4], al
	
	mov ax, [keyCode + bx]
	add al, 30h
	mov [keyCodesIW4], al
	
	
	mov ax, [actionCode + bx]
	add al, 30h
	mov [actionCodesIW4], al
	
	mov ax, [xCords + bx]
	mov dx, ax
	and ax, 0f0fh
	add ax, 3030h
	mov [xCordsIW4], ah
	mov [xCordsIW456], al
	shr dl, 4
	add dl, 30h
	mov [xCordsIW45], dl
	
	mov ax, [xCordsPast + bx]
	mov dx, ax
	and ax, 0f0fh
	add ax, 3030h
	mov [xCordsPastIW4], ah
	mov [xCordsPastIW456], al
	shr dl, 4
	add dl, 30h
	mov [xCordsPastIW45], dl
	
	jmp mainAnimationLoop2
mainAnimationLoop1:
	jmp mainAnimationLoop
mainAnimationLoop2:
	
	mov ax, [yCords + bx]
	mov dx, ax
	and ax, 0f0fh
	add ax, 3030h
	mov [yCordsIW4], ah
	mov [yCordsIW456], al
	shr dl, 4
	add dl, 30h
	mov [yCordsIW45], dl
	
	mov ax, [yCordsPast + bx]
	mov dx, ax
	and ax, 0f0fh
	add ax, 3030h
	mov [yCordsPastIW4], ah
	mov [yCordsPastIW456], al
	shr dl, 4
	add dl, 30h
	mov [yCordsPastIW45], dl
	
	mov ax, [charClock + bx]
	mov dx, ax
	and ax, 0f0fh
	add ax, 3030h
	mov [charClockIW4], ah
	mov [charClockIW456], al
	shr dx, 4
	and dx, 0f0fh
	add dx, 3030h
	mov [charClockIW45], dh
	mov [charClockIW4567], dl
	
	
	
	
	mov dx, offset objectNumIW1
	mov ah, 9h
	int 21h
	
	
	
	
	inc bx
	inc bx
	cmp bx, numberOfObjectsNow
	JNZ mainAnimationLoop1
	
	
	
	pop dx
	pop bx
	pop ax
	pop bp
	ret
endp mainAnimation