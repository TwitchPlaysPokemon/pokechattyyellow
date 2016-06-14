VBlank::

	push af
	push bc
	push de
	push hl

	ld a, [rVBK] ; vram bank
	push af
	xor a
	ld [rVBK], a ; reset vram bank to 0

	ld a, [hROMBank]
	ld [wVBlankSavedROMBank], a

	ld a, [hSCX]
	ld [rSCX], a
	ld a, [hSCY]
	ld [rSCY], a

	ld a, [wDisableVBlankWYUpdate]
	and a
	jr nz, .ok
	ld a, [hWY]
	ld [rWY], a
.ok

	call AutoBgMapTransfer
	call VBlankCopyBgMap
	call RedrawRowOrColumn
	call VBlankCopy
	call VBlankCopyDouble
	call UpdateMovingBgTiles
	call $ff80 ; hOAMDMA
	ld a, BANK(PrepareOAMData)
	ld [hROMBank], a
	ld [MBC5RomBank], a
	call PrepareOAMData

	; VBlank-sensitive operations end.
	call TrackPlayTime ; keep track of time played

	call Random
	call ReadJoypad

	ld a, [hVBlankHasOccurred]
	and a
	jr z, .skipZeroing
	xor a
	ld [hVBlankHasOccurred], a

.skipZeroing
	ld a, [hVBlankCounter]
	and a
	jr z, .skipDec
	dec a
	ld [hVBlankCounter], a
.skipDec
	call FadeOutAudio

	callbs Music_DoLowHealthAlarm
	callbs Audio1_UpdateMusic

	call SerialFunction

	ld a, [wVBlankSavedROMBank]
	ld [hROMBank], a
	ld [MBC5RomBank], a

	pop af
	ld [rVBK],a

	pop hl
	pop de
	pop bc
	pop af
	reti


DelayFrame::
; Wait for the next vblank interrupt.
; As a bonus, this saves battery.

NOT_VBLANKED EQU 1

	ld a, NOT_VBLANKED
	ld [hVBlankHasOccurred], a
.halt
	halt
	ld a, [hVBlankHasOccurred]
	and a
	jr nz, .halt
	ret
