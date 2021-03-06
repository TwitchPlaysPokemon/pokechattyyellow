ViridianCityScript:
	call EnableAutoTextBoxDrawing
	ld hl, ViridianCityScriptPointers
	ld a, [wViridianCityCurScript]
	rst Jumptable
	ret

ViridianCityScriptPointers:
	dw ViridianCityScript0
	dw ViridianCityScript1
	dw ViridianCityScript2
	dw ViridianCityScript3
	dw ViridianCityScript4
	dw ViridianCityScript5
	dw ViridianCityScript6
	dw ViridianCityScript7
	dw ViridianCityScript8
	dw ViridianCityScript9
	dw ViridianCityScript10

ViridianCityScript0:
	call ViridianGymCheck
	call ViridianGym_TryForcePlayerDown
	ret

ViridianCityScript1:
	call ViridianOldManCheck
ViridianCityScript2:
	call ViridianGymCheck
	ret

ViridianGymCheck:
	CheckEvent EVENT_VIRIDIAN_GYM_OPEN
	ret nz
	ld a, [wObtainedBadges]
	cp $7f ; all but Earthbadge
	jr nz, .asm_1906e
	SetEvent EVENT_VIRIDIAN_GYM_OPEN
	ret

.asm_1906e
	ld a, [wYCoord]
	cp 8
	ret nz
	ld a, [wXCoord]
	cp 32
	ret nz
	ld a, $f
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	call StartSimulatingJoypadStates
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	xor a
	ld [wPlayerFacingDirection], a
	ld [wJoyIgnore], a
	ld [hJoyHeld], a
	ld a, $6
	ld [wViridianCityCurScript], a
	ret

ViridianCityScript6:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, $2
	ld [wViridianCityCurScript], a
	ret

ViridianGym_TryForcePlayerDown:
	ld a, [wYCoord]
	cp 9
	ret nz
	ld a, [wXCoord]
	cp 19
	ret nz
	ld a, $5
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [hJoyHeld], a
	call ViridianGym_ForcePlayerDown
	ld a, $5
	ld [wViridianCityCurScript], a
	ret

ViridianCityScript3:
	call PushOldManSpriteCoords
	call LoadOldManBattleData
	ResetEvent EVENT_02F
	ld a, $4
	ld [wViridianCityCurScript], a
	ret

LoadOldManBattleData:
	xor a
	ld [wListScrollOffset], a
	ld a, BATTLE_TYPE_OLD_MAN
	ld [wBattleType], a
	ld a, 5
	ld [wCurEnemyLVL], a
	ld a, RATTATA
	ld [wCurOpponent], a
	ret

PushOldManSpriteCoords:
	ld a, [wSpriteStateData1 + 3 * $10 + 4]
	ld [hCurSpriteScreenY], a
	ld a, [wSpriteStateData1 + 3 * $10 + 6]
	ld [hCurSpriteScreenX], a
	ld a, [wSpriteStateData2 + 3 * $10 + 4]
	ld [hCurSpriteMapY], a
	ld a, [wSpriteStateData2 + 3 * $10 + 5]
	ld [hCurSpriteMapX], a
	ret

ViridianCityScript4:
	call PopOldManSpriteCoords
	call UpdateSprites
	call Delay3
	SetEvent EVENT_02E
	xor a
	ld [wJoyIgnore], a
	ld a, $10
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wBattleType], a
	ld [wJoyIgnore], a
	ld a, $2
	ld [wViridianCityCurScript], a
	ret

PopOldManSpriteCoords:
	ld a, [hCurSpriteScreenY]
	ld [wSpriteStateData1 + 3 * $10 + 4], a
	ld a, [hCurSpriteScreenX]
	ld [wSpriteStateData1 + 3 * $10 + 6], a
	ld a, [hCurSpriteMapY]
	ld [wSpriteStateData2 + 3 * $10 + 4], a
	ld a, [hCurSpriteMapX]
	ld [wSpriteStateData2 + 3 * $10 + 5], a
	ret

ViridianCityScript5:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, $0
	ld [wViridianCityCurScript], a
	ret

ViridianGym_ForcePlayerDown:
	call StartSimulatingJoypadStates
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	xor a
	ld [wPlayerFacingDirection], a
	ld [wJoyIgnore], a
	ret

