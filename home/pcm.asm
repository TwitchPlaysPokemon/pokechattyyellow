IF 0 == 1 ; DEF(MARKOV)
PlayPikachuPCM::
	ld c, hROMBank & $ff
	ld a, [$ff00+c]
	push af
	ld hl, $4000
	ld a, h
	ld [$ff00+c], a
	ld [MBC5RomBank], a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	jr .handleLoop
.loop
	bit 7, h
	jr nz, .switchBank
.handleLoop
	ld a, [hli]
	ld b, a

	jr .waitSixCycles1
.waitSixCycles1
	jr .waitSixCycles2
.waitSixCycles2

.afterSwitchBank
	rept 7
	call LoadNextSoundClipSample
	call PlaySoundClipSample
	endr

	call LoadNextSoundClipSample

	dec de
	ld a, e
	or d
	jr nz, .loop
	pop af
	rst Bankswitch
	ret

.switchBank
	ld a, [$ff00+c] ; 2
	inc a ; 3
	ld [$ff00+c], a ; 5
	ld [MBC5RomBank], a ; 9
	ld hl, $4000 ; 12
	jr .afterSwitchBank ; 15
	; +1
ELSE
PlayPikachuPCM::
	ld a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
.loop
	ld a, [hli]
	ld d, a
	ld a, $3
.playSingleSample
	dec a
	jr nz, .playSingleSample

	rept 7
	call LoadNextSoundClipSample
	call PlaySoundClipSample
	endr

	call LoadNextSoundClipSample
	dec bc
	ld a, c
	or b
	jr nz, .loop
	pop af
	rst Bankswitch
	ret
ENDC

LoadNextSoundClipSample::
IF 0 == 1 ; DEF(MARKOV)
	ld a, b
ELSE
	ld a, d
ENDC
	and $80
	srl a
	srl a
	ld [rNR32], a
IF 0 == 1 ; DEF(MARKOV)
	sla b
ELSE
	sla d
ENDC
	ret

PlaySoundClipSample::
	ld a, $3
.loop
	dec a
	jr nz, .loop
	ret