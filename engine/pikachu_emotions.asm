IsPlayerTalkingToPikachu:
	ld a, [wd436]
	and a
	ret z
	ld a, [hSpriteIndexOrTextID]
	cp $f
	ret nz
	call InitializePikachuTextID
	xor a
	ld [hSpriteIndexOrTextID], a
	ld [wd436], a
	ret

InitializePikachuTextID:
	ld a, $d4 ; display
	ld [hSpriteIndexOrTextID], a
	xor a
	ld [wPlayerMovingDirection], a
	ld a, $1
	ld [wAutoTextBoxDrawingControl], a
	call DisplayTextID
	xor a
	ld [wAutoTextBoxDrawingControl], a
	ret

DoStarterPikachuEmotions:
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
.loop
	ld a, [de]
	inc de
	cp $ff
	jr z, .done
	ld c, a
	ld b, 0
	ld hl, StarterPikachuEmotionsJumptable
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call FarJump_hl
	jr .loop

.done
	ret

StarterPikachuEmotionsJumptable:
	dw StarterPikachuEmotionCommand_nop ; 0
	dw StarterPikachuEmotionCommand_text ; 1
	dw StarterPikachuEmotionCommand_pcm ; 2
	dw StarterPikachuEmotionCommand_emote ; 3
	dw StarterPikachuEmotionCommand_movement ; 4
	dw StarterPikachuEmotionCommand_pikapic ; 5
	dw StarterPikachuEmotionCommand_subcmd ; 6
	dw StarterPikachuEmotionCommand_delay ; 7
	dw StarterPikachuEmotionCommand_nop2 ; 8
	dw StarterPikachuEmotionCommand_turnawayfromplayer ; 9
	dw StarterPikachuEmotionCommand_nop3 ; a

StarterPikachuEmotionCommand_nop:
StarterPikachuEmotionCommand_nop3:
	ret

StarterPikachuEmotionCommand_text:
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	inc de
	push de
	call PrintText
	pop de
	ret

StarterPikachuEmotionCommand_pcm:
	ld a, [de]
	inc de
	push de
	ld e, a
	nop
	call PlayPikachuSoundClip_
	pop de
	ret

PlayPikachuSoundClip_:
	cp $ff
	ret z
	callab PlayPikachuSoundClip
	ret

StarterPikachuEmotionCommand_emote:
	ld a, [wUpdateSpritesEnabled]
	push af
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	ld a, [de]
	inc de
	push de
	call ShowPikachuEmoteBubble
	pop de
	pop af
	ld [wUpdateSpritesEnabled], a
	ret

ShowPikachuEmoteBubble:
	ld [wWhichEmotionBubble], a
	ld a, $f ; Pikachu
	ld [wEmotionBubbleSpriteIndex], a
	predef EmotionBubble
	ret

StarterPikachuEmotionCommand_movement:
	ld a, [de]
	inc de
	ld l, a
	ld a, [de]
	inc de
	ld h, a
	push de
	ld b, BANK(DoStarterPikachuEmotions)
	call ApplyPikachuMovementData_
	pop de
	ret

StarterPikachuEmotionCommand_delay:
	ld a, [de]
	inc de
	push de
	ld c, a
	call DelayFrames
	pop de
	ret

StarterPikachuEmotionCommand_subcmd:
	ld a, [de]
	inc de
	push de
	ld e, a
	ld d, 0
	ld hl, .Subcommands
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call FarJump_hl
	pop de
	ret

.Subcommands:
	dw LoadPikachuSpriteIntoVRAM
	dw LoadFontTilePatterns
	dw Pikachu_LoadCurrentMapViewUpdateSpritesAndDelay3
	dw WaitForTextScrollButtonPress
	dw PikachuPewterPokecenterCheck
	dw PikachuFanClubCheck
	dw PikachuBillsHouseCheck

StarterPikachuEmotionCommand_nop2:
	ret

StarterPikachuEmotionCommand_turnawayfromplayer:
	push de
	call MakeChatotTurnAwayFromPlayer
	call UpdateSprites
	pop de
	ret

MakeChatotTurnAwayFromPlayer:
	ld a, [wPlayerFacingDirection]
	xor $4
	ld [wPikachuFacingDirection], a
	ret

DeletedFunction_fcffb:
; Inexplicably empty.
	rept 5
	nop
	endr
	ret

PlaySpecificPikachuEmotion:
	ld a, e
	jr load_expression

