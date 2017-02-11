ApplyOutOfBattlePoisonDamage:
	ld a, [wd730]
	add a
	jp c, .noBlackOut ; no black out if joypad states are being simulated
	ld a, [wd492]
	bit 7, a
	jp nz, .noBlackOut
	ld a, [wd72e]
	bit 6, a
	jp nz, .noBlackOut
	ld a, [wPartyCount]
	and a
	jp z, .noBlackOut
	call IncrementDayCareMonExp
	call Func_c4c7
	ld a, [wStepCounter]
	and $3 ; is the counter a multiple of 4?
	jp nz, .skipPoisonEffectAndSound ; only apply poison damage every fourth step
	ld [wWhichPokemon], a
	ld hl, wPartyMon1Status
	ld de, wPartySpecies
.applyDamageLoop
	ld a, [hl]
	and (1 << PSN)
	jr z, .nextMon2 ; not poisoned
	dec hl
	dec hl
	ld a, [hld]
	ld b, a
	ld a, [hli]
	or b
	jr z, .nextMon ; already fainted
; subtract 1 from HP
	ld a, [hl]
	dec a
	ld [hld], a
	inc a
	jr nz, .noBorrow
; borrow 1 from upper byte of HP
	dec [hl]
	inc hl
	jr .nextMon
.noBorrow
	ld a, [hli]
	or [hl]
	jr nz, .nextMon ; didn't faint from damage
; the mon fainted from the damage
	push hl
	inc hl
	inc hl
	ld [hl], a
	ld a, [de]
	ld [wd11e], a
	push de
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	xor a
	ld [wJoyIgnore], a
	call EnableAutoTextBoxDrawing
	ld a, $d0
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	callab IsThisPartymonStarterPikachu_Party
	jr nc, .curMonNotPlayerPikachu
	ldpikacry e, PikachuCry_LavenderTown
	callab PlayPikachuSoundClip
	calladb_ModifyPikachuHappiness PIKAHAPPY_PSNFNT
.curMonNotPlayerPikachu
	pop de
	pop hl
.nextMon
	inc hl
	inc hl
.nextMon2
	inc de
	ld a, [de]
	inc a
	jr z, .applyDamageLoopDone
	ld bc, wPartyMon2 - wPartyMon1
	add hl, bc
	push hl
	ld hl, wWhichPokemon
	inc [hl]
	pop hl
	jr .applyDamageLoop
.applyDamageLoopDone
	ld hl, wPartyMon1Status
	ld a, [wPartyCount]
	ld d, a
	ld e, 0
.countPoisonedLoop
	ld a, [hl]
	and (1 << PSN)
	or e
	ld e, a
	ld bc, wPartyMon2 - wPartyMon1
	add hl, bc
	dec d
	jr nz, .countPoisonedLoop
	ld a, e
	and a ; are any party members poisoned?
	jr z, .skipPoisonEffectAndSound
	ld b, $2
	predef InvertBGPal_4Frames ; change BG white to dark grey for 4 frames
	ld a, SFX_POISONED
	call PlaySound
.skipPoisonEffectAndSound
	predef AnyPartyAlive
	ld a, d
	and a
	jr nz, .noBlackOut
	call EnableAutoTextBoxDrawing
	ld a, $d1
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld hl, wd72e
	set 5, [hl]
	ld a, $ff
	jr .done
.noBlackOut
	xor a
.done
	ld [wOutOfBattleBlackout], a
	ret

Func_c4c7:
	ld a, [wStepCounter]
	and a
	jr nz, .asm_c4de
	call Random
	and $1
	jr z, .asm_c4de
	calladb_ModifyPikachuHappiness $6
.asm_c4de
	ld hl, wPikachuMood
	ld a, [hl]
	cp $80
	jr z, .asm_c4ef
	jr c, .asm_c4ea
	dec a
	dec a
.asm_c4ea
	inc a
	ld [hl], a
	cp $80
	ret nz
.asm_c4ef
	xor a
	ld [wContextDependentPikachuEmotion], a
	ret
