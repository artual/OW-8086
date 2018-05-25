IDEAL
MODEL small
STACK 100h

par5 equ [bp + 10]
par4 equ [bp + 8]
par3 equ [bp + 6]
par2 equ [bp + 4]
par1 equ [bp + 2]

mx equ [xPlayer]
mxPast equ [xPlayerPast]
my equ [yPlayer]
myPast equ [yPlayerPast]

clock equ [es:6ch]
	
	include 'Inp\Input.asm'
	include 'Inp\charInp.asm'
	
	include 'Cal\Calcul.asm'
	include 'Cal\charCal.asm'
	include 'Cal\hit.asm'
	
	include 'Ani\Graph.asm'
	include 'Ani\charAni.asm'
	include 'Ani\rectangl.asm'
	include 'Ani\data.asm'

DATASEG
; --------------------------
; Your variables here
; --------------------------




keyCode dw 2 dup (0)
	; bit 8 = nothing
	
	; bit 1 = W
	; bit 2 = A
	; bit 3 = S
	; bit 4 = D
	; bit 5 = J
	
actionCode  dw 2 dup (0)
	; bit 8 = nothing
	
	; bit 1 = up
	; bit 2 = left
	; bit 3 = down
	; bit 4 = right
	; bit 5 = punch
	
xCords dw (260)
	   dw (310)
xCordsPast dw 2 dup (0)
yCords dw (100)
	   dw (100)
yCordsPast dw 2 dup (0)

colorObject dw (28h)
			dw (40h)
			
charClock dw 2 dup (0) ; for the enemy inputs

aniStatus dw 2 dup (0)
aniClock dw 2 dup (0)

living dw 2 dup (1)

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