TalkToPikachu:
	call MapSpecificPikachuExpression
	jr c, load_expression
	call GetPikaPicAnimationScriptIndex
	call DeletedFunction_fcffb
load_expression
	cp (PikachuEmotionTableEnd - PikachuEmotionTable) / 2
	jr c, .okay
	ld a, 1
.okay
	ld [wExpressionNumber], a
	ld hl, PikachuEmotionTable
	call DoStarterPikachuEmotions
	ret

PikachuEmotionTable:
pikaemotion_def: MACRO
\1_id: dw \1
	endm

	pikaemotion_def PikachuEmotion_null  ; error handling
	pikaemotion_def PikachuEmotion_Mood2Happy3  ; average mood, okay happiness
; 	pikaemotion_def PikachuEmotion_Mood3Happy5  ; high mood, good happiness
; 	pikaemotion_def PikachuEmotion_Mood1Happy3  ;  low mood, okay/decent happiness
	pikaemotion_def PikachuEmotion_Mood2Happy4  ; average mood, decent happiness
	pikaemotion_def PikachuEmotion_Mood2Happy2  ; average mood, low happiness
	pikaemotion_def PikachuEmotion_Mood2Happy1  ; average mood, crap happiness
	pikaemotion_def PikachuEmotion_Mood2Happy5  ; average mood, good happiness
; 	pikaemotion_def PikachuEmotion_Mood3Happy3  ; high mood, okay happiness
; 	pikaemotion_def PikachuEmotion_Mood1Happy2  ;  low mood, low happiness
; 	pikaemotion_def PikachuEmotion_Mood3Happy6 ; high mood, high happiness
	pikaemotion_def PikachuEmotion_FastAsleep ; asleep
; 	pikaemotion_def PikachuEmotion_Mood3Happy2 ; high mood, low happiness
; 	pikaemotion_def PikachuEmotion_Mood3Happy1 ; high mood, crap happiness
; 	pikaemotion_def PikachuEmotion_Mood1Happy1 ;  low mood, crap happiness
; 	pikaemotion_def PikachuEmotion_Mood3Happy4 ; high mood, decent happiness
	pikaemotion_def PikachuEmotion_Mood2Happy6 ; average mood, high happiness
; 	pikaemotion_def PikachuEmotion_Mood1Happy5 ;  low mood, good/high/max happiness
	pikaemotion_def PikachuEmotion_CaughtPokemon ; caught a pokemon
	pikaemotion_def PikachuEmotion_Mood2Happy7 ; average mood, max happiness
; 	pikaemotion_def PikachuEmotion_Mood3Happy7 ; high mood, max happiness
	pikaemotion_def PikachuEmotion_FishingRod ; used a fishing rod
	pikaemotion_def PikachuEmotion_LavenderTown ; spoopy
	pikaemotion_def PikachuEmotion_BillFirstTime ; bill's house 0
	pikaemotion_def PikachuEmotion_Burned ; roast parrot anyone?
	pikaemotion_def PikachuEmotion_LowHP ; taught or learned thunder/thunderbolt
	pikaemotion_def PikachuEmotion_PewterWake ; wake up pikachu in pewter pokemon center
	pikaemotion_def PikachuEmotion_BillEmergeFromTeleporter ; bill's house 1
	pikaemotion_def PikachuEmotion_Statused ; statused
	; pikaemotion_def PikachuEmotion_FanClub1 ; fan club 1
	; pikaemotion_def PikachuEmotion_FanClub2 ; fan club 2
	pikaemotion_def PikachuEmotion_BillEnterTeleporter ; bill's house 2
	pikaemotion_def PikachuEmotion_BillGetOverShock ; bill's house 3
PikachuEmotionTableEnd
	pikaemotion_def .error ; error handling

.error:
	db $ff

MapSpecificPikachuExpression:
	; ld a, [wCurMap]
	; cp POKEMON_FAN_CLUB
	; jr nz, .notFanClub
	; ld hl, wd492
	; bit 7, [hl]
	; ldpikaemotion a, PikachuEmotion_FanClub1
	; jr z, .play_emotion
	; call IsPikachuPositionFrozenOnMap
	; ldpikaemotion a, PikachuEmotion_FanClub2
	; jr nz, .play_emotion
	; jr .check_pikachu_status

