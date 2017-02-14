GetTrainerName_:
	ld de, wGrassRate
	ld a, [wLinkState]
	and a
	jr nz, .foundName
	ld de, wRivalName
	ld a, [wTrainerClass]
	cp SONY1
	jr z, .foundName
	cp SONY2
	jr z, .foundName
	cp SONY3
	jr z, .foundName
IF DEF(MARKOV)
	ld a, LUA_REQUEST_TRAINER_NAME
	jp LuaRequest

ELSE
	ld [wd0b5], a
	ld a, TRAINER_NAME
	ld [wNameListType], a
	ld a, BANK(TrainerNames)
	ld [wPredefBank], a
	call GetName
	ld de, wStringBuffer
ENDC
.foundName
	ld hl, wTrainerName
	jp CopyString

