GetPikaPicAnimationScriptIndex:
	; ld hl, PikachuMoodLookupTable
	; ld a, [wPikachuMood]
	; ld d, a
; .get_mood_param
	; ld a, [hli]
	; inc hl
	; cp d
	; jr c, .get_mood_param
	; dec hl
	; ld e, [hl]
	ld hl, PikaPicAnimationScriptPointerLookupTable
	ld a, [wPikachuHappiness]
	ld d, a
	ld bc, 6
.get_happiness_param
	; ld a, [hl]
	ld a, [hli]
	cp d
	ld a, [hli]
	; jr nc, .got_animation
	; add hl, bc
	; jr .get_happiness_param

	jr c, .get_happiness_param

; .got_animation
	; ld d, 0
	; add hl, de
	; ld a, [hl]
	ret

; PikachuMoodLookupTable:
; ; First byte: mood threshold
; ; Second byte: column index in PikaPicAnimationScriptPointerLookupTable
	; db  40, 1
	; db 127, 2
	; db 128, 3
	; db 210, 4
	; db 255, 5

PikaPicAnimationScriptPointerLookupTable:
; First byte: happiness threshold
; Remaining bytes: loaded based on Pikachu's mood
	db 50
	; dpikaemotion PikachuEmotion_Mood1Happy1
	; dpikaemotion PikachuEmotion_Mood1Happy1
	dpikaemotion PikachuEmotion_Mood2Happy1
	; dpikaemotion PikachuEmotion_Mood3Happy1
	; dpikaemotion PikachuEmotion_Mood3Happy1

	db 100
	; dpikaemotion PikachuEmotion_Mood1Happy2
	; dpikaemotion PikachuEmotion_Mood1Happy2
	dpikaemotion PikachuEmotion_Mood2Happy2
	; dpikaemotion PikachuEmotion_Mood3Happy2
	; dpikaemotion PikachuEmotion_Mood3Happy2

	db 130
	; dpikaemotion PikachuEmotion_Mood1Happy3
	; dpikaemotion PikachuEmotion_Mood1Happy3
	dpikaemotion PikachuEmotion_Mood2Happy3
	; dpikaemotion PikachuEmotion_Mood3Happy3
	; dpikaemotion PikachuEmotion_Mood3Happy3

	db 160
	; dpikaemotion PikachuEmotion_Mood1Happy3
	; dpikaemotion PikachuEmotion_Mood1Happy3
	dpikaemotion PikachuEmotion_Mood2Happy4
	; dpikaemotion PikachuEmotion_Mood3Happy4
	; dpikaemotion PikachuEmotion_Mood3Happy4

	db 200
	; dpikaemotion PikachuEmotion_Mood1Happy5
	; dpikaemotion PikachuEmotion_Mood1Happy5
	dpikaemotion PikachuEmotion_Mood2Happy5
	; dpikaemotion PikachuEmotion_Mood3Happy5
	; dpikaemotion PikachuEmotion_Mood3Happy5

	db 250
	; dpikaemotion PikachuEmotion_Mood1Happy5
	; dpikaemotion PikachuEmotion_Mood1Happy5
	dpikaemotion PikachuEmotion_Mood2Happy6
	; dpikaemotion PikachuEmotion_Mood3Happy6
	; dpikaemotion PikachuEmotion_Mood3Happy6

	db 255
	; dpikaemotion PikachuEmotion_Mood1Happy5
	; dpikaemotion PikachuEmotion_Mood1Happy5
	dpikaemotion PikachuEmotion_Mood2Happy7
	; dpikaemotion PikachuEmotion_Mood3Happy7
	; dpikaemotion PikachuEmotion_Mood3Happy7

StarterPikachuEmotionCommand_pikapic:
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld a, [de]
	ld [wPikaPicAnimNumber], a
	inc de
	push de
	call .RunPikapic
	pop de
	pop af
	ld [hBGMapMode], a
	ret

