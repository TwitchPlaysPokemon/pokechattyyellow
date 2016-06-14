BankswitchCommon::
	ld [hROMBank], a
	ld [MBC1RomBank], a
	ret

FarCall::
; self-contained bankswitch, use this when not in the home bank
; calls b:hl
; preserves c and de going into the call
; bc is lost when returning
	ld a, [hROMBank]
	push af
	ld a, b
	ld [hROMBank], a
	ld [MBC1RomBank], a
	call FarJump_hl
	pop bc
	ld a, b
	ld [hROMBank], a
	ld [MBC1RomBank], a
	ret

FarJump_hl::
	jp [hl]
