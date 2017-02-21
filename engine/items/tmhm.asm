; checks if the mon in [wWhichPokemon] already knows the move in [wMoveNum]
CheckIfMoveIsKnown:
	ld a, [wWhichPokemon]
	and $7f
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld a, [wMoveNum]
	ld b, a
	ld c, NUM_MOVES
.loop
	ld a, [hli]
	cp b
	jr z, .alreadyKnown ; found a match
	dec c
	jr nz, .loop
	and a
	ret

.alreadyKnown
	ld a, [wWhichPokemon]
	bit 7, a
	ld hl, AlreadyKnowsText
	call z, PrintText
	scf
	ret

AlreadyKnowsText:
	TX_FAR _AlreadyKnowsText
	db "@"

CheckIfAnyMonKnowsMove:
	ld a, $80
	ld [wWhichPokemon], a
.loop
	call CheckIfMoveIsKnown
	jr c, .done
	ld a, [wWhichPokemon]
	inc a
	ld [wWhichPokemon], a
	cp $86
	jr nz, .loop
	scf
	ret

.done
	ld hl, wWhichPokemon
	res 7, [hl]
	and a
	ret
