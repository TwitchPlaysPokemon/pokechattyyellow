FanClubScript:
	jp EnableAutoTextBoxDrawing
	; call EnableAutoTextBoxDrawing
	; ld hl, FanClubScriptPointers
	; ld a, [wFanClubCurScript]
	; rst Jumptable
	; ret

; FanClubScriptPointers:
	; dw FanClubScript1
	; dw FanClubScript2

; FanClubScript1:
	; ld hl, wd492
	; bit 7, [hl]
	; call z, FanClubScript_MovePikachuToSeel
	; ld hl, wd492
	; set 7, [hl]
	; ret

; FanClubScript2:
	; ld hl, wd492
	; bit 7, [hl]
	; call z, FanClubScript_MovePikachuToSeel10percentOfTheTime
	; ld hl, wd492
	; set 7, [hl]
	; ret

; FanClubScript_MovePikachuToSeel10percentOfTheTime:
	; call Random
	; ld a, [hRandomAdd]
	; cp 10 percent
	; call c, FanClubScript_MovePikachuToSeel
	; ret

; FanClubScript_MovePikachuToSeel:
	; ld a, [wd472]
	; bit 7, a
	; ret z
	; ld e, $ff
	; callab CheckPikachuStatused
	; ret c
	; ld a, $1
	; ld [wFanClubCurScript], a
	; xor a
	; ld [wPlayerMovingDirection], a
	; call UpdateSprites
	; call UpdateSprites
	; ld a, EXCLAMATION_BUBBLE
	; ld [wWhichEmotionBubble], a
	; ld a, $f ; Pikachu
	; ld [wEmotionBubbleSpriteIndex], a
	; predef EmotionBubble
	; ld hl, .MovementData
	; call ApplyPikachuMovementData
	; ld a, $2
	; ld [wSprite03MovementStatus], a ; Seel
	; xor a ; SPRITE_FACING_DOWN
	; ld [wSprite03FacingDirection], a
	; callab InitializePikachuTextID
	; call DisablePikachuFollowingPlayer
	; ret

; .MovementData:
	; db $00
	; db $26
	; db $20
	; db $20
	; db $20
	; db $1e
	; db $3f

FanClubTextPointers:
	dw FanClubText1
	dw FanClubText2
	dw FanClubText3
	dw FanClubText4
	dw FanClubText5
	dw FanClubText6

FanClubText1:
; clefairy fan
	TX_ASM
	CheckEventHL EVENT_152
	jr z, .asm_59aaf
	ld hl, .yellowtext
	call PrintText
	jr .done

.asm_59aaf
	CheckEventReuseHL EVENT_PIKACHU_FAN_BOAST
	jr nz, .mineisbetter
	SetEventReuseHL EVENT_SEEL_FAN_BOAST
	ld hl, .normaltext
	call PrintText
	jr .done

.mineisbetter
	ResetEventReuseHL EVENT_PIKACHU_FAN_BOAST
	ld hl, .bettertext
	call PrintText
.done
	jp TextScriptEnd

.normaltext
	TX_MARKOV PikachuFanText
	db "@"

.bettertext
	TX_MARKOV PikachuFanBetterText
	db "@"

.yellowtext
	TX_MARKOV PikachuFanPrintText
	db "@"

FanClubText2:
; seel fan
	TX_ASM
	CheckEventHL EVENT_152
	jr z, .asm_59ae7
	ld hl, .yellowtext
	call PrintText
	jr .done
.asm_59ae7
	CheckEventReuseHL EVENT_SEEL_FAN_BOAST
	jr nz, .mineisbetter
	SetEventReuseHL EVENT_PIKACHU_FAN_BOAST
	ld hl, .normaltext
	call PrintText
	jr .done
.mineisbetter
	ResetEventReuseHL EVENT_SEEL_FAN_BOAST
	ld hl, .bettertext
	call PrintText
.done
	jp TextScriptEnd

.normaltext
	TX_MARKOV SeelFanText
	db "@"

.bettertext
	TX_MARKOV SeelFanBetterText
	db "@"

.yellowtext
	TX_MARKOV SeelFanPrintText
	db "@"

FanClubText3:
; pikachu
	TX_ASM
	ld hl, .text
	call PrintText
	ld a, CLEFAIRY
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

.text
	TX_MARKOV FanClubPikachuText
	db "@"

FanClubText4:
; seel
	TX_ASM
	ld hl, .text
	call PrintText
	ld a, SEEL
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

.text
	TX_MARKOV FanClubSeelText
	db "@"

FanClubText5:
; chair
	TX_ASM
	CheckEventHL EVENT_152
	jr z, .check_bike_voucher
	ld hl, Text_59c1f
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr z, .select_mon_to_print
	ld hl, Text_59c24
	jr .gbpals_print_text

.check_bike_voucher
	CheckEvent EVENT_GOT_BIKE_VOUCHER
	jr nz, .got_bike_voucher_already
	ld hl, Text_59bfc
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .declined_story
	ld hl, Text_59c01
	call PrintText
	lb bc, BIKE_VOUCHER, 1
	call GiveItem
	jr nc, .no_room_for_voucher
	ld hl, Text_59c06
	call PrintText
	SetEvent EVENT_GOT_BIKE_VOUCHER
	jp TextScriptEnd

.no_room_for_voucher
	ld hl, Text_59c1a
	jr .gbpals_print_text

.declined_story
	ld hl, Text_59c10
	jr .gbpals_print_text

.got_bike_voucher_already
	ld hl, Text_59c15
.gbpals_print_text
	push hl
	call LoadGBPal
	pop hl
	call PrintText
	jp TextScriptEnd

.select_mon_to_print
	call GBPalWhiteOutWithDelay3
	call LoadCurrentMapView
	call SaveScreenTilesToBuffer2
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	ld a, $00
	ld [wTempTilesetNumTiles], a
	call DisplayPartyMenu
	jp nc, .print
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	ld hl, Text_59c24
	jr .gbpals_print_text

.print
	xor a
	ld [wUpdateSpritesEnabled], a
	ld hl, wd730
	set 6, [hl]
	callab PrintFanClubPortrait
	ld hl, wd730
	res 6, [hl]
	call GBPalWhiteOutWithDelay3
	call ReloadTilesetTilePatterns
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadScreenTilesFromBuffer2
	call Delay3
	call GBPalNormal
	ld hl, Text_59c2e
	ld a, [hOaksAideResult]
	and a
	jr nz, .gbpals_print_text
	ld hl, Text_59c29
	jr .gbpals_print_text

Text_59bfc:
	TX_MARKOV FanClubMeetChairText
	db "@"

Text_59c01:
	TX_MARKOV FanClubChairStoryText
	db "@"

Text_59c06:
	TX_MARKOV ReceivedBikeVoucherText
	TX_SFX_KEY_ITEM
	TX_MARKOV ExplainBikeVoucherText
	db "@"

Text_59c10:
	TX_MARKOV FanClubNoStoryText
	db "@"

Text_59c15:
	TX_MARKOV FanClubChairFinalText
	db "@"

Text_59c1a:
	TX_MARKOV FanClubBagFullText
	db "@"

Text_59c1f:
	TX_MARKOV FanClubChairPrintText1
	db "@"

Text_59c24:
	TX_MARKOV FanClubChairPrintText2
	db "@"

Text_59c29:
	TX_MARKOV FanClubChairPrintText3
	db "@"

Text_59c2e:
	TX_MARKOV FanClubChairPrintText4
	db "@"

FanClubText6:
	TX_MARKOV _FanClubText6
	db "@"
