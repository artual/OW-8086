; check if something is present in buffer.
; if something is and it is released, push it.
	in al, 64h
	cmp al, 10b
	JE next
	in al, 60h
	xor ah, ah
	and al, 80h
	JNZ player ; jump if key is released. NZ = key released.
	push ax