; .notFanClub
	ld a, [wCurMap]
	cp PEWTER_POKECENTER
	jr nz, .notPewterPokecenter
	call IsPikachuPositionFrozenOnMap
	ldpikaemotion a, PikachuEmotion_PewterWake
	jr nz, .play_emotion
	jr .check_pikachu_status

.notPewterPokecenter
	callab BillsHousePikachuEmotionCheck
	ld a, e
	cp $ff
	jr nz, .play_emotion

.check_pikachu_status
	call IsPlayerPikachuAsleepInParty
	ldpikaemotion a, PikachuEmotion_FastAsleep
	jr c, .play_emotion
	ld e, 1 << BRN
	call CheckPikachuStatused ; same bank
	ldpikaemotion a, PikachuEmotion_Burned
	jr c, .play_emotion
	ld e, $ff ^ (1 << BRN)
	call CheckPikachuStatused ; same bank
	ldpikaemotion a, PikachuEmotion_Statused
	jr c, .play_emotion
	call CheckPikachuLowHP
	ldpikaemotion a, PikachuEmotion_LowHP ; PikachuEmotion_LowHP
	jr c, .play_emotion
	ld a, [wCurMap]
	cp POKEMONTOWER_1
	jr c, .notInLavenderTower
	cp POKEMONTOWER_7 + 1
	ldpikaemotion a, PikachuEmotion_LavenderTown
	jr c, .play_emotion
.notInLavenderTower
	ld a, [wContextDependentPikachuEmotion]
	and a
	jr z, .mood_based_emotion
	dec a
	ld c, a
	ld b, $0
	ld hl, .Emotions
	add hl, bc
	ld a, [hl]
	jr .play_emotion

.mood_based_emotion
	and a
	ret

.play_emotion
	scf
	ret

.Emotions:
	dpikaemotion PikachuEmotion_CaughtPokemon ; caught a pokemon
	dpikaemotion PikachuEmotion_FishingRod ; used a fishing rod
	dpikaemotion PikachuEmotion_BillFirstTime
	; dpikaemotion PikachuEmotion_Burned ; tried to use thunderstone
	; dpikaemotion PikachuEmotion_LowHP ; taught or learned thunder/thunderbolt

IsPlayerPikachuAsleepInParty:
	xor a
	ld [wWhichPokemon], a
.loop
	ld a, [wWhichPokemon]
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .done
	cp CHATOT
	jr nz, .curMonNotStarterPikachu
	callab IsThisPartymonStarterPikachu
	jr nc, .curMonNotStarterPikachu
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Status
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld a, [hl]
	and SLP
	jr z, .done
	jr .curMonSleepingPikachu

.curMonNotStarterPikachu
	ld a, [wWhichPokemon]
	cp PARTY_LENGTH - 1
	jr z, .done
	inc a
	ld [wWhichPokemon], a
	jr .loop

.curMonSleepingPikachu
	scf
	ret

.done
	and a
	ret

INCLUDE "data/pikachu_emotions.asm"

PikachuWalksToNurseJoy:
	ld a, $40
	ld [hLoadPikachuSpriteIntoTile4C], a
	call LoadPikachuSpriteIntoVRAM
	call .GetMovementData
	and a
	call nz, ApplyPikachuMovementData
	xor a
	ld [hLoadPikachuSpriteIntoTile4C], a
	ret

.GetMovementData:
	ld a, [wPikachuMapY]
	ld e, a
	ld a, [wPikachuMapX]
	ld d, a
	ld a, [wYCoord]
	add 4
	cp e
	jr z, .pikachu_at_same_y_as_player
	jr nc, .pikachu_above_player
	ld hl, .PikaMovementData1
	ld a, 1
	ret

.pikachu_above_player
	xor a
	ret

.pikachu_at_same_y_as_player
	ld a, [wXCoord]
	add 4
	cp d
	jr c, .pikachu_to_right_of_player
	ld hl, .PikaMovementData2
	ld a, 2
	ret

.pikachu_to_right_of_player
	ld hl, .PikaMovementData3
	ld a, 3
	ret

.PikaMovementData1:
	db $00 ; init
	db $36 ; look up
	db $2b ; walk up left
	db $34 ; hop up right
	db $3f ; ret

.PikaMovementData2:
	db $00 ; init
	db $36 ; look up
	db $34 ; hop up right
	db $3f ; ret

.PikaMovementData3:
	db $00 ; init
	db $36 ; look up
	db $33 ; hop up left
	db $3f ; ret

