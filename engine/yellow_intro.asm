PlayIntroScene:
	ld a, [rIE]
	push af
	xor a
	ld [rIF], a
	ld a, $f
	ld [rIE], a
	ld a, $8
	ld [rSTAT], a
	call InitYellowIntroGFXAndMusic
	call DelayFrame
.loop
	ld a, [wYellowIntroCurrentScene]
	bit 7, a
	jr nz, .go_to_title_screen
	call JoypadLowSensitivity
	ld a, [hJoyPressed]
	and A_BUTTON | B_BUTTON | START
	jr nz, .go_to_title_screen
	call RunYellowIntroCommand
	ld a, $0
	ld [wCurrentAnimatedObjectOAMBufferOffset], a
	call RunObjectAnimations
	ld a, [wYellowIntroCurrentScene]
	; cp $7
	; call z, .SetPal1OnObjs_8_14_16_18_19
	cp $3
	call z, .SetPal1OnAllObjs
	; cp $b
	; call z, .SetPal1OnObjs_18_19_20_25_26_28
	call DelayFrame
	jr .loop

.go_to_title_screen
	call YellowIntro_BlankPalettes
	xor a
	ld [hLCDCPointer], a
	call DelayFrame
	xor a
	ld [rIF], a
	pop af
	ld [rIE], a
	ld a, $90
	ld [hWY], a
	call ClearObjectAnimationBuffers
	ld hl, wTileMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call Bank3E_FillMemory
	call YellowIntro_BlankOAMBuffer
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	xor a
	ld [hBGMapMode], a
	ret

.SetPal1OnAllObjs:
	push hl
	push bc
	ld hl, wOAMBuffer + 3
	ld bc, 4
	ld a, 32
.loopPals
	set 0, [hl]
	add hl, bc
	dec a
	jr nz, .loopPals
	pop bc
	pop hl
	ret

; .SetPal1OnObjs_18_19_20_25_26_28:
	; ld a, [wOAMBuffer + 18 * 4 + 3]
	; or $1
	; ld [wOAMBuffer + 18 * 4 + 3], a
	; ld a, [wOAMBuffer + 19 * 4 + 3]
	; or $1
	; ld [wOAMBuffer + 19 * 4 + 3], a
	; ld a, [wOAMBuffer + 20 * 4 + 3]
	; or $1
	; ld [wOAMBuffer + 20 * 4 + 3], a
	; ld a, [wOAMBuffer + 25 * 4 + 3]
	; or $1
	; ld [wOAMBuffer + 25 * 4 + 3], a
	; ld a, [wOAMBuffer + 26 * 4 + 3]
	; or $1
	; ld [wOAMBuffer + 26 * 4 + 3], a
	; ld a, [wOAMBuffer + 28 * 4 + 3]
	; or $1
	; ld [wOAMBuffer + 28 * 4 + 3], a
	; ret

RunYellowIntroCommand:
	ld a, [wYellowIntroCurrentScene]
	ld hl, .Jumptable
	call YellowIntroObjectFn_GetPointerFromTable
	jp [hl]

.Jumptable:
	dw YellowIntroScene0 ; running pika 1
	dw YellowIntroScene1 ; wait last
	dw YellowIntroScene2 ; pikachu kick
	dw YellowIntroScene3 ; wait last
	dw YellowIntroScene4 ; running pika 2
	dw YellowIntroScene5 ; wait last
	dw YellowIntroScene6 ; surfing pika
	dw YellowIntroScene7 ; wait last
	dw YellowIntroScene8 ; running pika 3
	dw YellowIntroScene9 ; wait last
	dw YellowIntroScene10 ; flying pika
	dw YellowIntroScene11 ; wait last
	dw YellowIntroScene12 ; pika close up
	dw YellowIntroScene13 ; wait last
	dw YellowIntroScene14 ; pika thunderbolt
	dw YellowIntroScene15 ; wait last
	dw YellowIntroScene16 ; fade to white
	dw YellowIntroScene17 ; wait and quit

YellowIntro_NextScene:
	ld hl, wYellowIntroCurrentScene
	inc [hl]
	ret