.RunPikapic:
	call PlacePikapicTextBoxBorder
	callab LoadOverworldPikachuFrontpicPalettes
	call ResetPikaPicAnimBuffer
	call LoadCurrentPikaPicAnimScriptPointer
	call ExecutePikaPicAnimScript
	call PlacePikapicTextBoxBorder
	call RunDefaultPaletteCommand
	ret

ResetPikaPicAnimBuffer:
	ld hl, wCurPikaMovementData
	ld bc, wCurPikaMovementDataEnd - wCurPikaMovementData
	xor a
	call FillMemory
	ld hl, wPikaPicAnimObjectDataBufferSize
	ld bc, wPikaPicAnimObjectDataBufferEnd - wPikaPicAnimObjectDataBufferSize
	xor a
	call FillMemory
	call ClearPikaPicUsedGFXBuffer
	ld hl, 100
	ld a, l
	ld [wPikaPicAnimTimer], a
	ld a, h
	ld [wPikaPicAnimTimer + 1], a
	ld a, $7
	ld [wPikaPicPikaDrawStartX], a
	ld a, $6
	ld [wPikaPicPikaDrawStartY], a
	ret

PlacePikapicTextBoxBorder:
	xor a
	ld [hBGMapMode], a
	coord hl, 6, 5
	lb bc, 5, 5
	call TextBoxBorder
	call Delay3
	call UpdateSprites
	ld a, $1
	ld [hBGMapMode], a
	call Delay3
	ret

LoadCurrentPikaPicAnimScriptPointer:
	ld a, [wPikaPicAnimNumber]
	cp $1d
	jr c, .valid
	ld a, $0
.valid
	ld e, a
	ld d, 0
	ld hl, PikaPicAnimPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call UpdatePikaPicAnimPointer
	ret

PikaPicAnimPointers:
pikapic_def: macro
\1_id: dw \1
endm

	pikapic_def PikaPicAnimScript_00  ; 00
	pikapic_def PikaPicAnimScript_Mood2Happy3  ; 01
; 	pikapic_def PikaPicAnimScript_Mood3Happy5  ; 02
; 	pikapic_def PikaPicAnimScript_Mood1Happy3  ; 03
	pikapic_def PikaPicAnimScript_Mood2Happy4  ; 04
	pikapic_def PikaPicAnimScript_Mood2Happy2  ; 05
	pikapic_def PikaPicAnimScript_Mood2Happy1  ; 06
	pikapic_def PikaPicAnimScript_Mood2Happy5  ; 07
; 	pikapic_def PikaPicAnimScript_Mood3Happy3  ; 08
; 	pikapic_def PikaPicAnimScript_Mood1Happy2  ; 09
; 	pikapic_def PikaPicAnimScript_Mood3Happy6 ; 0a
	pikapic_def PikaPicAnimScript_FastAsleep ; 0b
; 	pikapic_def PikaPicAnimScript_Mood3Happy2 ; 0c
; 	pikapic_def PikaPicAnimScript_Mood3Happy1 ; 0d
; 	pikapic_def PikaPicAnimScript_Mood1Happy1 ; 0e
; 	pikapic_def PikaPicAnimScript_Mood3Happy4 ; 0f
	pikapic_def PikaPicAnimScript_Mood2Happy6 ; 10
; 	pikapic_def PikaPicAnimScript_Mood1Happy5 ; 11
	pikapic_def PikaPicAnimScript_CaughtPokemon ; 12
	pikapic_def PikaPicAnimScript_Mood2Happy7 ; 13
	; pikapic_def PikaPicAnimScript_Mood3Happy7 ; 14
	pikapic_def PikaPicAnimScript_FishingRod ; 15
	pikapic_def PikaPicAnimScript_LavenderTown ; 16
	pikapic_def PikaPicAnimScript_BillFirstTime ; 17
	pikapic_def PikaPicAnimScript_Burned ; 18
	pikapic_def PikaPicAnimScript_LowHP ; 19
	pikapic_def PikaPicAnimScript_PewterWake ; 1a
	pikapic_def PikaPicAnimScript_BillEmergeFromTeleporter ; 1b
	pikapic_def PikaPicAnimScript_Statused ; 1c
	pikapic_def PikaPicAnimScript_1d ; 1d

