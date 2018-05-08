IDEAL
MODEL small
STACK 100h

par5 equ [bp + 10]
par4 equ [bp + 8]
par3 equ [bp + 6]
par2 equ [bp + 4]
par1 equ [bp + 2]

mx equ [xCords]
mxPast equ [xCordsPast]
my equ [yCords]
myPast equ [yCordsPast]

clock equ [es:6ch]
	
	include 'Main\Input.asm'
	include 'Inp\plyInp.asm'
	include 'Inp\badInp.asm'
	
	include 'Main\Calcul.asm'
	include 'Cal\charCal.asm'
	include 'Cal\PnchAlgo.asm'
	
	include 'Main\Graph.asm'
	include 'Ani\charAni.asm'
	include 'Ani\rectangl.asm'

DATASEG
; --------------------------
; Your variables here
; --------------------------

keyCodes db (0)
		 db (0)
	; bit 8 = nothing
	
	; bit 1 = W
	; bit 2 = A
	; bit 3 = S
	; bit 4 = D
	; bit 5 = J
	
actionCodes db (0)
			db (0)
	; bit 8 = nothing
	
	; bit 1 = up
	; bit 2 = left
	; bit 3 = down
	; bit 4 = right
	; bit 5 = punch
	
xCords dw (150)
	   dw (310)
xCordsPast dw 2 dup (0)
yCords dw (100)
	   dw (190)
yCordsPast dw 2 dup (0)
colorObject db (28h)
			db (40h)



tempClock dw (0)

CODESEG

start:
	mov ax, @data
	mov ds, ax
	
	mov ax, 0c00h
	int 21h
; --------------------------
; Your code here
; --------------------------

;	graphic mode
	mov ax, 13h
	int 10h
	
	push 28h
	push mx
	push my
	call spawn
	
	push 40h
	push [xCords + 2]
	push [yCords + 2]
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


