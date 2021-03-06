StarterPikachuBattleEntranceAnimation:
	coord hl, 0, 5
	ld c, 0
.loop1
	inc c
	ld a, c
	cp 9
	ret z
	ld d, 7 * 13
	push bc
	push hl
.loop2
	call .PlaceColumn
	dec hl
	ld a, d
	sub 7
	ld d, a
	dec c
	jr nz, .loop2
	ld c, 2
	call DelayFrames
	pop hl
	pop bc
	inc hl
	jr .loop1

.PlaceColumn:
	push hl
	push de
	push bc
	ld e, 7
.loop3
	ld a, d
	cp 7 * 7
	jr nc, .okay
	ld a, $7f
.okay
	ld [hl], a
	ld bc, SCREEN_WIDTH
	add hl, bc
	inc d
	dec e
	jr nz, .loop3
	pop bc
	pop de
	pop hl
	ret

INCLUDE "engine/battle/decrement_pp.asm"

ModifyPikachuHappiness::
	ld a, d
	cp PIKAHAPPY_GYMLEADER
	jr z, .checkanywhereinparty
	cp PIKAHAPPY_WALKING
	jr z, .checkanywhereinparty
	push de
	callab IsThisPartymonStarterPikachu_Party
	pop de
	ret nc
	jr .proceed

.checkanywhereinparty
	push de
	callab IsStarterPikachuInOurParty
	pop de
	ret nc

.proceed
	push de
	; Divide [wPikachuHappiness] by 100.  Hold the integer part in e.
	ld e, $0
	ld a, [wPikachuHappiness]
	cp 100
	jr c, .wPikachuHappiness_div_100
	inc e
	cp 200
	jr c, .wPikachuHappiness_div_100
	inc e
.wPikachuHappiness_div_100
	; Get the (d, e) entry from HappinessChangeTable.
	ld c, d
	dec c
	ld b, $0
	ld hl, HappinessChangeTable
	add hl, bc
	add hl, bc
	add hl, bc
	ld d, $0
	add hl, de
	ld a, [hl]
	; If [hl] is positive, take min(0xff, [hl] + [wPikachuHappiness]).
	; If [hl] is negative, take max(0x00, [hl] + [wPikachuHappiness]).
	; Inexplicably, we're using 100 as the threshold for comparison.
	cp 100
	ld a, [wPikachuHappiness]
	jr nc, .negative
	add [hl]
	jr nc, .okay
	ld a, -1
	jr .okay

.negative
	add [hl]
	jr c, .okay
	xor a
.okay
	ld [wPikachuHappiness], a

	; Restore d and get the d'th entry in PikachuMoods.
	pop de
	dec d
	ld hl, PikachuMoods
	ld e, d
	ld d, $0
	add hl, de
	ld a, [hl]
	ld b, a
	; Modify Pikachu's mood
	cp $80
	jr z, .done
	ld a, [wPikachuMood]
	jr c, .decreased
	cp b
	jr nc, .done
	ld a, [wContextDependentPikachuEmotion]
	and a
	jr nz, .done
	jr .update_mood

.decreased
	cp b
	jr c, .done
.update_mood
	ld a, b
	ld [wPikachuMood], a
.done
	ret

HappinessChangeTable:
	; Increase
	db   5, 3, 2 ; Gained a level
	db   5, 3, 2 ; HP restore
	db   1, 1, 0 ; Used X item
	db   3, 2, 1 ; Challenged Gym Leader
	db   1, 1, 0 ; Teach TM/HM
	db   2, 1, 1 ; Walking around
	; Decrease
	db  -3, -3, -5 ; Deposited
	db  -1, -1, -1 ; Fainted in battle
	db  -5, -5, -10 ; Fainted due to Poison outside of battle
	db  -5, -5, -10 ; Unknown (d = 10)
	db -10, -10, -20 ; Unknown (d = 11)