ExecutePikaPicAnimScript:
.loop
	xor a
	ld [hBGMapMode], a
	call RunPikaPicAnimSetupScript
	call DummyFunction_fdad5
	call AnimateCurrentPikaPicAnimFrame
	call DummyFunction_fdad5
	ld a, $1
	ld [hBGMapMode], a
	call PikaPicAnimTimerAndJoypad
	and a
	jr z, .loop
	ret

PikaPicAnimTimerAndJoypad:
	call Delay3
	call CheckPikaPicAnimTimer
	and a
IF !DEF(MARKOV)
	ret nz
	call JoypadLowSensitivity
	ld a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
ENDC
	ret

CheckPikaPicAnimTimer:
	ld hl, wPikaPicAnimTimer
	dec [hl]
	jr nz, .not_done_yet
	inc hl
	ld a, [hl]
	and a
	jr z, .timer_expired
	dec [hl]
.not_done_yet
	xor a
	ret

.timer_expired
	ld a, $1
	ret

DummyFunction_fdad5:
	ret

AnimateCurrentPikaPicAnimFrame:
	ld bc, wPikaPicAnimObjectDataBuffer
	ld a, 4
.loop
	push af
	push bc
	ld hl, 0 ; struct index
	add hl, bc
	ld a, [hli]
	and a
	jr z, .skip
	ld a, [hli]
	ld [wCurPikaPicAnimObjectScriptIdx], a
	ld a, [hli]
	ld [wCurPikaPicAnimObjectFrameIdx], a
	ld a, [hli]
	ld [wCurPikaPicAnimObjectFrameTimer], a
	ld a, [hli]
	ld [wCurPikaPicAnimObjectVTileOffset], a
	ld a, [hli]
	ld [wCurPikaPicAnimObjectXOffset], a
	ld a, [hli]
	ld [wCurPikaPicAnimObjectYOffset], a
	ld a, [hli]
	ld [wCurPikaPicAnimObject + 6], a
	push bc
	call LoadPikaPicAnimObjectData
	pop bc
	ld hl, 1 ; script index
	add hl, bc
	ld a, [wCurPikaPicAnimObjectScriptIdx]
	ld [hli], a
	ld a, [wCurPikaPicAnimObjectFrameIdx]
	ld [hli], a
	ld a, [wCurPikaPicAnimObjectFrameTimer]
	ld [hli], a
	ld a, [wCurPikaPicAnimObjectVTileOffset]
	ld [hli], a
	ld a, [wCurPikaPicAnimObjectXOffset]
	ld [hli], a
	ld a, [wCurPikaPicAnimObjectYOffset]
	ld [hli], a
	ld a, [wCurPikaPicAnimObject + 6]
	ld [hl], a
.skip
	pop bc
	ld hl, 8
	add hl, bc
	ld b, h
	ld c, l
	pop af
	dec a
	jr nz, .loop
	ret

PikaPicAnimCommand_frame:
	ld hl, wPikaPicAnimObjectDataBuffer
	ld de, 8
	ld c, 4
.loop
	ld a, [hl]
	and a
	jr z, .found
	add hl, de
	dec c
	jr nz, .loop
	scf
	ret

.found
	ld a, [wPikaPicAnimObjectDataBufferSize]
	inc a
	ld [wPikaPicAnimObjectDataBufferSize], a
	ld [hli], a
	call GetPikaPicAnimByte
	ld [hli], a
	call GetPikaPicAnimByte
	ld [hl], a
	xor a
	ld [hli], a ; overloads
	ld [hli], a
	call GetPikaPicAnimByte
	ld [hli], a
	call GetPikaPicAnimByte
	ld [hli], a
	call GetPikaPicAnimByte
	ld [hli], a
	and a
	ret

PikaPicAnimCommand_deleteobject:
	call GetPikaPicAnimByte
	ld b, a
	ld hl, wPikaPicAnimObjectDataBuffer
	ld de, 8
	ld c, 4
