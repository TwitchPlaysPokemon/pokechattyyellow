ReflectLightScreenEffect_:
	ld hl, wPlayerBattleStatus3
	ld de, wPlayerMoveEffect
	ld a, [hBattleTurn]
	and a
	jr z, .reflectLightScreenEffect
	ld hl, wEnemyBattleStatus3
	ld de, wEnemyMoveEffect
.reflectLightScreenEffect
	ld a, [de]
	cp LIGHT_SCREEN_EFFECT
	jr nz, .reflect
	bit HasLightScreenUp, [hl] ; is mon already protected by light screen?
	jr nz, .moveFailed
	set HasLightScreenUp, [hl] ; mon is now protected by light screen
	ld hl, LightScreenProtectedText
	jr .playAnim

.reflect
	bit HasReflectUp, [hl] ; is mon already protected by reflect?
	jr nz, .moveFailed
	set HasReflectUp, [hl] ; mon is now protected by reflect
	ld hl, ReflectGainedArmorText
.playAnim
	push hl
	ld hl, PlayCurrentMoveAnimation
	call Bankswitch3DtoF
	pop hl
	jp PrintText

.moveFailed
	ld c, 50
	call DelayFrames
	ld hl, PrintButItFailedText_
	jp Bankswitch3DtoF

LightScreenProtectedText:
	TX_FAR _LightScreenProtectedText
	db "@"

ReflectGainedArmorText:
	TX_FAR _ReflectGainedArmorText
	db "@"

Bankswitch3DtoF:
	ld a, BANK(BattleCore)
	jp FarCall_hl

