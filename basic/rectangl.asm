IDEAL

par5 equ [bp + 10]
par4 equ [bp + 8]
par3 equ [bp + 6]
par2 equ [bp + 4]
par1 equ [bp + 2]


CODESEG

; gets color, x, y
; prints dot
proc redDot
	push bp
	mov bp, sp
	inc bp
	inc bp
	push ax
	push bx
	push cx
	push dx
	
	mov ax, par3
	mov ah, 0ch
	xor bx, bx
	mov cx, par2
	mov dx, par1
	int 10h
	
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 6
endp redDot

; gets color, columns, x, y
; prints line
proc redLine
	push bp
	mov bp, sp
	inc bp
	inc bp
	push cx
	push dx
	
	mov cx, par3
	mov dx, par2
printNextDotX:
	push par4 ; color
	push dx ; x
	push par1 ; y
	call redDot
	inc dx
	loop printNextDotX
	
	pop dx
	pop cx
	pop bp
	ret 8
endp redLine

; gets color, rows, x, y
; prints column
proc redColumn
	push bp
	mov bp, sp
	inc bp
	inc bp
	push cx
	push dx
	
	mov cx, par3
	mov dx, par1
printNextDotY:
	push par4 ; color
	push par2 ; x
	push dx ; y
	call redDot
	inc dx
	loop printNextDotY
	
	pop dx
	pop cx
	pop bp
	ret 8
endp redColumn
	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Main ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; gets color, rows, columns, x, y
; prints rectangle
proc rectangle
	push bp
	mov bp, sp
	inc bp
	inc bp
	push cx
	push dx
	
	mov cx, par4 ; rows
	mov dx, par1 ; y
printNextLine:
	push par5 ; color
	push par3 ; columns
	push par2 ; x
	push dx ; par1 / y
	call redLine
	inc dx
	loop printNextLine
	
	pop dx
	pop cx
	pop bp
	ret 10
endp Rectangle