.search
	ld a, [hl]
	cp b
	jr z, .delete
	add hl, de
	dec c
	jr nz, .search
	scf
	ret

.delete
	xor a
	ld [hl], a
	ret

LoadPikaPicAnimObjectData:
.loop
	ld a, [wCurPikaPicAnimObjectScriptIdx]
	cp (PikaPicAnimBGFrames_35_id - PikaPicAnimBGFramesPointers) / 2
	jr c, .valid
	ld a, (PikaPicAnimBGFrames_Generic_id - PikaPicAnimBGFramesPointers) / 2
.valid
	ld e, a
	ld d, 0
	ld hl, PikaPicAnimBGFramesPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wCurPikaPicAnimObjectFrameIdx]
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	cp $e0
	jr nz, .play
	xor a
	ld [wCurPikaPicAnimObjectFrameIdx], a
	ld [wCurPikaPicAnimObjectFrameTimer], a
	jr .loop

.play
	push hl
	call LoadCurPikaPicObjectTilemap
	pop hl
	ld a, [hl]
	and a
	ret z
	ld a, [wCurPikaPicAnimObjectFrameTimer]
	inc a
	ld [wCurPikaPicAnimObjectFrameTimer], a
	cp [hl]
	ret nz
	xor a
	ld [wCurPikaPicAnimObjectFrameTimer], a
	ld a, [wCurPikaPicAnimObjectFrameIdx]
	inc a
	ld [wCurPikaPicAnimObjectFrameIdx], a
	ret

INCLUDE "data/pikachu_pic_objects.asm"

LoadCurPikaPicObjectTilemap:
	and a
	ret z
	ld e, a
	ld d, 0
	ld hl, PikaPicTilemapPointers
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	ld b, a
	inc de
	push de
	push bc
	call .GetStartCoords
	pop bc
	pop de
.row
	push bc
	push hl
	ld a, [wCurPikaPicAnimObjectVTileOffset] ; tile id offset
	ld c, a
.col
	ld a, [de]
	inc de
	cp $ff
	jr z, .skip
	add c
	ld [hl], a
.skip
	inc hl
	dec b
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec c
	jr nz, .row
	ret

.GetStartCoords:
	push bc
	ld a, [wCurPikaPicAnimObjectYOffset] ; Y offset
	ld b, a
	ld a, [wPikaPicPikaDrawStartY]
	add b
	coord hl, 0, 0
	ld bc, SCREEN_WIDTH
	call AddNTimes
	ld a, [wCurPikaPicAnimObjectXOffset] ; X offset
	ld c, a
	ld a, [wPikaPicPikaDrawStartX]
	add c
	ld c, a
	ld b, 0
	add hl, bc
	pop bc
	ret

INCLUDE "data/pikachu_pic_tilemaps.asm"

LoadPikaPicAnimGFXHeader:
	push hl
	ld e, a
	ld d, 0
	ld hl, PikaPicAnimGFXHeaders
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	pop hl
	ret

RunPikaPicAnimSetupScript:
	call .CheckAndAdvanceTimer
	ret c
	xor a
	ld [wPikaPicAnimPointerSetupFinished], a
.loop
	call GetPikaPicAnimByte
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call FarJump_hl
	ld a, [wPikaPicAnimPointerSetupFinished]
	and a
	jr z, .loop
	ret

.CheckAndAdvanceTimer:
	ld a, [wPikaPicAnimDelay]
	and a
	ret z
	dec a
	ld [wPikaPicAnimDelay], a
	scf
	ret

