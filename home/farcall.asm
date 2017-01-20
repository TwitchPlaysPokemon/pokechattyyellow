FarCall_hl::
; self-contained bankswitch, use this when not in the home bank
; calls b:hl
; preserves bc and de going into the call
	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch
	call FarJump_hl
	push af
	push hl
	ld hl, [sp + 2] ; flags of a
	ld a, [hli] ; read
	inc l ; inc hl
	ld [hl], a ; and write to the flags of the saved bank
	pop hl
	pop af
	pop af
	rst Bankswitch
	ret

FarJump_hl::
	jp [hl]
