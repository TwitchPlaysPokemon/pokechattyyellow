PrintSafariZoneSteps:
	ld a, [wCurMap]
	cp SAFARI_ZONE_EAST
	ret c
	cp UNKNOWN_DUNGEON_2
	ret nc
	ld hl, hFlags_0xFFFA
	set 2, [hl]
	coord hl, 0, 0
	lb bc, 3, 8
	call TextBoxBorder
	coord hl, 4, 1
	ld de, SafariSteps
	call PlaceString
	coord hl, 1, 1
	ld de, wSafariSteps
	lb bc, 2, 4
	call PrintNumber
	coord hl, 1, 3
	ld de, SafariBallText
	call PlaceString
	ld a, [wNumSafariBalls]
	cp 10
	jr nc, .numSafariBallsTwoDigits
	coord hl, 5, 3
	ld a, " "
	ld [hl], a
.numSafariBallsTwoDigits
	coord hl, 6, 3
	ld de, wNumSafariBalls
	lb bc, 1, 2
	call PrintNumber
	ld hl, hFlags_0xFFFA
	res 2, [hl]
	ret

SafariSteps:
	db " /"
	next "/1500@"

SafariBallText:
	db "BALL×× @"