.Jumptable:
	dw PikaPicAnimCommand_nop ; 00, 0 params
	dw PikaPicAnimCommand_writebyte ; 01, 1 param
	dw PikaPicAnimCommand_loadgfx ; 02, 1 param
	dw PikaPicAnimCommand_frame ; 03, 5 params
	dw PikaPicAnimCommand_nop4 ; 04, 0 params
	dw PikaPicAnimCommand_nop5 ; 05, 0 params
	dw PikaPicAnimCommand_deleteobject ; 06, 1 param
	dw PikaPicAnimCommand_nop7 ; 07, 0 params
	dw PikaPicAnimCommand_nop8 ; 08, 0 params
	dw PikaPicAnimCommand_jump ; 09, 1 dw param
	dw PikaPicAnimCommand_setduration ; 0a, 1 dw param
	dw PikaPicAnimCommand_cry ; 0b, 1 param
	dw PikaPicAnimCommand_thunderbolt ; 0c, 0 params
	dw PikaPicAnimCommand_run ; 0d, 0 params (ret)
	dw PikaPicAnimCommand_ret ; 0e, 0 params (ret)

PikaPicAnimCommand_nop:
	ret

PikaPicAnimCommand_ret:
	ld a, 1
	ld [wPikaPicAnimTimer], a
	xor a
	ld [wPikaPicAnimTimer + 1], a
	jr PikaPicAnimCommand_run

; XXX
	ret

PikaPicAnimCommand_setduration:
	call GetPikaPicAnimByte
	ld [wPikaPicAnimTimer], a
	call GetPikaPicAnimByte
	ld [wPikaPicAnimTimer + 1], a
	ret

PikaPicAnimCommand_run:
	ld a, $ff
	ld [wPikaPicAnimPointerSetupFinished], a
	ret

PikaPicAnimCommand_writebyte:
	call GetPikaPicAnimByte
	ld [wPikaPicAnimDelay], a
	ret

PikaPicAnimCommand_nop4:
PikaPicAnimCommand_nop5:
PikaPicAnimCommand_nop7:
PikaPicAnimCommand_nop8:
	ret

PikaPicAnimCommand_jump:
	call GetPikaPicAnimByte
	ld l, a
	call GetPikaPicAnimByte
	ld h, a
	call UpdatePikaPicAnimPointer
	ret

GetPikaPicAnimByte:
	push hl
	ld hl, wPikaPicAnimPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	call UpdatePikaPicAnimPointer
	pop hl
	ret

UpdatePikaPicAnimPointer:
	push af
	ld a, l
	ld [wPikaPicAnimPointer], a
	ld a, h
	ld [wPikaPicAnimPointer + 1], a
	pop af
	ret

PikaPicAnimCommand_loadgfx:
	ld a, [wUpdateSpritesEnabled]
	push af
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld a, [hTilesetType]
	push af
	xor a
	ld [hTilesetType], a
	call GetPikaPicAnimByte
	ld [wPikaPicAnimCurGraphicID], a
	ld a, [wPikaPicAnimCurGraphicID]
	call LoadPikaPicAnimGFXHeader
	ld a, c
	cp $ff
	jr z, .compressed
	call RequestPikaPicAnimGFX
	jr .done

.compressed
	call DecompressRequestPikaPicAnimGFX
.done
	pop af
	ld [hTilesetType], a
	pop af
	ld [hBGMapMode], a
	pop af
	ld [wUpdateSpritesEnabled], a
	ret

RequestPikaPicAnimGFX: ; fe114
	push de
	ld a, [wPikaPicAnimCurGraphicID]
	ld d, a
	ld e, c
	call CheckIfThereIsRoomForPikaPicAnimGFX
	pop de
	jr c, .failed
	call GetPikaPicVRAMAddressForNewGFX
	call CopyVideoDataAlternate
	and a
.failed
	ret

DecompressRequestPikaPicAnimGFX: ; fe128
	push de
	ld a, [wPikaPicAnimCurGraphicID]
	ld d, a
	ld e, 5 * 5
	call CheckIfThereIsRoomForPikaPicAnimGFX
	pop de
	jr c, .failed
	ld a, b
	call UncompressSpriteFromDE
	ld a, BANK(sSpriteBuffer1)
	call OpenSRAM
	ld hl, sSpriteBuffer1
	ld de, sSpriteBuffer0
	ld bc, SPRITEBUFFERSIZE * 2
	call CopyData
	call CloseSRAM
	ld a, [wPikaPicAnimCurGraphicID]
	call LookUpTileOffsetForCurrentPikaPicAnimGFX
	call GetPikaPicVRAMAddressForNewGFX
	ld d, h
	ld e, l
	call InterlaceMergeSpriteBuffers
