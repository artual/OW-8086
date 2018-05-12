IDEAL
MODEL small
STACK 100h

par5 equ [bp + 10]
par4 equ [bp + 8]
par3 equ [bp + 6]
par2 equ [bp + 4]
par1 equ [bp + 2]

mx equ [xOfPlayer]
my equ [yOfPlayer]

	include 'basic\rectangl.asm'

DATASEG
; --------------------------
; Your variables here
; --------------------------
mainFlags db (0)
	; bit 1 = calculate (0) animation (1)
lastMovementFlag db (0)
	; bit 1 = w
	; bit 2 = a
	; bit 3 = s
	; bit 4 = d
xOfPlayer dw (150)
yOfPlayer dw (100)

CODESEG

start:
	mov ax, @data
	mov ds, ax
	
	mov ax, 0c00h
	int 21h
; --------------------------
; Your code here
; --------------------------
 ; graphic mode
	mov ax, 13h
	int 10h
	
	push 40
	push mx
	push my
	call redDot
	
	jmp exit
tests:

	
	
	
	
	
	
exit:
	mov ah, 0h ; wait for keyboard
	int 16h
	
	mov ax, 2h ; return to text mode
	int 10h
	
	mov ax, 4c00h
	int 21h
END start