PikachuMoods:
	; Increase
	db $8a           ; Gained a level
	db $83           ; HP restore
	db $80           ; Teach TM/HM
	db $80           ; Challenged Gym Leader
	db $94           ; Unknown (d = 5)
	db $80           ; Unknown (d = 6)
	; Decrease
	db $62           ; Deposited
	db $6c           ; Fainted
	db $62           ; Unknown (d = 9)
	db $6c           ; Unknown (d = 10)
	db $00           ; Unknown (d = 11)

RedPicBack:       INCBIN "pic/trainer/redb.pic"
OldManPic:	       INCBIN "pic/trainer/oldman.pic"
ProfOakPicBack:   INCBIN "pic/ytrainer/prof.oakb.pic"

LoadYellowTitleScreenGFX:
	ld hl, PokemonLogoGraphics
	ld de, vChars2
	ld bc, 80 * $10
	ld a, BANK(PokemonLogoGraphics) ; redundant because this function is in bank3d
	call FarCopyData
	ld hl, YellowLogoGraphics0
	ld de, vChars0 + 80 * $10
	ld bc, 26 * $10
	ld a, BANK(YellowLogoGraphics0)
	call FarCopyData
	ld hl, YellowLogoGraphics1
	ld de, vChars0 + 253 * $10
	ld bc, 3 * $10
	ld a, BANK(YellowLogoGraphics1)
	call FarCopyData
	ld hl, YellowLogoGraphics2
	ld de, vChars1
	ld bc, 78 * $10
	ld a, BANK(YellowLogoGraphics2)
	call FarCopyData
	ld hl, YellowLogoGraphics3
	ld de, vChars1 + 112 * $10
	ld bc, 6 * $10
	ld a, BANK(YellowLogoGraphics3)
	call FarCopyData
	ld hl, YellowLogoGraphics4
	ld de, vChars2 + 106 * $10
	ld bc, 9 * $10
	ld a, BANK(YellowLogoGraphics4)
	jp FarCopyData

TitleScreen_PlacePokemonLogo:
	coord hl, 2, 1
	ld de, TitleScreenPokemonLogoTilemap
	lb bc, 7, 16
	call Bank3D_CopyBox
	ret

TitleScreen_PlacePikaSpeechBubble:
	ld hl, TitleScreenPikaBubbleOAM
	ld de, wOAMBuffer + 4 * 4
	ld bc, 4 * 27
	jp CopyData

TitleScreen_PlacePikachu:
	coord hl, 4, 8
	ld de, TitleScreenPikachuTilemap
	lb bc, 9, 12
	call Bank3D_CopyBox
	ld hl, TitleScreenPikachuEyesOAMData
	ld de, wOAMBuffer
	ld bc, $10
	call CopyData
	ret

TitleScreenPikachuEyesOAMData:
	db $70, $48, $f0, $22
	db $78, $48, $f1, $22
	db $70, $60, $f0, $02
	db $78, $60, $f1, $02

Bank3D_CopyBox:
; copy cxb (xy) screen area from de to hl
.row
	push bc
	push hl
.col
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret

TitleScreenPokemonLogoTilemap:
; 16x7 (xy)
	db $f4, $f4, $f4, $f4, $f4, $f4, $49, $f4, $72, $30, $f4, $f4, $f4, $f4, $f4, $f4
	db $fd, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $f4, $0d, $0e, $0f
	db $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $1e, $1f
	db $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f
	db $f4, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e, $3f
	db $f4, $41, $42, $43, $44, $45, $46, $47, $48, $f4, $4a, $4b, $4c, $4d, $4e, $4f
	db $f4, $6a, $6b, $6c, $6d, $f4, $f4, $f4, $f4, $f4, $f4, $6e, $6f, $70, $71, $f4

Pointer_f4669:
; Unreferenced
	db $47, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f, $5f

; TitleScreenPikaBubbleTilemap:
; ; 7x4 (xy)
	; db $24, $25, $66, $67, $68, $69, $2a
	; db $50, $51, $52, $53, $54, $55, $56
	; db $57, $58, $59, $5a, $5b, $5c, $5d
	; db $6d, $5e, $5f, $60, $61, $62, $63