.failed
	ret

ClearPikaPicUsedGFXBuffer:
	ld hl, wPikaPicUsedGFXCount
	ld bc, wPikaPicUsedGFXEnd - wPikaPicUsedGFXCount
	xor a
	call FillMemory
	ret

GetPikaPicVRAMAddressForNewGFX:
	ld hl, vNPCSprites
	push bc
	ld b, a
	and $f
	swap a
	ld c, a
	ld a, b
	and $f0
	swap a
	ld b, a
	add hl, bc
	pop bc
	ret

CheckIfThereIsRoomForPikaPicAnimGFX:
; d: idx
; e: size
	push bc
	push hl
	ld hl, wPikaPicUsedGFX
	ld c, 8
.loop
	ld a, [hl]
	and a
	jr z, .empty
	cp d
	jr z, .found
	inc hl
	inc hl
	dec c
	jr nz, .loop
	pop hl
	pop bc
	scf
	ret

.found
	inc hl
	ld a, [hl]
	pop hl
	pop bc
	ret

.empty
	ld [hl], d
	inc hl
	ld a, [wPikaPicUsedGFXCount]
	add $80
	ld [hl], a
	ld a, [wPikaPicUsedGFXCount]
	add e
	ld [wPikaPicUsedGFXCount], a
	cp $80
	jr z, .okay
	jr nc, .failed
.okay
	ld a, [hl]
	and a
	jr .pop_ret

.failed
	scf
.pop_ret

	pop hl
	pop bc
	ret

LookUpTileOffsetForCurrentPikaPicAnimGFX:
	push bc
	push hl
	ld b, a
	ld hl, wPikaPicUsedGFX
	ld c, 8
.loop
	ld a, [hli]
	cp b
	jr z, .found
	inc hl
	dec c
	jr nz, .loop
	scf
	jr .pop_ret

.found
	ld a, [hl]
	and a
.pop_ret

	pop hl
	pop bc
	ret

PikaPicAnimCommand_cry:
	call GetPikaPicAnimByte
	cp $ff
	ret z
	ld e, a
	callab PlayPikachuSoundClip
	ret

PikaPicAnimCommand_thunderbolt:
	ld a, $1
	ld [wMuteAudioAndPauseMusic], a
	call DelayFrame
	ld a, [wAudioROMBank]
	push af
	ld a, BANK(SFX_Thunderbolt)
	ld [wAudioROMBank], a
	ld [wAudioSavedROMBank], a
	call .LoadAudio
	call PlaySound
	call .FlashScreen
	call WaitForSoundToFinish
	pop af
	ld [wAudioROMBank], a
	ld [wAudioSavedROMBank], a
	xor a
	ld [wMuteAudioAndPauseMusic], a
	ret

.LoadAudio:
	ld hl, MoveSoundTable
	ld e, THUNDERBOLT
	ld d, 0
	add hl, de
	add hl, de
	add hl, de
	ld a, BANK(MoveSoundTable)
	call GetFarByte
	ld b, a
	inc hl
	ld a, BANK(MoveSoundTable)
	call GetFarByte
	inc hl
	ld [wFrequencyModifier], a
	ld a, BANK(MoveSoundTable)
	call GetFarByte
	ld [wTempoModifier], a
	ld a, b
	ret

.FlashScreen:
	ld hl, PikaPicAnimThunderboltPals
.loop
	ld a, [hli]
	cp $ff
	ret z
	ld c, a
	ld b, [hl]
	inc hl
	push hl
	call .UpdatePal
	pop hl
	jr .loop

.UpdatePal:
	ld a, b
	ld [rBGP], a
	call UpdateGBCPal_BGP
	call DelayFrames
	ret

INCLUDE "data/pikachu_pic_animation.asm"
