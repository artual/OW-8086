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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; Main ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; gets actionCode, char(color), x, y
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
	
	mov ax, par4
	
anPlay8h:
	cmp ax, 80h
	JZ endPlayerAnimation
	
	push par3
	push par2
	push par1
	
anPlay0001b:
	cmp ax, 0001b
	JNZ anPlay0010b
	
	call moveUp
	jmp endPlayerAnimation
	
anPlay0010b:
	cmp ax, 0010b
	JNZ anPlay0100b
	
	call moveLeft
	jmp endPlayerAnimation
	
anPlay0100b:
	cmp ax, 0100b
	JNZ anPlay1000b
	
	call moveDown
	jmp endPlayerAnimation
	
anPlay1000b:
	
	call moveRight
	
endPlayerAnimation:
	
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 8
endp charAnimation






