YellowIntroScene0:
	xor a
	ld [hLCDCPointer], a
	lb de, $58, $58
	ld a, $1
	call YellowIntro_SpawnAnimatedObjectAndSavePointer
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $90
	ld [hWY], a
	ld a, $e4
	ld [rBGP], a
	ld [rOBP0], a
	ld a, $c4
	ld [rOBP1], a
	call UpdateGBCPal_BGP
	call UpdateGBCPal_OBP0
	call UpdateGBCPal_OBP1
	ld a, 130
	ld [wYellowIntroSceneTimer], a
	call YellowIntro_NextScene
	ret

YellowIntroScene1:
	call YellowIntro_CheckFrameTimerDecrement
	ret nc
	call YellowIntro_MaskCurrentAnimatedObjectStruct
	call YellowIntro_NextScene
	ret

YellowIntroScene2:
	call YellowIntro_BlankPalsDelay2AndDisableLCD
	ld c, $8
	call UpdateMusicCTimes
	xor a
	ld [hLCDCPointer], a
	ld hl, vBGMap0
	ld bc, $400
	xor a
	call Bank3E_FillMemory
	call YellowIntroScene2_PlaceGraphic
	lb de, $58, $b8 ; overloaded
	ld a, $4 ; overloaded
	call LoadYellowIntroFlyingSpeedBars
	ld a, $1
	call YellowIntro_SetPalsResetScrollAndEnableLCD
	call YellowIntro_SetTimerFor128Frames
	call YellowIntro_NextScene
	ret

YellowIntroScene2_PlaceGraphic:
	ld hl, $98d4 ; (20, 6)
	ld de, $20
	ld b, $6
	ld a, $90
.row
	ld c, $6
	push af
	push hl
.col
	ld [hli], a
	inc a
	dec c
	jr nz, .col
	pop hl
	add hl, de
	pop af
	add $10
	dec b
	jr nz, .row
	; ld a, [hGBC]
	; and a
	; jr z, .dmg_sgb
	; ; We can actually set palettes!
	; ld hl, $98d4 ; (20, 6)
	; ld de, $20
	; ld b, $6
	; ld a, $1
	; ld [rVBK], a
; .attr_row
	; ld c, $6
	; push hl
; .attr_col
	; ld [hli], a
	; dec c
	; jr nz, .attr_col
	; pop hl
	; add hl, de
	; dec b
	; jr nz, .attr_row
	; xor a
	; ld [rVBK], a
; .dmg_sgb
	ret

LoadYellowIntroFlyingSpeedBars:
	ld hl, YellowIntroFlyingSpeedBarData
	ld a, $8
.loop
; Spawn object $8 at indicated coordinates with indicated speeds
	push af
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, [hli]
	push hl
	push af
	ld a, $8
	call SpawnAnimatedObject
	pop af
	ld hl, ANIM_OBJ_FIELD_B
	add hl, bc
	ld [hl], a
	pop hl
	pop af
	dec a
	jr nz, .loop
	ret

YellowIntroFlyingSpeedBarData:
	; y, x, speed
	db $d0, $20, $02
	db $f0, $30, $04
	db $d0, $40, $06
	db $c0, $50, $08
	db $e0, $60, $08
	db $c0, $70, $06
	db $e0, $80, $04
	db $f0, $90, $02

YellowIntroScene3:
	call YellowIntro_CheckFrameTimerDecrement
	jr c, .expired
	ld a, [hSCX]
	cp $68
	ret z
	add $4
	ld [hSCX], a
	ret

.expired
	call MaskAllAnimatedObjectStructs
	call YellowIntro_NextScene
	ret

YellowIntroScene4:
	call YellowIntro_BlankPalsDelay2AndDisableLCD
	ld c, $5
	call UpdateMusicCTimes
	; ld a, [hGBC]
	; and a
	; jr z, .dmg_sgb
	; ; We can actually set palettes!
	; ld hl, $98 + 6 * $20 + $14
	; ld de, $20
	; ld b, $6
	; ld a, $1
	; ld [rVBK], a
	; xor a
; .attr_row
	; ld c, $6
	; push hl
; .attr_col
	; ld [hli], a
	; dec c
	; jr nz, .attr_col
	; pop hl
	; add hl, de
	; dec b
	; jr nz, .attr_row
	; xor a
	; ld [rVBK], a
