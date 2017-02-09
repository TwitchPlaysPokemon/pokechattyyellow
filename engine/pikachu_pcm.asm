PlayPikachuSoundClip::
IF DEF(MARKOV)
	ld a, e
	add LUA_REQUEST_CHATOT
	call LuaRequest
	ld b, 0
	ld hl, 0
ELSE
	ld d, $0
	ld hl, PikachuCriesPointerTable
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld b, a ; bank of pikachu cry data
	ld a, [hli] ; cry data pointer
	ld h, [hl]
	ld l, a
	call Delay3
ENDC
PlayPikachuSoundClipBHL::
	di
	push hl
	ld a, $80
	ld [rNR52], a
	ld a, $77
	ld [rNR50], a
	xor a
	ld [rNR30], a
	ld hl, rWAVE ; wave data
	ld de, wRedrawRowOrColumnSrcTiles
	ld c, $10
.saveWaveDataLoop
	ld a, [hl]
	ld [de], a
	inc de
	ld a, $ff
	ld [hli], a
	dec c
	jr nz, .saveWaveDataLoop
	ld a, $80
	ld [rNR30], a
	ld a, [rNR51]
	or $44
	ld [rNR51], a
	ld a, $ff
	ld [rNR31], a
	ld a, $20
	ld [rNR32], a
	ld a, $ff
	ld [rNR33], a
	ld a, $87
	ld [rNR34], a
	pop hl
	call PlayPikachuPCM
	xor a
	ld [wc0f3], a
	ld [wc0f4], a
	ld a, $80
	ld [rNR52], a
	xor a
	ld [rNR30], a
	ld hl, wRedrawRowOrColumnSrcTiles
	ld de, rWAVE
	ld bc, $10
	call CopyData
	ld a, $80
	ld [rNR30], a
	ld a, [rNR51]
	and $bb
	ld [rNR51], a
	xor a
	ld [wChannelSoundIDs+CH4], a
	ld [wChannelSoundIDs+CH5], a
	ld [wChannelSoundIDs+CH6], a
	ld [wChannelSoundIDs+CH7], a
	reti

PikachuCriesPointerTable::
; format:
; db bank
; dw pointer to cry

; bank 21
	pikacry_def PikachuCry1 ; 21:4000
	pikacry_def PikachuCry2 ; 21:491a
	pikacry_def PikachuCry3 ; 21:4fdc
	pikacry_def PikachuCry4 ; 21:59ee

; bank 22
	pikacry_def PikachuCry5 ; 22:4000
	pikacry_def PikachuCry6 ; 22:5042
	pikacry_def PikachuCry7 ; 22:6254

; bank 23
	pikacry_def PikachuCry8 ; 23:4000
	pikacry_def PikachuCry9 ; 23:50ca
	pikacry_def PikachuCry10 ; 23:5e0c

; bank 24
	pikacry_def PikachuCry11 ; 24:4000
	pikacry_def PikachuCry12 ; 24:4722
	pikacry_def PikachuCry13 ; 24:54a4

; bank 25
	pikacry_def PikachuCry14 ; 25:4000
	pikacry_def PikachuCry15 ; 25:589a

; banks 31-34, in no particular order

	pikacry_def PikachuCry16 ; 31:4000
	pikacry_def PikachuCry17 ; 34:4000
	pikacry_def PikachuCry18 ; 31:549a
	pikacry_def PikachuCry19 ; 33:4000
	pikacry_def PikachuCry20 ; 32:4000
	pikacry_def PikachuCry21 ; 32:6002
	pikacry_def PikachuCry22 ; 31:63a4
	pikacry_def PikachuCry23 ; 34:4862
	pikacry_def PikachuCry24 ; 33:5632
	pikacry_def PikachuCry25 ; 34:573c
	pikacry_def PikachuCry26 ; 33:725c

; bank 35
	pikacry_def PikachuCry27 ; 35:4000
	pikacry_def PikachuCry28 ; 35:4b5a
	pikacry_def PikachuCry29 ; 35:5da4
	pikacry_def PikachuCry30 ; 35:69ce
	pikacry_def PikachuCry31 ; 35:6e80

; bank 36
	pikacry_def PikachuCry32 ; 36:4000
	pikacry_def PikachuCry33 ; 36:458a
	pikacry_def PikachuCry34 ; 36:523c

; bank 37
	pikacry_def PikachuCry35 ; 37:4000
	pikacry_def PikachuCry36 ; 37:522a

; banks 36-38
	pikacry_def PikachuCry37 ; 38:4000
	pikacry_def PikachuCry38 ; 38:4dfa
	pikacry_def PikachuCry39 ; 37:6e0c
	pikacry_def PikachuCry40 ; 38:5a64
	pikacry_def PikachuCry41 ; 36:6746
	pikacry_def PikachuCry42 ; 38:6976