TitleScreenPikaBubbleOAM:
	db $30, $48, $66, $00
	db $30, $50, $67, $00
	db $30, $58, $68, $00
	db $30, $60, $69, $00
	db $38, $38, $50, $00
	db $38, $40, $51, $00
	db $38, $48, $52, $00
	db $38, $50, $53, $00
	db $38, $58, $54, $00
	db $38, $60, $55, $00
	db $38, $68, $56, $00
	db $40, $38, $57, $00
	db $40, $40, $58, $00
	db $40, $48, $59, $00
	db $40, $50, $5a, $00
	db $40, $58, $5b, $00
	db $40, $60, $5c, $00
	db $40, $68, $5d, $00
	db $48, $40, $5e, $00
	db $48, $48, $5f, $00
	db $48, $50, $60, $00
	db $48, $58, $61, $00
	db $48, $60, $62, $00
	db $48, $68, $63, $00
	db $50, $50, $64, $00
	db $50, $58, $65, $00

TitleScreenPikachuTilemap:
; 12x9 (xy)
	db $00, $00, $00, $00, $00, $80, $81, $82, $83, $84, $00, $00
	db $00, $00, $00, $00, $00, $85, $86, $87, $88, $89, $8a, $00
	db $00, $00, $8b, $00, $8c, $8d, $8e, $8f, $90, $91, $92, $00
	db $00, $00, $93, $94, $95, $96, $97, $98, $99, $9a, $9b, $00
	db $00, $9c, $9d, $9e, $9f, $a0, $a1, $a2, $a3, $a4, $a5, $00
	db $00, $a6, $a7, $a8, $a9, $aa, $ab, $ac, $ad, $ae, $af, $00
	db $00, $b0, $b1, $b2, $b3, $b4, $b5, $b6, $b7, $b8, $b9, $00
	db $00, $ba, $bb, $bc, $bd, $be, $bf, $c0, $c1, $c2, $c3, $00
	db $00, $c4, $c5, $c6, $c7, $c8, $c9, $ca, $cb, $cc, $cd, $00

; f46f9 (3d:46f9)
PokemonLogoGraphics:	     INCBIN "gfx/pokemon_logo.2bpp"
PokemonLogoGraphicsEnd:
YellowLogoGraphics0:
INCBIN "gfx/yellow_titlescreen0.w56.t2.2bpp"
YellowLogoGraphics4:
INCBIN "gfx/yellow_titlescreen4.2bpp"
YellowLogoGraphics1:
INCBIN "gfx/yellow_titlescreen1.w24.2bpp"
YellowLogoGraphics2:
INCBIN "gfx/yellow_titlescreen2.w64.t2.2bpp"
YellowLogoGraphics3:
INCBIN "gfx/yellow_titlescreen3.interleave.w24.2bpp"
YellowLogoGraphicsEnd:

INCLUDE "engine/menu/link_menu.asm"

HandleMenuInputDouble:
	xor a
	ld [wPartyMenuAnimMonEnabled], a

HandleMenuInputPokemonSelectionDouble:
	ld a, [hDownArrowBlinkCnt1]
	push af
	ld a, [hDownArrowBlinkCnt2]
	push af ; save existing values on stack
	xor a
	ld [hDownArrowBlinkCnt1], a ; blinking down arrow timing value 1
	ld a, $06
	ld [hDownArrowBlinkCnt2], a ; blinking down arrow timing value 2
.loop1
	xor a
	ld [wAnimCounter], a ; counter for pokemon shaking animation
	call .UpdateCursorTile
	call JoypadLowSensitivity
	ld a, [hJoy5]
	and a ; was a key pressed?
	jr nz, .keyPressed
	pop af
	ld [hDownArrowBlinkCnt2], a
	pop af
	ld [hDownArrowBlinkCnt1], a ; restore previous values
	xor a
	ld [wMenuWrappingEnabled], a ; disable menu wrapping
	ret