; .dmg_sgb
	xor a
	ld [hLCDCPointer], a
	call YellowIntro_RunningPikaLetterbox
	lb de, $58, $58
	ld a, $2
	call YellowIntro_SpawnAnimatedObjectAndSavePointer
	xor a
	call YellowIntro_SetPalsResetScrollAndEnableLCD
	call YellowIntro_SetTimerFor128Frames
	call YellowIntro_NextScene
	ret

YellowIntroScene5:
	call YellowIntro_CheckFrameTimerDecrement
	ret nc
	call YellowIntro_MaskCurrentAnimatedObjectStruct
	call YellowIntro_NextScene
	ret

YellowIntroScene6:
	call YellowIntro_BlankPalsDelay2AndDisableLCD
	ld c, $5
	call UpdateMusicCTimes
	ld a, rSCY - $ff00
	ld [hLCDCPointer], a
	call YellowIntro_Copy8BitSineWave
	ld hl, vBGMap0
	ld bc, $60
	xor a
	call Bank3E_FillMemory
	ld hl, $9800 + 3 * $20 + 0
	ld c, $10
	ld a, $20
.asm_f9a8b
	ld [hli], a
	inc a
	ld [hli], a
	dec a
	dec c
	jr nz, .asm_f9a8b
	ld hl, $9800 + 4 * $20 + 0
	ld bc, $300
	ld a, $10
	call Bank3E_FillMemory
	; ld a, [hGBC]
	; and a
	; jr z, .dmg_sgb
	; We can actually set palettes!
	; ld hl, $98d4 ; (20, 6)
	; ld de, $20
	; ld b, $6
	; ld a, $1
	; ld [rVBK], a
	; xor a
; .attr_row
	; ld c, $6
	; push hl
; .attr_col
	; ld [hli], a
	; dec c
	; jr nz, .attr_col
	; pop hl
	; add hl, de
	; dec b
	; jr nz, .attr_row
	; xor a
	; ld [rVBK], a
; .dmg_sgb
	lb de, $40, $f8
	ld a, $5
	call YellowIntro_SpawnAnimatedObjectAndSavePointer
	ld a, $1
	call YellowIntro_SetPalsResetScrollAndEnableLCD
	call YellowIntro_SetTimerFor88Frames
	call YellowIntro_NextScene
	ret

YellowIntroScene7:
	call YellowIntro_CheckFrameTimerDecrement
	jr c, .expired
	ld hl, hSCX
	inc [hl]
	inc [hl]
	ld hl, wLYOverridesBuffer
	ld de, wLYOverridesBuffer + 1
	ld a, [hl]
	push af
	ld c, $ff
.shift_loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .shift_loop
	pop af
	ld [hl], a
	call Request7TileTransferFromC810ToC710
	ret

.expired
	call YellowIntro_MaskCurrentAnimatedObjectStruct
	call YellowIntro_NextScene
	ret

YellowIntroScene8:
	call YellowIntro_BlankPalsDelay2AndDisableLCD
	ld c, $5
	call UpdateMusicCTimes
	xor a
	ld [hLCDCPointer], a
	call YellowIntro_RunningPikaLetterbox
	lb de, $58, $58
	ld a, $3
	call YellowIntro_SpawnAnimatedObjectAndSavePointer
	xor a
	call YellowIntro_SetPalsResetScrollAndEnableLCD
	call YellowIntro_SetTimerFor128Frames
	call YellowIntro_NextScene
	ret

YellowIntroScene9:
	call YellowIntro_CheckFrameTimerDecrement
	ret nc
	call YellowIntro_MaskCurrentAnimatedObjectStruct
	call YellowIntro_NextScene
	ret

YellowIntroScene10:
	call YellowIntro_BlankPalsDelay2AndDisableLCD
	ld c, $5
	call UpdateMusicCTimes
	xor a
	ld [hLCDCPointer], a
	ld hl, vBGMap0
	ld bc, $400
	xor a
	call Bank3E_FillMemory
	ld hl, vBGMap0
	ld bc, $100
	ld a, $2
	call Bank3E_FillMemory
	ld hl, $9900
	ld de, Unkn_f9b6e
	lb bc, 6, 20
	call .FillBGMapBox
	ld hl, $988c
	ld de, Unkn_f9be6
	lb bc, 3, 4
	call .FillBGMapBox
	ld hl, $98e3
	ld de, Unkn_f9bf2
	lb bc, 2, 2
	call .FillBGMapBox
	lb de, $98, $58
	ld a, $6
	call YellowIntro_SpawnAnimatedObjectAndSavePointer
	ld a, $1
	call YellowIntro_SetPalsResetScrollAndEnableLCD
	call YellowIntro_SetTimerFor128Frames
	call YellowIntro_NextScene
	ret

