StackFarcall::
	ld [hABuffer], a
	ld a, h
	ld [hHLBuffer + 1], a
	ld a, l
	ld [hHLBuffer], a
	pop hl
	inc hl
	inc hl
	ld a, [hli]
	bit 7, a
	res 7, a
	jr nz, .farjump
	push hl
.farjump
	dec hl
	dec hl
	di
	ld [hBuffer], a
	ld a, [hld]
	ld l, [hl]
	ld h, a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch
	ei
	call RetrieveRegistersAndCallFunction
	jr ReturnFromFarCall

RetrieveRegistersAndCallFunction::
	push hl
	ld hl, hHLBuffer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hABuffer]
	ret

FarCall_hl::
; self-contained bankswitch, use this when not in the home bank
; calls b:hl
; preserves bc and de going into the call
	di
	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch
	ei
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
