InitBattle:
	ld a, [wCurOpponent]
	and a
	jr z, InitBattle_check_b_button

InitOpponent:
	ld a, [wCurOpponent]
	ld [wcf91], a
	ld [wEnemyMonSpecies2], a
	jr InitOpponent_continue

InitBattle_check_b_button:
	ld a, [wd732]
	bit 1, a
	jr z, .skip_b_button_check
	ld a, [hJoyHeld]
	bit BIT_B_BUTTON, a ; B button pressed?
	ret nz
.skip_b_button_check
	ld a, [wNumberOfNoRandomBattleStepsLeft]
	and a
	ret nz
	callab TryDoWildEncounter
	ret nz
InitOpponent_continue:
	ld a, [wMapPalOffset]
	push af
	ld hl, wLetterPrintingDelayFlags
	ld a, [hl]
	push af
	res 1, [hl]
	call InitBattleVariables 
	ld a, [wEnemyMonSpecies2]
	sub OPP_OFFSET
	jp c, InitWildBattle
	ld [wTrainerClass], a
	call GetTrainerInformation
	callab ReadTrainer
	callab DoBattleTransitionAndInitBattleVariables
	call _LoadTrainerPic 
	xor a
	ld [wEnemyMonSpecies2], a
	ld [hStartTileID], a
	dec a
	ld [wAICount], a
	coord hl, 12, 0
	predef CopyUncompressedPicToTilemap
	ld a, $ff
	ld [wEnemyMonPartyPos], a
	ld a, $2
	ld [wIsInBattle], a

	; Is this a major story battle?
	ld a, [wLoneAttackNo]
	and a
	jp z, InitBattle_Common

	callabd_ModifyPikachuHappiness PIKAHAPPY_GYMLEADER ; useless since already in bank3d
	jp InitBattle_Common

InitWildBattle:
	ld a, $1
	ld [wIsInBattle], a
	callab LoadEnemyMonData
	callab DoBattleTransitionAndInitBattleVariables
	ld a, [wCurOpponent]
	cp MAROWAK
	jr z, .isGhost
	callab IsGhostBattle
	jr nz, .isNoGhost
.isGhost
	ld hl, wMonHSpriteDim
	ld a, $66
	ld [hli], a   ; write sprite dimensions
	ld bc, GhostPic
	ld a, c
	ld [hli], a   ; write front sprite pointer
	ld [hl], b
	ld hl, wEnemyMonNick  ; set name to "GHOST"
	ld a, "G"
	ld [hli], a
	ld a, "H"
	ld [hli], a
	ld a, "O"
	ld [hli], a
	ld a, "S"
	ld [hli], a
	ld a, "T"
	ld [hli], a
	ld [hl], "@"
	ld a, [wcf91]
	push af
	ld a, MON_GHOST
	ld [wcf91], a
	ld de, vFrontPic
	call LoadMonFrontSprite ; load ghost sprite
	pop af
	ld [wcf91], a
	jr .spriteLoaded

.isNoGhost
	ld de, vFrontPic
	call LoadMonFrontSprite ; load mon sprite
.spriteLoaded
	xor a
	ld [wTrainerClass], a
	ld [hStartTileID], a
	coord hl, 12, 0
	predef CopyUncompressedPicToTilemap

; common code that executes after init battle code specific to trainer or wild battles
InitBattle_Common:
	ld b, SET_PAL_BATTLE_BLACK
	call RunPaletteCommand
	callab SlidePlayerAndEnemySilhouettesOnScreen
	xor a
	ld [hBGMapMode], a
	ld hl, .emptyString
	call PrintText
	call SaveScreenTilesToBuffer1
	call ClearScreen
	ld a, $98
	ld [hBGMapAddress + 1], a
	ld a, $1
	ld [hBGMapMode], a
	call Delay3
	ld a, $9c
	ld [hBGMapAddress + 1], a
	call LoadScreenTilesFromBuffer1
	coord hl, 9, 7
	lb bc, 5, 10
	call ClearScreenArea
	coord hl, 1, 0
	lb bc, 4, 10
	call ClearScreenArea
	call ClearSprites
	ld a, [wIsInBattle]
	dec a ; is it a wild battle?
	jr nz, .skip
	callab DrawEnemyHUDAndHPBar ; draw enemy HUD and HP bar if it's a wild battle
.skip
	callab StartBattle
	callab EndOfBattle
	pop af
	ld [wLetterPrintingDelayFlags], a
	pop af
	ld [wMapPalOffset], a
	ld a, [wSavedTilesetType]
	ld [hTilesetType], a
	scf
	ret