.FillBGMapBox:
.fill_row
	push bc
	push hl
.fill_col
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .fill_col
	pop hl
	ld bc, $20
	add hl, bc
	pop bc
	dec b
	jr nz, .fill_row
	ret

Unkn_f9b6e: INCBIN "gfx/unknown_f9b6e.map"
Unkn_f9be6: INCBIN "gfx/unknown_f9be6.map"
Unkn_f9bf2: INCBIN "gfx/unknown_f9bf2.map"

YellowIntroScene11:
	call YellowIntro_CheckFrameTimerDecrement
	jr c, .expired
	ld a, [wYellowIntroSceneTimer]
	and $7
	ret nz
	ld a, [wYellowIntroSceneTimer]
	and $8
	sla a
	sla a
	sla a
	ld e, a
	ld d, $0
	ld hl, YellowIntroCloudGFX1
	add hl, de
	ld a, l
	ld [h2bppSrc], a
	ld a, h
	ld [h2bppSrc + 1], a
	xor a
	ld [h2bppDest], a
	ld a, $96
	ld [h2bppDest + 1], a
	ld a, $4
	ld [h2bppSize], a
	ret

.expired
	call YellowIntro_MaskCurrentAnimatedObjectStruct
	call YellowIntro_NextScene
	ret

YellowIntroCloudGFX1: INCBIN "gfx/unknown_f9c2c.2bpp"
YellowIntroCloudGFX2: INCBIN "gfx/unknown_f9c6c.2bpp" ; indirectly referenced

YellowIntroScene12:
	call YellowIntro_BlankPalsDelay2AndDisableLCD
	ld c, $5
	call UpdateMusicCTimes
	xor a
	ld [hLCDCPointer], a
	ld hl, vBGMap0
	ld bc, $80
	ld a, $1
	call Bank3E_FillMemory
	ld hl, $9880
	ld bc, $140
	xor a
	call Bank3E_FillMemory
	ld hl, $99c0
	ld bc, $80
	ld a, $1
	call Bank3E_FillMemory

	; paste 8x12 graphic into vBGMap0 at (5, 6) starting at tile 4, skipping 4 vtiles at the end of each row
	ld hl, $98c5
	ld de, $20
	ld a, $4
	ld b, 8
.row
	ld c, 12
	push hl
.col
	ld [hli], a
	inc a
	dec c
	jr nz, .col
	pop hl
	add hl, de
	add $4
	dec b
	jr nz, .row

	; ld hl, $98c4 ; (4, 6)
	; ld [hl], $3
	; ld hl, $98e4 ; (4, 7)
	; ld [hl], $74
	; ld hl, $99a5 ; (5, 5)
	; ld [hl], $0
	lb de, $68, $58
	ld a, $9
	call YellowIntro_SpawnAnimatedObjectAndSavePointer
	xor a
	call YellowIntro_SetPalsResetScrollAndEnableLCD
	call YellowIntro_SetTimerFor128Frames
	call YellowIntro_NextScene
	ret

YellowIntroScene13:
	call YellowIntro_CheckFrameTimerDecrement
	ret nc
	lb de, $68, $58
	ld a, $a
	call SpawnAnimatedObject
	call YellowIntro_NextScene
	ret

YellowIntroScene14:
	ld de, YellowIntroPalSequence_f9dd6
	call YellowIntro_LoadDMGPalAndIncrementCounter
	jr c, .expired
	ld [rBGP], a
	ld [rOBP0], a
	and $f0
	ld [rOBP1], a
	call UpdateGBCPal_BGP
	call UpdateGBCPal_OBP0
	call UpdateGBCPal_OBP1
	ret

