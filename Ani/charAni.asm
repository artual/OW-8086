;	this file has the third step in the loop, the graphic part.
;	
;	this file gets the action code and shows the action on screen.
;	
;	NEED TO CHANGE:
;	1. in charAnimation do that it changes x and y.
;	
;	
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

; gets color, x, y
; prints char
proc spawn
	push bp
	mov bp, sp
	inc bp
	inc bp
	
	push par3 ; color
	push 10 ; rows
	push 10 ; columns
	push par2 ; x
	push par1 ; y
	call rectangle
	
	pop bp
	ret 6
endp spawn


; gets color, x, y
; moves char up
proc moveUp
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	
	push 0 ; color
	push 10 ; columns
	push par2 ; x
	mov ax, par1
	add ax, 9
	push ax ; y
	call redLine
	
	push par3 ; color
	push 10 ; columns
	push par2 ; x
	mov ax, par1
	sub ax, 1
	push ax ; y
	call redLine
	
	pop ax
	pop bp
	ret 6
endp moveUp


; gets color, x, y
; moves char left
proc moveLeft
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	
	push 0 ; color
	push 10 ; rows
	mov ax, par2
	add ax, 9
	push ax ; x
	push par1 ; y
	call redColumn
	
	push par3 ; color
	push 10 ; rows
	mov ax, par2
	sub ax, 1
	push ax ; x
	push par1 ; y
	call redColumn
	
	pop ax
	pop bp
	ret 6
endp moveLeft



; gets color, x, y
; moves char down
proc moveDown
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	
	push 0 ; color
	push 10 ; columns
	push par2 ; x
	push par1 ; y
	call redLine
	
	push par3 ; color
	push 10 ; columns
	push par2 ; x
	mov ax, par1
	add ax, 10
	push ax ; y
	call redLine
	
	pop ax
	pop bp
	ret 6
endp moveDown


; gets color, x, y
; moves char right
proc moveRight
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	
	push 0 ; color
	push 10 ; rows
	push par2 ; x
	push par1 ; y
	call redColumn
	
	push par3 ; color
	push 10 ; rows
	mov ax, par2
	add ax, 10
	push ax ; x
	push par1 ; y
	call redColumn
	
	pop ax
	pop bp
	ret 6
endp moveRight





; gets color, x, y
; moves char to left-up
proc moveLeftUp
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	
	
	; Erasing
	
	push 0 ; color
	push 10 ; rows
	mov ax, par2
	add ax, 9
	push ax ; x
	push par1 ; y
	call redColumn
	
	push 0 ; color
	push 9 ; columns
	push par2 ; x
	mov ax, par1
	add ax, 9
	push ax ; y
	call redLine
	
	
	; Creating
	
	push par3 ; color
	push 10 ; rows
	mov ax, par2
	dec ax
	push ax ; x
	mov ax, par1
	dec ax
	push ax ; y
	call redColumn
	
	push par3 ; color
	push 9 ; columns
	push par2 ; x
	mov ax, par1
	dec ax
	push ax ; y
	call redLine
	
	
	
	pop ax
	pop bp
	ret 6
endp moveLeftUp


; gets color, x, y
; moves char to left-down
proc moveLeftDown
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	
	; Erasing
	
	push 0 ; color
	push 10 ; rows
	mov ax, par2
	add ax, 9
	push ax ; x
	push par1 ; y
	call redColumn
	
	push 0 ; color
	push 9 ; columns
	push par2 ; x
	push par1 ; y
	call redLine
	
	
	; Creating
	
	push par3 ; color
	push 10 ; rows
	mov ax, par2
	dec ax
	push ax ; x
	mov ax, par1
	inc ax
	push ax ; y
	call redColumn
	
	push par3 ; color
	push 9 ; columns
	push par2 ; x
	mov ax, par1
	add ax, 10
	push ax ; y
	call redLine
	
	pop ax
	pop bp
	ret 6
endp moveLeftDown


; gets color, x, y
; moves char to right-up
proc moveRightUp
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	
	; Erasing
	
	push 0 ; color
	push 10 ; rows
	push par2 ; x
	push par1 ; y
	call redColumn
	
	push 0 ; color
	push 9 ; columns
	mov ax, par2
	inc ax
	push ax ; x
	mov ax, par1
	add ax, 9
	push ax ; y
	call redLine
	
	
	; Creating
	
	push par3 ; color
	push 10 ; rows
	mov ax, par2
	add ax, 10
	push ax ; x
	mov ax, par1
	dec ax
	push ax ; y
	call redColumn
	
	push par3 ; color
	push 9 ; columns
	mov ax, par2
	inc ax
	push ax ; x
	mov ax, par1
	dec ax
	push ax ; y
	call redLine
	
	pop ax
	pop bp
	ret 6
endp moveRightUp



; gets color, x, y
; moves char to right-down
proc moveRightDown
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	
	; Erasing
	
	push 0 ; color
	push 10 ; rows
	push par2 ; x
	push par1 ; y
	call redColumn
	
	push 0 ; color
	push 9 ; columns
	mov ax, par2
	inc ax
	push ax ; x
	push par1 ; y
	call redLine
	
	
	; Creating
	
	push par3 ; color
	push 10 ; rows
	mov ax, par2
	add ax, 10
	push ax ; x
	mov ax, par1
	inc ax
	push ax ; y
	call redColumn
	
	push par3 ; color
	push 9 ; columns
	mov ax, par2
	inc ax
	push ax ; x
	mov ax, par1
	add ax, 10
	push ax ; y
	call redLine
	
	pop ax
	pop bp
	ret 6
