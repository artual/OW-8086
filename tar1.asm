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
	include 'cal\charCal.asm'
	
	include 'Ani\Graph.asm'
	include 'Ani\charAni.asm'
	include 'Ani\rectangl.asm'

DATASEG
; --------------------------
; Your variables here
; --------------------------
keyCodePlayer db (0)
	; bit 8 = nothing
	
	; bit 1 = w
	; bit 2 = a
	; bit 3 = s
	; bit 4 = d
actionCodePlayer db (0)
	; bit 8 = nothing
	
	; bit 1 = up
	; bit 2 = left
	; bit 3 = down
	; bit 4 = right
xPlayer dw (150)
xPlayerPast dw (0)
yPlayer dw (100)
yPlayerPast dw (0)

keyCodeEnemy db (0)
actionCodeEnemy db (0)
xEnemy dw (310)
xEnemyPast dw (0)
yEnemy dw (190)
yEnemyPast dw (0)

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
	push [xEnemy]
	push [yEnemy]
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