.expired
	call MaskAllAnimatedObjectStructs
	call YellowIntro_BlankOAMBuffer
	ld hl, wTileMap
	ld bc, $50
	ld a, $1
	call Bank3E_FillMemory
	coord hl, 0, 4
	ld bc, CopyVideoDataAlternate
	xor a
	call Bank3E_FillMemory
	coord hl, 0, 14
	ld bc, $50
	ld a, $1
	call Bank3E_FillMemory
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	xor a
	ld [hBGMapMode], a
	ld a, $e4
	ld [rOBP0], a
	ld [rBGP], a
	call UpdateGBCPal_BGP
	call UpdateGBCPal_OBP0
	lb de, $58, $58
	ld a, $7
	call YellowIntro_SpawnAnimatedObjectAndSavePointer
	call YellowIntro_NextScene
	ld a, $28
	ld [wYellowIntroSceneTimer], a
	ret

YellowIntroScene15:
	call YellowIntro_CheckFrameTimerDecrement
	jr c, .expired
	ld a, [wYellowIntroSceneTimer]
	and $3
	ret nz
	ld a, [rOBP0]
	xor $ff
	ld [rOBP0], a
	ld a, [rBGP]
	xor $3
	ld [rBGP], a
	call UpdateGBCPal_BGP
	call UpdateGBCPal_OBP0
	ret

.expired
	xor a
	ld [hLCDCPointer], a
	ld a, $e4
	ld [rBGP], a
	ld [rOBP0], a
	call UpdateGBCPal_BGP
	call UpdateGBCPal_OBP0
	call YellowIntro_NextScene
YellowIntroScene16:
	ld de, YellowIntroPalSequence_f9e0a
	call YellowIntro_LoadDMGPalAndIncrementCounter
	jr c, .expired
	ld [rOBP0], a
	ld [rBGP], a
	call UpdateGBCPal_BGP
	call UpdateGBCPal_OBP0
	ret

.expired
	call YellowIntro_NextScene
	ret

YellowIntroPalSequence_f9dd6:
	db $e4, $c0, $c0, $e4
	db $e4, $c0, $c0, $e4
	db $e4, $c0, $c0, $e4
	db $e4, $c0, $c0, $e4
	db $e4, $c0, $c0, $e4
	db $e4, $c0, $c0, $e4
	db $e4, $c0, $c0, $e4
	db $e4, $c0, $c0, $e4
	db $e4, $c0, $c0, $e4
	db $e4, $c0, $c0, $e4
	db $e4, $c0, $c0, $e4
	db $e4, $c0, $c0, $e4
	db $e4, $c0, $c0, $ff

YellowIntroPalSequence_f9e0a:
	db $e4, $90, $90, $40
	db $40, $00, $00, $ff

YellowIntroScene17:
	ld c, 64
	call DelayFrames
	ld hl, wYellowIntroCurrentScene
	set 7, [hl]
	ret

YellowIntro_SpawnAnimatedObjectAndSavePointer:
	call SpawnAnimatedObject
	ld a, c
	ld [wYellowIntroAnimatedObjectStructPointer], a
	ld a, b
	ld [wYellowIntroAnimatedObjectStructPointer + 1], a
	ret

YellowIntro_MaskCurrentAnimatedObjectStruct:
	ld a, [wYellowIntroAnimatedObjectStructPointer]
	ld c, a
	ld a, [wYellowIntroAnimatedObjectStructPointer + 1]
	ld b, a
	call MaskCurrentAnimatedObjectStruct
	ret

YellowIntro_SetTimerFor128Frames:
	ld a, 128
	ld [wYellowIntroSceneTimer], a
	ret

YellowIntro_SetTimerFor88Frames:
	ld a, 88
	ld [wYellowIntroSceneTimer], a
	ret

YellowIntro_CheckFrameTimerDecrement:
	ld hl, wYellowIntroSceneTimer
	ld a, [hl]
	and a
	jr z, .expired
	dec [hl]
	and a
	ret

.expired
	scf
	ret

YellowIntro_LoadDMGPalAndIncrementCounter:
	ld hl, wYellowIntroSceneTimer
	ld a, [hl]
	inc [hl]
	ld l, a
	ld h, $0
	add hl, de
	ld a, [hl]
	cp $ff
	jr z, .expired
	and a
	ret

.expired
	scf
	ret