.keyPressed
	xor a
	ld [wCheckFor180DegreeTurn], a
	ld a, [hJoy5]
	ld b, a
	bit 6, a ; pressed Up key?
	jr z, .checkIfDownPressed
.upPressed
	ld a, [wCurrentMenuItem] ; selected menu item
	and a ; already at the top of the menu?
	jr z, .checkOtherKeys
.notAtTop
	dec a
	ld [wCurrentMenuItem], a ; move selected menu item up one space
	jr .checkOtherKeys

.checkIfDownPressed
	bit 7, a
	jr z, .checkOtherKeys
.downPressed
	ld a, [wCurrentMenuItem]
	inc a
	ld c, a
	ld a, [wMaxMenuItem]
	cp c
	jr c, .checkOtherKeys
	ld a, c
	ld [wCurrentMenuItem], a
.checkOtherKeys
	ld a, [wMenuWatchedKeys]
	and b ; does the menu care about any of the pressed keys?
	jp z, .loop1
.checkIfAButtonOrBButtonPressed
	ld a, [hJoy5]
	and A_BUTTON | B_BUTTON
	jr z, .skipPlayingSound
.AButtonOrBButtonPressed
	ld a, SFX_PRESS_AB
	call PlaySound ; play sound
.skipPlayingSound
	pop af
	ld [hDownArrowBlinkCnt2], a
	pop af
	ld [hDownArrowBlinkCnt1], a ; restore previous values
	ld a, [hJoy5]
	ret

.UpdateCursorTile:
	ld a, [wTopMenuItemY]
	and a
	jr z, .asm_f5ac0
	coord hl, 0, 0
	ld bc, SCREEN_WIDTH
.loop
	add hl, bc
	dec a
	jr nz, .loop
.asm_f5ac0
	ld a, [wTopMenuItemX]
	ld b, $0
	ld c, a
	add hl, bc
	push hl
	ld a, [wLastMenuItem]
	and a
	jr z, .asm_f5ad5
	ld bc, $28
.loop2
	add hl, bc
	dec a
	jr nz, .loop2
.asm_f5ad5
	ld a, [hl]
	cp "▶"
	jr nz, .asm_f5ade
	ld a, [wTileBehindCursor]
	ld [hl], a
.asm_f5ade
	pop hl
	ld a, [wCurrentMenuItem]
	and a
	jr z, .asm_f5aec
	ld bc, $28
.loop3
	add hl, bc
	dec a
	jr nz, .loop3
.asm_f5aec
	ld a, [hl]
	cp "▶"
	jr z, .asm_f5af4
	ld [wTileBehindCursor], a
.asm_f5af4
	ld a, "▶"
	ld [hl], a
	ld a, l
	ld [wMenuCursorLocation], a
	ld a, h
	ld [wMenuCursorLocation + 1], a
	ld a, [wCurrentMenuItem]
	ld [wLastMenuItem], a
	ret

_BoulderText::
	TX_ASM
	ld a, [wd728]
	bit 0, a
	ld hl, Text_f5b28
	ret nz
	ld a, [wObtainedBadges]
	bit 3, a
	ld hl, .Terminator
	ret z
	ld a, STRENGTH
	ld [wMoveNum], a
	push bc
	callba CheckIfAnyMonKnowsMove
	pop bc
	ld hl, .Terminator
	ret c
	ld hl, .AskStrengthText
	ret

.Terminator
	TX_FAR __BoulderText
.Terminator2
	db "@"

.AskStrengthText
	TX_FAR AskStrengthText
	TX_ASM
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .skip
	call GetPartyMonName2
	ld a, [wWhichPokemon]
	add wPartySpecies % $100
	ld l, a
	ld h, wPartySpecies / $100
	ld a, [hl]
	ld [wcf91], a
	call PrintStrengthTxt_
	ld hl, .Terminator2
	ret

.skip
	add sp, 14
	jp CloseTextDisplay

