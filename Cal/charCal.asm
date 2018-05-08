IDEAL

par5 equ [bp + 10]
par4 equ [bp + 8]
par3 equ [bp + 6]
par2 equ [bp + 4]
par1 equ [bp + 2]


CODESEG

; gets the number of object. (0 = player, 2 = enemy1, 4 = enemy2...)
; calculates movement into actionCode and calculates new x, y
proc charMvmCal
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	push bx
	
	
	mov bx, par1
	
	mov al, [keyCodes + bx]
	xor ah, ah
	
	cmp al, 0001b
	JZ charAct0001b
	cmp al, 0010b
	JZ charAct0010b
	cmp al, 0100b
	JZ charAct0100b
	cmp al, 1000b
	JZ charAct1000b
	cmp al, 80h
	JZ charAct80h
	
charAct0001b:
	mov [actionCodes + bx], 0001b ; go up
	dec [yCords + bx]
	jmp endCharMvmCal
charAct0010b:
	mov [actionCodes + bx], 0010b ; go left
	dec [xCords + bx]
	jmp endCharMvmCal
charAct0100b:
	mov [actionCodes + bx], 0100b ; go down
	inc [yCords + bx]
	jmp endCharMvmCal
charAct1000b:
	mov [actionCodes + bx], 1000b ; go right
	inc [xCords + bx]
charAct80h:
	mov [actionCodes + bx], 80h ; stay
	jmp endCharMvmCal
	
endCharMvmCal:



	pop bx
	pop ax
	pop bp
	ret 2
endp charMvmCal

; gets number of object
; sets action codes 5, 6
proc charPunchCheck
	push bp
	mov bp, sp
	inc bp
	inc bp
	push bx
	push si
	
	mov bx, par1
	
	; check if attacking
	cmp [keyCodes + bx], 5h
	JNZ endCharPunchCheck
	
	; put attack action code
	mov [actionCodes + bx], 5h
	
	; loop all the possible defending objects
	mov si, 0h
checkIfGotPunched:
;{
	
	; check if attacking object isnt also the defending object
	cmp si, bx
	JNZ objectAIsntObjectB
	inc si
	inc si
	cmp si, 4h
	JNZ checkIfGotPunched
	
	; if the attacking object is also the defending ~~AND~~ its the end of the loop, quit the proc
	pop si
	pop bx
	pop bp
	ret 2
	
	; the defending object isnt also the attacking object
objectAIsntObjectB:
	
	; check if the object got punched
	push [xCords + bx]
	push [yCords + bx]
	push [xCords + si]
	push [yCords + si]
	call punchRangeCheck
	
	; if the object is successfully punched, move to its action code 6h
	cmp al, 1h
	JNZ endCheckIfGotPunched
	mov [actionCodes + si], 6h

endCheckIfGotPunched:	

	inc si
	inc si
	cmp si, 4h
	JNZ checkIfGotPunched
;}
	
	
	
endCharPunchCheck:
	
	pop si
	pop bx
	pop bp
	ret 2
endp charPunchCheck





