YellowIntro_RunningPikaLetterbox:
	ld hl, vBGMap0
	ld bc, $80
	ld a, $1
	call Bank3E_FillMemory
	ld hl, $9880
	ld bc, $140
	xor a
	call Bank3E_FillMemory
	ld hl, $99c0
	ld bc, $80
	ld a, $1
	call Bank3E_FillMemory
	ret

YellowIntro_BlankPalsDelay2AndDisableLCD:
	xor a
	ld [rBGP], a
	ld [rOBP0], a
	ld [rOBP1], a
	call UpdateGBCPal_BGP
	call UpdateGBCPal_OBP0
	call UpdateGBCPal_OBP1
	call DelayFrame
	call DelayFrame
	call DisableLCD
	ret

YellowIntro_SetPalsResetScrollAndEnableLCD:
	ld e, a
	callab YellowIntroPaletteAction
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $90
	ld [hWY], a
	ld a, $e3
	ld [rLCDC], a
	ld a, $e4
	ld [rBGP], a
	ld [rOBP0], a
	ld a, $e0
	ld [rOBP1], a
	call UpdateGBCPal_BGP
	call UpdateGBCPal_OBP0
	call UpdateGBCPal_OBP1
	ret

YellowIntro_Copy8BitSineWave:
	; Copy this sine wave into wLYOverridesBuffer 8 times
	ld de, wLYOverridesBuffer
	ld a, $8
.loop
	push af
	ld hl, .SineWave
	ld bc, .SineWaveEnd - .SineWave
	call Bank3E_CopyData
	pop af
	dec a
	jr nz, .loop
	ret

.SineWave:
; a sine wave with amplitude 4
	db  0,  0,  1,  2,  2,  3,  3,  3
	db  4,  3,  3,  3,  2,  2,  1,  0
	db  0,  0, -1, -2, -2, -3, -3, -3
	db -4, -3, -3, -3, -2, -2, -1,  0
.SineWaveEnd:

Request7TileTransferFromC810ToC710:
	ld a, $10
	ld [h2bppSrc], a
	ld a, wLYOverridesBuffer / $100
	ld [h2bppSrc + 1], a
	ld a, $10
	ld [h2bppDest], a
	ld a, wLYOverrides / $100
	ld [h2bppDest + 1], a
	ld a, $7
	ld [h2bppSize], a
	ret

InitYellowIntroGFXAndMusic:
	xor a
	ld [hBGMapMode], a
	ld [hSCX], a
	ld [hSCY], a
	ld [hBGMapAddress], a
	ld a, $98
	ld [hBGMapAddress + 1], a
	call YellowIntro_BlankTileMap
	ld hl, wTileMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $1
	call Bank3E_FillMemory
	coord hl, 0, 4
	ld bc, CopyVideoDataAlternate
	xor a
	call Bank3E_FillMemory
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	xor a
	ld [hBGMapMode], a
	ld de, YellowIntroGraphics2
	ld hl, $8000
	lb bc, BANK(InitYellowIntroGFXAndMusic), $ff
	call CopyVideoData
	ld de, YellowIntroGraphics1
	ld hl, $9000
	lb bc, BANK(InitYellowIntroGFXAndMusic), $80
	call CopyVideoData
	call ClearObjectAnimationBuffers
	call LoadYellowIntroObjectAnimationDataPointers
	ld b, SET_PAL_GENERIC
	call RunPaletteCommand
	xor a
	ld hl, wYellowIntroCurrentScene
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, MUSIC_INTRO_BATTLE
	ld c, BANK(Music_IntroBattle)
	call PlayMusic
	ret

LoadYellowIntroObjectAnimationDataPointers:
	ld a, YellowIntro_AnimatedObjectSpawnStateData % $100
	ld [wAnimatedObjectSpawnStateDataPointer], a
	ld a, YellowIntro_AnimatedObjectSpawnStateData / $100
	ld [wAnimatedObjectSpawnStateDataPointer + 1], a
	ld a, YellowIntro_AnimatedObjectJumptable % $100
	ld [wAnimatedObjectJumptablePointer], a
	ld a, YellowIntro_AnimatedObjectJumptable / $100
	ld [wAnimatedObjectJumptablePointer + 1], a
	ld a, YellowIntro_AnimatedObjectOAMData % $100
	ld [wAnimatedObjectOAMDataPointer], a
	ld a, YellowIntro_AnimatedObjectOAMData / $100
	ld [wAnimatedObjectOAMDataPointer + 1], a
	ld a, YellowIntro_AnimatedObjectFramesData % $100
	ld [wAnimatedObjectFramesDataPointer], a
	ld a, YellowIntro_AnimatedObjectFramesData / $100
	ld [wAnimatedObjectFramesDataPointer + 1], a
	ret