.emptyString
	db "@"

_LoadTrainerPic:
; wd033-wd034 contain pointer to pic
	ld a, [wTrainerPicPointer] ; wd033
	ld e, a
	ld a, [wTrainerPicPointer + 1] ; wd034
	ld d, a ; de contains pointer to trainer pic
	ld a, [wLinkState]
	and a
	ld a, Bank(TrainerPics) ; this is where all the trainer pics are (not counting Red's)
	jr z, .loadSprite
	ld a, Bank(RedPicFront)
.loadSprite
	call UncompressSpriteFromDE
	ld de, vFrontPic
	ld a, $77
	ld c, a
	jp LoadUncompressedSpriteData

LoadMonBackPic:
; Assumes the monster's attributes have
; been loaded with GetMonHeader.
	ld a, [wBattleMonSpecies2]
	ld [wcf91], a
	coord hl, 1, 5
	lb bc, 7, 8
	call ClearScreenArea
	ld hl,  wMonHBackSprite - wMonHeader
	call UncompressMonSprite
	predef ScaleSpriteByTwo
	ld de, vBackPic
	call InterlaceMergeSpriteBuffers ; combine the two buffers to a single 2bpp sprite
	ld hl, vSprites
	ld de, vBackPic
	ld c, (2 * SPRITEBUFFERSIZE) / 16 ; count of 16-byte chunks to be copied
	ld a, [hROMBank]
	ld b, a
	jp CopyVideoData

AnimateSendingOutMon:
	ld a, [wPredefRegisters]
	ld h, a
	ld a, [wPredefRegisters + 1]
	ld l, a
	ld a, [hStartTileID]
	ld [hBaseTileID], a
	ld b, $4c
	ld a, [wIsInBattle]
	and a
	jr z, .not_in_battle
	add b
	ld [hl], a
	call Delay3
	ld bc, -(2 * SCREEN_WIDTH + 1)
	add hl, bc
	ld a, $1
	ld [wNumMovesMinusOne], a
	lb bc, 3, 3
	predef CopyDownscaledMonTiles
	ld c, 4
	call DelayFrames
	ld bc, -(2 * SCREEN_WIDTH + 1)
	add hl, bc
	xor a
	ld [wNumMovesMinusOne], a
	lb bc, 5, 5
	predef CopyDownscaledMonTiles
	ld c, 5
	call DelayFrames
	ld bc, -(2 * SCREEN_WIDTH + 1)
	jr .add_copy

.not_in_battle
	ld bc, -(6 * SCREEN_WIDTH + 3)
.add_copy
	add hl, bc
	ld a, [hBaseTileID]
	add 7 * 7
	jr CopyUncompressedPicToHL

CopyUncompressedPicToTilemap:
	ld a, [wPredefRegisters]
	ld h, a
	ld a, [wPredefRegisters + 1]
	ld l, a
	ld a, [hStartTileID]
CopyUncompressedPicToHL:
	lb bc, 7, 7
	ld de, SCREEN_WIDTH
	push af
	ld a, [wSpriteFlipped]
	and a
	jr nz, .right_to_left
	pop af
.l2r_row
	push bc
	push hl
.l2r_col
	ld [hl], a
	add hl, de
	inc a
	dec c
	jr nz, .l2r_col
	pop hl
	inc hl
	pop bc
	dec b
	jr nz, .l2r_row
	ret

.right_to_left
	push bc
	ld b, $0
	dec c
	add hl, bc
	pop bc
	pop af
.r2l_row
	push bc
	push hl
.r2l_col
	ld [hl], a
	add hl, de
	inc a
	dec c
	jr nz, .r2l_col
	pop hl
	dec hl
	pop bc
	dec b
	jr nz, .r2l_row
	ret

INCLUDE "engine/battle/init_battle_variables.asm"
INCLUDE "engine/battle/moveEffects/focus_energy_effect.asm"
INCLUDE "engine/battle/moveEffects/heal_effect.asm"
INCLUDE "engine/battle/moveEffects/transform_effect.asm"
INCLUDE "engine/battle/moveEffects/reflect_light_screen_effect.asm"
INCLUDE "engine/battle/moveEffects/mist_effect.asm"
INCLUDE "engine/battle/moveEffects/one_hit_ko_effect.asm"
INCLUDE "engine/battle/moveEffects/pay_day_effect.asm"
INCLUDE "engine/battle/moveEffects/paralyze_effect.asm"
