DisplayPokemonCenterDialogue_:
	ld a, [wCurMap]
	cp PEWTER_POKECENTER
	jr nz, .regularCenter
	call IsPikachuPositionFrozenOnMap
	jr z, .regularCenter
	ld hl, LooksContentText ; if pikachu is sleeping, don't heal
	call PrintText
	ret

.regularCenter
	call SaveScreenTilesToBuffer1 ; save screen
	ld hl, PokemonCenterWelcomeText
	call PrintText
	ld hl, wd72e
	bit 2, [hl]
	set 1, [hl]
	set 2, [hl]
	jr nz, .skipShallWeHealYourPokemon
	ld hl, ShallWeHealYourPokemonText
	call PrintText
.skipShallWeHealYourPokemon
	call YesNoChoicePokeCenter ; yes/no menu
	call UpdateSprites
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .declinedHealing ; if the player chose No
	call SetLastBlackoutMap
	callab IsStarterPikachuInOurParty
	jr nc, .notHealingPlayerPikachu
	call IsPikachuPositionFrozenOnMap
	jr nz, .notHealingPlayerPikachu
	call LoadCurrentMapView
	call Delay3
	call UpdateSprites
	callab PikachuWalksToNurseJoy ; todo
.notHealingPlayerPikachu
	ld hl, NeedYourPokemonText
	call PrintText
	ld c, 64
	call DelayFrames
	call IsPikachuPositionFrozenOnMap
	jr nz, .playerPikachuNotOnScreen
	call DisablePikachuOverworldSpriteDrawing
	callab IsStarterPikachuInOurParty
	call c, Yellow_NurseJoyFacesUp
.playerPikachuNotOnScreen
	lb bc, 1, 8
	call Pokecenter_ApplyFacing
	ld c, 30
	call DelayFrames
	callba AnimateHealingMachine ; do the healing machine animation
	predef HealParty
	xor a
	ld [wAudioFadeOutControl], a
	ld a, [wAudioSavedROMBank]
	ld [wAudioROMBank], a
	ld a, [wMapMusicSoundID]
	ld [wLastMusicSoundID], a
	ld [wNewSoundID], a
	call PlaySound
	call IsPikachuPositionFrozenOnMap
	jr nz, .doNotReturnPikachu
	callab IsStarterPikachuInOurParty
	call c, Yellow_NurseJoyFacesUp
	ld a, $5
	ld [wPikachuSpawnState], a
	call EnablePikachuOverworldSpriteDrawing
.doNotReturnPikachu
	lb bc, 1, 0
	call Pokecenter_ApplyFacing
	ld hl, PokemonFightingFitText
	call PrintText
	callab IsStarterPikachuInOurParty
	jr nc, .notInParty
	lb bc, 15, 0
	call Pokecenter_ApplyFacing
.notInParty
	call LoadCurrentMapView
	call Delay3
	call UpdateSprites
	callab ReloadWalkingTilePatterns
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	ld a, $1
	ld [hSpriteImageIndex], a
	call ComputeAndApplySpriteImageIdx
	ld c, 40
	call DelayFrames
	call UpdateSprites
	call LoadFontTilePatterns
	jr .done

.declinedHealing
	call LoadScreenTilesFromBuffer1 ; restore screen
.done
	ld hl, PokemonCenterFarewellText
	call PrintText
	call UpdateSprites
	ret

Yellow_NurseJoyFacesUp:
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	ld a, $4
	ld [hSpriteImageIndex], a
	call ComputeAndApplySpriteImageIdx
	ld c, 64
	call DelayFrames
	ret

Pokecenter_ApplyFacing:
	ld a, b
	ld [hSpriteIndexOrTextID], a
	ld a, c
	ld [hSpriteImageIndex], a
	push bc
	call SetSpriteFacingDirectionAndDelay
	pop bc
	ld a, b
	ld [hSpriteIndexOrTextID], a
	ld a, c
	ld [hSpriteImageIndex], a
	call ComputeAndApplySpriteImageIdx
	ret

PokemonCenterWelcomeText:
	TX_FAR _PokemonCenterWelcomeText
	db "@"

ShallWeHealYourPokemonText:
	TX_WAIT_30
	TX_FAR _ShallWeHealYourPokemonText
	db "@"

NeedYourPokemonText:
	TX_FAR _NeedYourPokemonText
	db "@"

PokemonFightingFitText:
	TX_FAR _PokemonFightingFitText
	db "@"

PokemonCenterFarewellText:
	TX_WAIT_30
	TX_FAR _PokemonCenterFarewellText
	db "@"

LooksContentText:
	TX_FAR _LooksContentText
	db "@"
