FarCall_hl::
; self-contained bankswitch, use this when not in the home bank
; calls a:hl
; preserves c and de going into the call
	ld b, a
	ld a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch
	call FarJump_hl
	jr ReturnFromFarCall

StackFarcall::
	pop hl
	ld a, [hli]
	ld b, a
	add a
	jr c, .farjump
	inc hl
	inc hl
	push hl
	dec hl
	dec hl
.farjump
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch
	call FarJump_hl

ReturnFromFarCall::
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