ViridianOldManCheck:
	CheckEvent EVENT_02D
	ret nz
	ld a, [wYCoord]
	cp 9
	ret nz
	ld a, [wXCoord]
	cp 19
	ret nz
	ld a, $8
	ld [hSpriteIndexOrTextID], a
	ld a, SPRITE_FACING_RIGHT
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $8
	ld [wPlayerFacingDirection], a
	ld a, $8
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $FF ^ (A_BUTTON | B_BUTTON)
	ld [wJoyIgnore], a
	ret

ViridianCityScript7:
	call PushOldManSpriteCoords
	call LoadOldManBattleData
	SetEvent EVENT_02F
	ld a, D_UP | D_DOWN | D_LEFT | D_RIGHT | START | SELECT
	ld [wJoyIgnore], a
	ld a, $8
	ld [wViridianCityCurScript], a
	ret

ViridianCityScript8:
	call PopOldManSpriteCoords
	call UpdateSprites
	call Delay3
	SetEvent EVENT_02D
	ld a, D_UP | D_DOWN | D_LEFT | D_RIGHT | START | SELECT
	ld [wJoyIgnore], a
	ld a, $8
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wBattleType], a
	dec a
	ld [wJoyIgnore], a
	ld a, $9
	ld [wViridianCityCurScript], a
	ret

ViridianCityScript9:
	ld de, ViridianCityOldManMovementData2
	ld a, [wXCoord]
	cp 19
	jr z, .asm_191e4
	callab ViridianCity_MovePikachuOutOfOldMansWay
	ld de, ViridianCityOldManMovementData1
.asm_191e4
	ld a, $8
	ld [hSpriteIndexOrTextID], a
	call MoveSprite
	ld a, $a
	ld [wViridianCityCurScript], a
	ret

ViridianCityOldManMovementData1:
	db NPC_MOVEMENT_RIGHT
ViridianCityOldManMovementData2:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db $ff

ViridianCityScript10:
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, $3
	ld [wMissableObjectIndex], a
	predef HideObject
	xor a
	ld [wJoyIgnore], a
	ld a, $2
	ld [wViridianCityCurScript], a
	ret

ViridianCityTextPointers:
	dw ViridianCityText_0
	dw ViridianCityText_1
	dw ViridianCityText_2
	dw ViridianCityText_3
	dw ViridianCityText_4
	dw ViridianCityText_5
	dw ViridianCityText_6
	dw ViridianCityText_7
	dw ViridianCityText_8
	dw ViridianCityText_9
	dw ViridianCityText_10
	dw MartSignText
	dw PokeCenterSignText
	dw ViridianCityText_11
	dw ViridianCityText_12
	dw ViridianCityText_13

ViridianCityText_0:
	TX_ASM
	callba Func_f18bb
	jp TextScriptEnd

ViridianCityText_1:
	TX_ASM
	callba Func_f18c7
	jp TextScriptEnd

ViridianCityText_2:
	TX_ASM
	callba Func_f18e9
	jp TextScriptEnd

ViridianCityText_3:
	TX_ASM
	callba Func_f1911
	jp TextScriptEnd

ViridianCityText_4:
	TX_ASM
	callba Func_f192c
	jp TextScriptEnd

ViridianCityText_5:
	TX_ASM
	callba Func_f194a
	jp TextScriptEnd

ViridianCityText_6:
	TX_ASM
	callba Func_f198e
	jp TextScriptEnd

ViridianCityText_13:
	TX_MARKOV _ViridianCityText_19219
	db "@"

ViridianCityText_7:
	TX_ASM
	CheckEvent EVENT_02D
	jr nz, .asm_192a6
	ld hl, ViridianCityText_192af
	call PrintText
	ld c, 2
	call DelayFrames
	ld a, $7
	ld [wViridianCityCurScript], a
	jr .asm_192ac

.asm_192a6
	ld hl, ViridianCityText_192b4
	call PrintText
.asm_192ac
	jp TextScriptEnd

ViridianCityText_192af:
	TX_MARKOV _ViridianCityText_1920a
	db "@"

ViridianCityText_192b4:
	TX_MARKOV _OldManTextAfterBattle
	db "@"

ViridianCityText_8:
	TX_ASM
	callba Func_f19c5
	jp TextScriptEnd

ViridianCityText_9:
	TX_ASM
	callba Func_f19d1
	jp TextScriptEnd

ViridianCityText_10:
	TX_ASM
	callba Func_f19dd
	jp TextScriptEnd

ViridianCityText_11:
	TX_ASM
	callba Func_f19e9
	jp TextScriptEnd

ViridianCityText_12:
	TX_ASM
	callba Func_f19f5
	jp TextScriptEnd

