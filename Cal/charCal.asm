IDEAL
CODESEG



; gets the number of object. (0 = player, 2 = enemy1, 4 = enemy2...)
; calculates movement into actionCode and calculates new x, y
proc charMvmCal ; 020c
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	push bx
	push dx
	push si
	push di
	
	mov bx, par1
	
	mov dx, 0h
	
	cmp [word ptr keyCode + bx], 80h
	JNZ moveRightORLeftCal
	mov dx, 80h
	jmp endMvmCal
	
	
moveRightORLeftCal:
	mov ax, [keyCode + bx]
	and ax, 1010b
	
	mov si, 3
	mov di, 4
	
	cmp ax, 0010b
	JZ moveLeftCal
	cmp ax, 1000b
	JZ moveRightCal
	mov si, 1
	mov di, 3
	JMP moveDownORUpCal
	
moveLeftCal:
	add dx, 2
	dec [word ptr xCords + bx]
	mov [word ptr facing + bx], 1
	jmp moveDownORUpCal
	
moveRightCal:
	add dx, 4
	inc [word ptr xCords + bx]
	mov [word ptr facing + bx], 0
	
	
moveDownORUpCal:
	mov ax, [keyCode + bx]
	and ax, 0101b
	
	cmp ax, 0001b
	JZ moveUpCal
	cmp ax, 0100b
	JZ moveDownCal
	JMP endMvmCal
	
moveUpCal:
	add dx, si
	dec [word ptr yCords + bx]
	jmp endMvmCal
moveDownCal:
	add dx, di
	inc [word ptr yCords + bx]
	jmp endMvmCal
	
	
	
	
	
	
	; mov ax, [keyCode + bx]
	
	
	; cmp ax, 80h
	; JZ mvmAct80h
	; cmp ax, 0001b
	; JZ mvmAct0001b
	; cmp ax, 0010b
	; JZ mvmAct0010b
	; cmp ax, 0100b
	; JZ mvmAct0100b
	; cmp ax, 1000b
	; JZ mvmAct1000b
	
	; cmp ax, 0011b
	; JZ mvmAct0011b
	; cmp ax, 1001b
	; JZ mvmAct1001b
	; cmp ax, 0110b
	; JZ mvmAct0110b
	; cmp ax, 1100b
	; JZ mvmAct1100b
	
	; mov dl, ah
	; add dl, 30h
	; mov ah, 2
	; int 21h
	; mov dl, al
	; add dl, 30h
	; mov ah, 2
	; int 21h
	
	; mov dl, bl
	; add dl, 30h
	; mov ah, 2
	; int 21h
	
	; mov dl, 'b'
	; mov ah, 2
	; int 21h
	
	; mov ax, 4c00h ; NEED TO REMOVE THIS IN THE END PLEAAAAAAAAAAAAAAAAAAAAAAAAAAASE ; ITS TESTINGGG
	; int 21h
	
; mvmAct80h:
	; mov [word ptr actionCode + bx], 80h
	; jmp endMvmCal
	
	
	
	
	
; mvmAct0001b:
	; mov [word ptr actionCode + bx], 1
	; dec [word ptr yCords + bx]
	; jmp endMvmCal
; mvmAct0010b:
	; mov [word ptr actionCode + bx], 2
	; dec [word ptr xCords + bx]
	; mov [word ptr facing + bx], 1
	; jmp endMvmCal
; mvmAct0100b:
	; mov [word ptr actionCode + bx], 3
	; inc [word ptr yCords + bx]
	; jmp endMvmCal
; mvmAct1000b:
	; mov [word ptr actionCode + bx], 4
	; inc [word ptr xCords + bx]
	; mov [word ptr facing + bx], 0
	
	
	
	
endMvmCal:
	mov [actionCode + bx], dx
	
	pop di
	pop si
	pop dx
	pop bx
	pop ax
	pop bp
	ret 2
endp charMvmCal
	
	
	
	
; gets number of object
; sets action codes 5, 6
proc charPunchCheck ; 01B7
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	push bx
	push si
	
	mov bx, par1
	
	mov [word ptr actionCode + bx], 9
	
	
	
	; loop all the possible defending objects
	xor si, si
checkIfGotPunched:
;{
	
	; check if attacking object isnt also the defending object and if the object isnt dead
	cmp [word ptr living + si], 0h
	jz endCheckIfGotPunched
	
	cmp si, bx
	jnz objectAIsntObjectB
	
	inc si
	inc si
	cmp si, numberOfObjectsNow
	JNZ checkIfGotPunched
	
	; if the attacking object is also the defending ~~AND~~ 
	; its the end of the loop, quit the proc
	jmp endCharPunchCheck
	
	; the defending object isnt also the attacking object
objectAIsntObjectB:
	
	; check if the object got punched
	push [facing + bx]
	push [xCords + bx]
	push [yCords + bx]
	push [xCords + si]
	push [yCords + si]
	call punchRangeCheck
	
	; if the object is successfully punched,
	; move to its actionCode and keyCode 6h
	cmp al, 1h
	JNZ endCheckIfGotPunched
	
	push si
	call gettingHit
	
	
	
	

endCheckIfGotPunched:	

	inc si
	inc si
	cmp si, numberOfObjectsNow
	JNZ checkIfGotPunched
;}
	
endCharPunchCheck:
	
	
	pop si
	pop bx
	pop ax
	pop bp
	ret 2
endp charPunchCheck


; gets facing, (x, y) player, (x, y) enemy
; returns answer in al (1 if yes, 0 if no)
proc punchRangeCheck ; 0202
	push bp
	mov bp, sp
	inc bp
	inc bp
	push bx
	
	mov bx, par5
	cmp bx, 1
	JZ punchRangeCheckLeft
	
	
	
	; jmp if (xPlayer + 12) < xEnemy
	; if the enemy is 12 right to player
	mov ax, par4
	add ax, 12
	cmp ax, par2
	JL doesntGetPunched
	
	; jmp if (xPlayer - 8) > xEnemy
	; if the enemy is left 8 to player
	mov ax, par4
	sub ax, 8
	cmp ax, par2
	JG doesntGetPunched
	
	
	
	JMP punchRangeCheckNeut
	
punchRangeCheckLeft:

	; jmp if (xPlayer + 8) < xEnemy
	; if the enemy is 8 right to player
	mov ax, par4
	add ax, 8
	cmp ax, par2
	JL doesntGetPunched
	
	; jmp if (xPlayer - 12) > xEnemy
	; if the enemy is left 12 to player
	mov ax, par4
	sub ax, 12
	cmp ax, par2
	JG doesntGetPunched
	
	
	
	
punchRangeCheckNeut:
	; jmp if (yPlayer + 8) < yEnemy
	; if the enemy is 8 below player
	mov ax, par3
	add ax, 8
	cmp ax, par1
	JL doesntGetPunched
	
	; jmp if (yPlyaer - 8) > yEnemy
	; if the enemy is 8 above player
	mov ax, par3
	sub ax, 8
	cmp ax, par1
	JG doesntGetPunched
	
	
doesGetPunched:
	mov al, 1
	pop bx
	pop bp
	ret 10
	
doesntGetPunched:
	mov al, 0
	pop bx
	pop bp
	ret 10
	
endp punchRangeCheck

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	