PrintStrengthTxt:
	call PrintStrengthTxt_
	jp ManualTextScroll

PrintStrengthTxt_:
	ld hl, wd728
	set 0, [hl]
	ld hl, Text_f5b17
	call PrintText
	ld a, [wcf91]
	call PlayCry
	call Delay3
	ld hl, Text_f5b28
	jp PrintText

Text_f5b17:
	TX_FAR _UsedStrengthText ; 2d:417e
	db "@"

Text_f5b28:
	TX_FAR _CanMoveBouldersText ; 2d:4193
	db "@"

TrySurfOW:
	ld a, SURF
	ld [wMoveNum], a
	callba CheckIfAnyMonKnowsMove
	ret c
	ld a, [wObtainedBadges]
	bit 4, a
	scf
	ret z
	call IsSurfingAllowed
	ld a, [wd728]
	bit 1, a
	scf
	ret z
	ld a, [wWalkBikeSurfState]
	cp 2
	scf
	ret z
	callba AutoMapTextBox
	ld hl, .AskSurfText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	call GetPartyMonName2
	callba ItemUseSurfboard
.done
	call CloseTextDisplay
	xor a
	ret

.AskSurfText
	TX_FAR _AskSurfText
	db "@"

IsSurfingAllowed:
; Returns whether surfing is allowed in bit 1 of wd728.
; Surfing isn't allowed on the Cycling Road or in the lowest level of the
; Seafoam Islands before the current has been slowed with boulders.
	ld hl, wd728
	set 1, [hl]
	ld a, [wd732]
	bit 5, a
	jr nz, .forcedToRideBike
	ld a, [wCurMap]
	cp SEAFOAM_ISLANDS_5
	ret nz
	CheckBothEventsSet EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM4_BOULDER2_DOWN_HOLE
	ret z
	ld hl, CoordsData_f5b64
	call ArePlayerCoordsInArray
	ret nc
	ld hl, wd728
	res 1, [hl]
	ld hl, CurrentTooFastText
	jp PrintText

.forcedToRideBike
	ld hl, wd728
	res 1, [hl]
	ld hl, CyclingIsFunText
	jp PrintText

CoordsData_f5b64:
	db 11, 07
	db $ff

CurrentTooFastText:
	TX_FAR _CurrentTooFastText ; 2d:41ab
	db "@"

CyclingIsFunText:
	TX_FAR _CyclingIsFunText ; 2d:41ca
	db "@"

AddItemToInventory_:
	ld a, [wItemQuantity] ; a = item quantity
	push af
	push bc
	push de
	push hl
	push hl
	ld d, PC_ITEM_CAPACITY ; how many items the PC can hold
	ld a, wNumBagItems & $FF
	cp l
	jr nz, .checkIfInventoryFull
	ld a, wNumBagItems >> 8
	cp h
	jr nz, .checkIfInventoryFull
; if the destination is the bag
	ld d, BAG_ITEM_CAPACITY ; how many items the bag can hold
.checkIfInventoryFull
	ld a, [hl]
	sub d
	ld d, a
	ld a, [hli]
	and a
	jr z, .addNewItem
.notAtEndOfInventory
	ld a, [hli]
	ld b, a ; b = ID of current item in table
	ld a, [wcf91] ; a = ID of item being added
	cp b ; does the current item in the table match the item being added?
	jp z, .increaseItemQuantity ; if so, increase the item's quantity
	inc hl
.loop
	ld a, [hl]
	cp $ff ; is it the end of the table?
	jr nz, .notAtEndOfInventory
.addNewItem ; add an item not yet in the inventory
	pop hl
	ld a, d
	and a ; is there room for a new item slot?
	jr z, .done
; if there is room
	inc [hl] ; increment the number of items in the inventory
	ld a, [hl] ; the number of items will be the index of the new item
	add a
	dec a
	ld c, a
	ld b, 0
	add hl, bc ; hl = address to store the item
	ld a, [wcf91]
	ld [hli], a ; store item ID
	ld a, [wItemQuantity]
	ld [hli], a ; store item quantity
	ld [hl], $ff ; store terminator
	jp .success

