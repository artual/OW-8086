IDEAL
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
	
	
	
	mov ax, [keyCode + bx]
	mov [actionCode + bx], ax
	
	
	cmp ax, 80h
	JZ mvmAct80h
	cmp ax, 0001b
	JZ mvmAct0001b
	cmp ax, 0010b
	JZ mvmAct0010b
	cmp ax, 0100b
	JZ mvmAct0100b
	cmp ax, 1000b
	JZ mvmAct1000b
	
	
	
	mov ax, 4c00h ; NEED TO REMOVE THIS IN THE END PLEAAAAAAAAAAAAAAAAAAAAAAAAAAASE ; ITS TESTINGGG
	int 21h
	
mvmAct80h:
	jmp endMvmCal
mvmAct0001b:
	dec [word ptr yCords + bx]
	jmp endMvmCal
mvmAct0010b:
	dec [word ptr xCords + bx]
	jmp endMvmCal
mvmAct0100b:
	inc [word ptr yCords + bx]
	jmp endMvmCal
mvmAct1000b:
	inc [word ptr xCords + bx]
	
endMvmCal:
	
	
	
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
	push ax
	push bx
	push si
	
	mov bx, par1
	
	mov [word ptr actionCode + bx], 0h ; FIX THIS
	
	
	
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
	
	; if the attacking object is also the defending ~~AND~~ 
	; its the end of the loop, quit the proc
	pop si
	pop bx
	pop bp
	ret 2
	
	; the defending object isnt also the attacking object
objectAIsntObjectB:
	
	; check if the object got punched
	push [word ptr xCords + bx]
	push [word ptr yCords + bx]
	push [word ptr xCords + si]
	push [word ptr yCords + si]
	call punchRangeCheck
	
	; if the object is successfully punched,
	; move to its actionCode and keyCode 6h
	cmp al, 1h
	JNZ endCheckIfGotPunched
	mov [word ptr actionCode + si], 0h ; FIX THIS
	mov [word ptr keyCode + si], 0h
	
	push si
	call gettingHit
	

endCheckIfGotPunched:	

	inc si
	inc si
	cmp si, 4h
	JNZ checkIfGotPunched
;}
	
	
	
	pop si
	pop bx
	pop ax
	ret 2
endp charPunchCheck


; gets (x, y) player, (x, y) enemy
; returns answer in al (1 if yes, 0 if no)
proc punchRangeCheck
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	
	
	; jmp if (xPlayer + 5) < xEnemy
	mov ax, par4
	add ax, 5
	cmp ax, par2
	JL doesntGetPunched
	
	; jmp if (xPlayer - 5) > xEnemy
	mov ax, par4
	sub ax, 5
	cmp ax, par2
	JG doesntGetPunched
	
	; jmp if (yPlayer + 5) < yEnemy
	mov ax, par3
	add ax, 5
	cmp ax, par1
	JL doesntGetPunched
	
	; jmp if (yPlyaer - 5) > yEnemy
	mov ax, par3
	sub ax, 5
	cmp ax, par1
	JG doesntGetPunched
	
	
doesGetPunched:
	mov al, 1
	pop ax
	pop bp
	ret 8
	
doesntGetPunched:
	mov al, 0
	pop ax
	pop bp
	ret 8
	
endp punchRangeCheck

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	