endp moveRightDown










; gets objectNum
; prints punch
proc givePunch
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	push bx
	push es
	
	mov bx, par1
	
	; check if in the middle of a punch
	cmp [word ptr aniStatus + bx], 1h
	JZ midGivePunch
	
	; create the actual punch
	push [colorObject + bx]
	push 2
	push 2
	mov ax, [xCords + bx]
	cmp [word ptr facing], 1
	JZ createPunchLeftAni
	add ax, 10
	JMP createPunchAni
createPunchLeftAni:
	sub ax, 2
createPunchAni:
	push ax
	mov ax, [yCords + bx]
	add ax, 3
	push ax
	call rectangle
	
	; reset the clock
	mov ax, 40h
	mov es, ax
	mov ax, clock
	mov [aniClock + bx], ax
	
	
	
	
	; put 1 in the animation status
	mov [aniStatus + bx], 1h
	
	JMP notPunchYet
	
midGivePunch:
	; check if still to hold punch
	mov ax, 40h
	mov es, ax
	mov ax, clock
	cmp ax, [aniClock + bx]
	JZ notPunchYet
	
	inc [word ptr aniCounter + bx] ; NEED HELP REPAIRING
	cmp [word ptr aniCounter + bx], 0ffffh
	JNZ notPunchYet
	
	mov [word ptr aniCounter + bx], 0
	
	
	; reset punch
	push 0h
	push 2
	push 2
	mov ax, [xCords + bx]
	cmp [word ptr facing + bx], 1
	JZ removePunchLeftAni
	add ax, 10
	JMP removePunchAni
removePunchLeftAni:
	sub ax, 2
removePunchAni:
	push ax
	mov ax, [yCords + bx]
	add ax, 3
	push ax
	call rectangle
	
	; reset animation status
	mov [aniStatus + bx], 0h
	
	
notPunchYet:
	
	
	pop es
	pop bx
	pop ax
	pop bp
	ret 2
endp givePunch


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; Main ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; gets actionCode, color, x, y
proc charMvmAni
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	
	push par3
	push par2
	push par1
	
	mov ax, par4
	
	cmp ax, 1
	JZ mvmAni1
	cmp ax, 2
	JZ mvmAni2
	cmp ax, 3
	JZ mvmAni3
	cmp ax, 4
	JZ mvmAni4
	cmp ax, 5
	JZ mvmAni5
	cmp ax, 6
	JZ mvmAni6
	cmp ax, 7
	JZ mvmAni7
	cmp ax, 8
	JZ mvmAni8
	
	mov ax, 4c00h ; NEED TO REMOVE THIS IN THE END PLEAAAAAAAAAAAAAAAAAAAAAAAAAAASE ; ITS TESTINGGG
	int 21h
	
	
mvmAni1:
	call moveUp
	jmp endMvmAni
mvmAni2:
	call moveLeft
	jmp endMvmAni
mvmAni3:
	call moveDown
	jmp endMvmAni
mvmAni4:
	call moveRight
	jmp endMvmAni
mvmAni5:
	call moveLeftUp
	jmp endMvmAni
mvmAni6:
	call moveLeftDown
	jmp endMvmAni
mvmAni7:
	call moveRightUp
	jmp endMvmAni
mvmAni8:
	call moveRightDown
	
	
	
endMvmAni:

	pop ax
	pop bp
	ret 8
endp charMvmAni


; gets objectNumber, actionCode, char(color), x, y
; displays the animation of player
proc charAnimation
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	push bx
	push cx
	push dx
	
	; mov ax, par4
	
	; ; if the key isn't between 0, 4 (Mvm), jmp
	; cmp ax, 4
	; JG actionCodeBIG4
	
	
	
	; jmp endPlayerAnimation
	
; actionCodeBIG4:
	; cmp ax, 5
	; JG actionCodeBIG5
	
	
	
	; jmp endPlayerAnimation
	
; actionCodeBIG5:
	; cmp ax, 6
	; JG actionCodeBIG6
	
	
	
	; jmp endPlayerAnimation
	
; actionCodeBIG6:
	
	
	
	; jmp endPlayerAnimation



	
	
	
; anPlay80h:
	; cmp ax, 80h
	; JZ endPlayerAnimation
	
	; push par3
	; push par2
	; push par1
	
; anPlay1:
	; cmp ax, 1
	; JNZ anPlay2
	
	; call moveUp
	; jmp endPlayerAnimation
	
; anPlay2:
	; cmp ax, 2
	; JNZ anPlay3
	
	; call moveLeft
	; jmp endPlayerAnimation
	
; anPlay3:
	; cmp ax, 3
	; JNZ anPlay4
	
	; call moveDown
	; jmp endPlayerAnimation
	
; anPlay4:
	
	; call moveRight
	
	
	
	
	
endPlayerAnimation:
	
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 10
endp charAnimation






















