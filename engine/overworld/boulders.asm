CheckForCollisionWhenPushingBoulder:
	call GetTileTwoStepsInFrontOfPlayer
	call IsTilePassable
	jr c, .done
	ld hl, TilePairCollisionsLand
	call CheckForTilePairCollisions2
	ld a, $ff
	jr c, .done ; if there is an elevation difference between the current tile and the one two steps ahead
	ld a, [wTileInFrontOfBoulderAndBoulderCollisionResult]
	cp $15 ; stairs tile
	ld a, $ff
	jr z, .done ; if the tile two steps ahead is stairs
	call CheckForBoulderCollisionWithSprites
.done
	ld [wTileInFrontOfBoulderAndBoulderCollisionResult], a
	ret

; sets a to $ff if there is a collision and $00 if there is no collision
CheckForBoulderCollisionWithSprites:
	ld a, [wBoulderSpriteIndex]
	dec a
	swap a
	ld d, 0
	ld e, a
	ld hl, wSpriteStateData2 + $14
	add hl, de
	ld a, [hli] ; map Y position
	ld [hBoulderY], a
	ld a, [hl] ; map X position
	ld [hBoulderX], a
	ld a, [wNumSprites]
	ld c, a
	ld de, $f
	ld hl, wSpriteStateData2 + $14
	ld a, [hBoulderDirection]
	and $3 ; facing up or down?
	jr z, .pushingHorizontallyLoop
.pushingVerticallyLoop
	inc hl
	ld a, [hBoulderX]
	cp [hl]
	jr nz, .nextSprite1 ; if X coordinates don't match
	dec hl
	ld a, [hli]
	ld b, a
	ld a, [hBoulderDirection]
	rrca
	jr c, .pushingDown
; pushing up
	ld a, [hBoulderY]
	dec a
	jr .compareYCoords

.pushingDown
	ld a, [hBoulderY]
	inc a
.compareYCoords
	cp b
	jr z, .failure
.nextSprite1
	dec c
	jr z, .success
	add hl, de
	jr .pushingVerticallyLoop

.pushingHorizontallyLoop
	ld a, [hli]
	ld b, a
	ld a, [hBoulderY]
	cp b
	jr nz, .nextSprite2
	ld b, [hl]
	ld a, [hBoulderDirection]
	bit 2, a
	jr nz, .pushingLeft
; pushing right
	ld a, [hBoulderX]
	inc a
	jr .compareXCoords

.pushingLeft
	ld a, [hBoulderX]
	dec a
.compareXCoords
	cp b
	jr z, .failure
.nextSprite2
	dec c
	jr z, .success
	add hl, de
	jr .pushingHorizontallyLoop

.failure
	ld a, $ff
	ret

.success
	xor a
	ret

