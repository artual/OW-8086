;	this file has the third step in the loop, the graphic part.
;	
;	this file gets the action code and shows the action on screen.
;	
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




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; Main ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; gets number of object
; gets actionCode, char(color), x, y
; displays the animation of player
proc charMvmAni
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	push bx
	
	
	mov bx, par1
	
	mov al, [actionCodes + bx]
	xor ah, ah
	
	
	mov al, [colorObject + bx]
	xor ah, ah
	push ax
	push [xCordsPast + bx]
	push [yCordsPast + bx]
	
anPly0001b:
	cmp al, 0001b
	JNZ anPly0010b
	
	call moveUp
	jmp endCharMvmAni
	
anPly0010b:
	cmp al, 0010b
	JNZ anPly0100b
	
	call moveLeft
	jmp endCharMvmAni
	
anPly0100b:
	cmp al, 0100b
	JNZ anPly1000b
	
	call moveDown
	jmp endCharMvmAni
	
anPly1000b:
	
	call moveRight
	
endCharMvmAni:
	
	pop bx
	pop ax
	pop bp
	ret 8
endp charMvmAni






