YellowIntro_BlankTileMap:
	ld hl, wTileMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $7f
	call Bank3E_FillMemory
	ret

Bank3E_CopyData:
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

Bank3E_FillMemory:
	push de
	ld e, a
.loop
	ld a, e
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .loop
	pop de
	ret

YellowIntro_BlankOAMBuffer:
	ld hl, wOAMBuffer
	ld bc, wOAMBufferEnd - wOAMBuffer
	xor a
	call Bank3E_FillMemory
	ret

YellowIntro_BlankPalettes:
	xor a
	ld [rBGP], a
	ld [rOBP0], a
	ld [rOBP1], a
	call UpdateGBCPal_BGP
	call UpdateGBCPal_OBP0
	call UpdateGBCPal_OBP1
	ret

YellowIntro_AnimatedObjectSpawnStateData:
	db $00, $00, $00 ; 0
	db $01, $01, $00 ; 1
	db $02, $01, $00 ; 2
	db $03, $01, $00 ; 3
	db $04, $02, $00 ; 4
	db $05, $03, $00 ; 5
	db $06, $04, $00 ; 6
	db $07, $01, $00 ; 7
	db $08, $05, $00 ; 8
	db $09, $01, $00 ; 9
	db $0a, $01, $00 ; a

YellowIntro_AnimatedObjectJumptable:
	dw .nop
	dw .nop
	dw .MoveLeft
	dw .MoveRightAndDownTowardsCenter
	dw .MoveDownThenOnWave
	dw .MoveRightAtVariableSpeed

.nop:
	ret

.MoveLeft:
	ld hl, ANIM_OBJ_X_COORD
	add hl, bc
	ld a, [hl]
	cp $58
	ret z
	sub $4
	ld [hl], a
	ret

.MoveRightAndDownTowardsCenter:
	ld hl, ANIM_OBJ_X_COORD
	add hl, bc
	ld a, [hl]
	cp $58
	jr z, .skip
	add $4
	ld [hl], a
.skip
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	cp $58
	ret z
	add $1
	ld [hl], a
	ret

.MoveDownThenOnWave:
	ld hl, ANIM_OBJ_FIELD_B
	add hl, bc
	ld e, [hl]
	ld d, $0
	ld hl, .SurfingPikaJumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

.SurfingPikaJumptable:
	dw .DropPikachu
	dw .ApplySineWave

.DropPikachu:
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld a, [hl]
	cp $58
	jr z, .next
	sub $2
	ld [hl], a
	ret

.next
	ld hl, ANIM_OBJ_FIELD_B
	add hl, bc
	inc [hl]
.ApplySineWave:
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, $8
	call YellowIntro_Sine
	ld hl, ANIM_OBJ_Y_OFFSET
	add hl, bc
	ld [hl], a
	ret

.MoveRightAtVariableSpeed:
	ld hl, ANIM_OBJ_FIELD_B
	add hl, bc
	ld a, [hl]
	ld hl, ANIM_OBJ_X_COORD
	add hl, bc
	add [hl]
	ld [hl], a
	ret

YellowIntroObjectFn_GetPointerFromTable:
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

YellowIntro_Cosine: ; cosine
	add $10
YellowIntro_Sine:
	and $3f
	cp $20
	jr nc, .negative
	call .GetSine
	ld a, h
	ret

.negative
	and $1f
	call .GetSine
	ld a, h
	xor $ff
	inc a
	ret

.GetSine:
	ld e, a
	ld a, d
	ld d, $0
	ld hl, .SineWave
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
.loop
	srl a
	jr nc, .no_add
	add hl, de
.no_add
	sla e
	rl d
	and a
	jr nz, .loop
	ret

.SineWave:
	sine_wave $100