.increaseItemQuantity ; increase the quantity of an item already in the inventory
	ld a, [wItemQuantity]
	ld b, a ; b = quantity to add
	ld a, [hl] ; a = existing item quantity
	add b ; a = new item quantity
	cp 100
	jp c, .storeNewQuantity ; if the new quantity is less than 100, store it
; if the new quantity is greater than or equal to 100,
; try to max out the current slot and add the rest in a new slot
	sub 99
	ld [wItemQuantity], a ; a = amount left over (to put in the new slot)
	ld a, d
	and a ; is there room for a new item slot?
	jr z, .increaseItemQuantityFailed
; if so, store 99 in the current slot and store the rest in a new slot
	ld a, 99
	ld [hli], a
	jp .loop

.increaseItemQuantityFailed
	pop hl
	and a
	jr .done

.storeNewQuantity
	ld [hl], a
	pop hl
.success
	scf
.done
	pop hl
	pop de
	pop bc
	pop bc
	ld a, b
	ld [wItemQuantity], a ; restore the initial value from when the function was called
	ret

; function to remove an item (in varying quantities) from the player's bag or PC box
; INPUT:
; hl = address of inventory (either wNumBagItems or wNumBoxItems)
; [wWhichPokemon] = index (within the inventory) of the item to remove
; [wItemQuantity] = quantity to remove
RemoveItemFromInventory_:
	push hl
	inc hl
	ld a, [wWhichPokemon] ; index (within the inventory) of the item being removed
	add a
	add l
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	inc hl
	ld a, [wItemQuantity] ; quantity being removed
	ld e, a
	ld a, [hl] ; a = current quantity
	sub e
	ld [hld], a ; store new quantity
	ld [wMaxItemQuantity], a
	and a
	jr nz, .skipMovingUpSlots
; if the remaining quantity is 0,
; remove the emptied item slot and move up all the following item slots
.moveSlotsUp
	ld e, l
	ld d, h
	inc de
	inc de ; de = address of the slot following the emptied one
.loop ; loop to move up the following slots
	ld a, [de]
	inc de
	ld [hli], a
	cp $ff
	jr nz, .loop
; update menu info
	xor a
	ld [wListScrollOffset], a
	ld [wCurrentMenuItem], a
	ld [wBagSavedMenuItem], a
	ld [wSavedListScrollOffset], a
	pop hl
	ld a, [hl] ; a = number of items in inventory
	dec a ; decrement the number of items
	ld [hl], a ; store new number of items
	ld [wListCount], a
	cp 2
	jr c, .done
	ld [wMaxMenuItem], a
	jr .done

.skipMovingUpSlots
	pop hl
.done
	ret

TrainerInfoTextBoxTileGraphics:	INCBIN "gfx/trainer_info.2bpp"
TrainerInfoTextBoxTileGraphicsEnd:
BlankLeaderNames:				INCBIN "gfx/blank_leader_names.2bpp"
CircleTile:						INCBIN "gfx/circle_tile.2bpp"
BadgeNumbersTileGraphics:		INCBIN "gfx/badge_numbers.2bpp"

ReadSuperRodData:
	ld a, [wCurMap]
	ld c, a
	ld hl, FishingSlots
.loop
	ld a, [hli]
	cp $ff
	jr z, .notfound
	cp c
	jr z, .found
	ld de, $8
	add hl, de
	jr .loop

.found
	call GenerateRandomFishingEncounter
	ret

.notfound
	ld de, $0
	ret

GenerateRandomFishingEncounter:
	call Random
	cp $66
	jr c, .asm_f5ed6
	inc hl
	inc hl
	cp $b2
	jr c, .asm_f5ed6
	inc hl
	inc hl
	cp $e5
	jr c, .asm_f5ed6
	inc hl
	inc hl
.asm_f5ed6
	ld e, [hl]
	inc hl
	ld d, [hl]
	ret

