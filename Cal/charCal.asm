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
	
mvmAct80h:
	mov [word ptr actionCode + bx], 80h ; do nothing
	jmp endMvmCal
mvmAct0001b:
	mov [word ptr actionCode + bx], 0001b ; go up
	dec [word ptr yCords + bx]
	jmp endMvmCal
mvmAct0010b:
	mov [word ptr actionCode + bx], 0010b ; go left
	dec [word ptr xCords + bx]
	jmp endMvmCal
mvmAct0100b:
	mov [word ptr actionCode + bx], 0100b ; go down
	inc [word ptr yCords + bx]
	jmp endMvmCal
mvmAct1000b:
	mov [word ptr actionCode + bx], 1000b ; go right
	inc [word ptr xCords + bx]
	
endMvmCal:
	
	
	
	pop bx
	pop ax
	pop bp
	ret 2
endp charMvmCal