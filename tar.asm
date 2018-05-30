IDEAL
MODEL small
STACK 100h

par5 equ [word ptr bp + 10]
par4 equ [word ptr bp + 8]
par3 equ [word ptr bp + 6]
par2 equ [word ptr bp + 4]
par1 equ [word ptr bp + 2]

mx equ [xPlayer]
mxPast equ [xPlayerPast]
my equ [yPlayer]
myPast equ [yPlayerPast]

clock equ [es:6ch]
	
	include 'Inp\Input.asm'
	include 'Inp\charInp.asm'
	include 'Inp\enemyAi.asm'
	
	include 'Cal\Calcul.asm'
	include 'Cal\charCal.asm'
	include 'Cal\hit.asm'
	
	include 'Ani\Graph.asm'
	include 'Ani\charAni.asm'
	include 'Ani\rectangl.asm'

DATASEG
; --------------------------
; Your variables here
; --------------------------




keyCode dw 5 dup (0)
	; bit 8 = nothing
	
	; bit 1 = W
	; bit 2 = A
	; bit 3 = S
	; bit 4 = D
	; bit 5 = J
	
actionCode  dw 5 dup (0)
	; bit 8 = nothing
	
	; bit 1 = up
	; bit 2 = left
	; bit 3 = down
	; bit 4 = right
	; bit 5 = punch
	
facing dw 5 dup (0)
	
xCords dw (150)
	   dw (310)
	   dw (310)
	   dw (0)
	   dw (0)
xCordsPast dw 5 dup (0)
yCords dw (100)
	   dw (190)
	   dw (0)
	   dw (190)
	   dw (0)
yCordsPast dw 5 dup (0)

colorObject dw (28h)
			dw 4 dup (40h)



charClock dw 5 dup (0) ; for the enemy inputs
enemyChances dw 5 dup (0)


aniStatus dw 5 dup (0)
aniClock dw 5 dup (0)
aniCounter dw 5 dup (0)

living dw 5 dup (1)

CODESEG

start:
	mov ax, @data
	mov ds, ax
	
; --------------------------
; Your code here
; --------------------------




;	graphic mode
	mov ax, 13h
	int 10h
	
	push 28h
	push [xCords + 0h]
	push [yCords + 0h]
	call spawn
	
	push 40h
	push [xCords + 2h]
	push [yCords + 2h]
	call spawn
	
	mov ax, 0c00h
	int 21h
	
	
	
mainLoop:
	
	
	
	
	
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; Inputs ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	
	call mainInput
	
	
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; Calculations ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
	call mainCalculation
	
	
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; Animation ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
	
	call mainAnimation
	
	
	
	
nextMainLoop:

	jmp mainLoop


	
	
exit:
	mov ah, 0h ; wait for keyboard
	int 16h
	
	mov ax, 2h ; return to text mode
	int 10h
	
	mov ax, 4c00h
	int 21h
END start


