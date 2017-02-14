; creates a set of moves that may be used and returns its address in hl
; unused slots are filled with 0, all used slots may be chosen with equal probability
AIEnemyTrainerChooseMoves: ; 39719 (e:5719)
	ld a, $14 ; changed to give us more breathing room
	ld hl, wAIMoveWeightings  ; init temporary move selection array. Only the moves with the lowest numbers are chosen in the end
	ld [hli], a   ; move 1
	ld [hli], a   ; move 2
	ld [hli], a   ; move 3
	ld [hl], a    ; move 4
	ld a, [wEnemyDisabledMove] ; forbid disabled move (if any)
	swap a
	and $f
	jr z, .noMoveDisabled
	ld hl, wAIMoveWeightings
	dec a
	ld c, a
	ld b, $0
	add hl, bc    ; advance pointer to forbidden move
	ld [hl], $50  ; forbid (highly discourage) disabled move
.noMoveDisabled
	ld hl, TrainerClassMoveChoiceModifications
	ld a, [wTrainerClass]
	ld b, a
.loopTrainerClasses
	dec b
	jr z, .readTrainerClassData
.loopTrainerClassData
	ld a, [hli]
	and a
	jr nz, .loopTrainerClassData
	jr .loopTrainerClasses
.readTrainerClassData
	ld a, [hl]
	and a
	jp z, .useOriginalMoveSet
	push hl
.nextMoveChoiceModification
	pop hl
	ld a, [hli]
	and a
	jr z, .loopFindMinimumEntries
	push hl
	ld hl, AIMoveChoiceModificationFunctionPointers
	dec a
	add a
	ld c, a
	ld b, 0
	add hl, bc    ; skip to pointer
	ld a, [hli]   ; read pointer into hl
	ld h, [hl]
	ld l, a
	ld de, .nextMoveChoiceModification  ; set return address
	push de
	jp [hl]       ; execute modification function
.loopFindMinimumEntries ; all entries will be decremented sequentially until one of them is zero
	ld hl, wAIMoveWeightings  ; temp move selection array
	ld de, wEnemyMonMoves  ; enemy moves
	ld c, NUM_MOVES
.loopDecrementEntries
	ld a, [de]
	inc de
	and a
	jr z, .loopFindMinimumEntries
	dec [hl]
	jr z, .minimumEntriesFound
	inc hl
	dec c
	jr z, .loopFindMinimumEntries
	jr .loopDecrementEntries
.minimumEntriesFound
	ld a, c
.loopUndoPartialIteration ; undo last (partial) loop iteration
	inc [hl]
	dec hl
	inc a
	cp NUM_MOVES + 1
	jr nz, .loopUndoPartialIteration
	ld hl, wAIMoveNewList  ; temp move selection array
	ld de, wEnemyMonMoves  ; enemy moves
	ld bc, wAIMoveWeightings
	ld a, NUM_MOVES
.filterMinimalEntries ; all minimal entries now have value 1. All other slots will be disabled (move set to 0)
	push af
	ld a, [de]
	and a
	jr nz, .moveExisting
	ld [bc], a
.moveExisting
	ld a, [bc]
	inc bc
	dec a
	ld a, $0
	jr nz, .notMinimalValue
	ld a, [de]
.notMinimalValue
	ld [hli], a     ; enable move slot
	inc de
	pop af
	dec a
	jr nz, .filterMinimalEntries
	ld hl, wAIMoveNewList    ; use created temporary array as move set
	ret
.useOriginalMoveSet
	ld hl, wEnemyMonMoves    ; use original move set
	ret

AIMoveChoiceModificationFunctionPointers: ; 397a3 (e:57a3)
	dw AIMoveChoiceModification1
	dw AIMoveChoiceModification2
	dw AIMoveChoiceModification3
	dw SmartAI

; discourages moves that cause no damage but only a status ailment if player's mon already has one
AIMoveChoiceModification1: ; 397ab (e:57ab)
	ld a, [wBattleMonStatus]
	and a
	jr z, .confusionCheck ; return if no status ailment on player's mon
	ld hl, wAIMoveWeightings - 1 ; temp move selection array (-1 byte offest)
	ld de, wEnemyMonMoves ; enemy moves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	jr z, .confusionCheck ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	jr z, .confusionCheck ; no more moves in move set
	inc de
	call ReadMove
	ld a, [wEnemyMovePower]
	and a
	jr nz, .nextMove
	ld a, [wEnemyMoveEffect]
	push hl
	push de
	push bc
	ld hl, StatusAilmentMoveEffects
	ld de, $0001
	call IsInArray
	pop bc
	pop de
	pop hl
	jr nc, .nextMove
	ld a, [hl]
	add $20 ; heavily discourage move
	ld [hl], a
	jr .nextMove
.confusionCheck
	ld a, [wPlayerBattleStatus1]
	bit Confused, a
	jr z, .digOrFlyCheck
	ld hl, ConfusionMoves
	ld b, $20
	call AlterMovePriorityArray
	ld a, [wPlayerBattleStatus1]
.digOrFlyCheck
	bit Invulnerable, a
	jr z, .usingChargingMoveCheck
	ld a, [wEnemyMonSpeed]
	ld b, a
	ld a, [wEnemyMonSpeed+1]
	ld c, a
	ld a, [wBattleMonSpeed]
	ld d, a
	ld a, [wBattleMonSpeed+1]

	sub c
	ld a, d
	sbc b
	jr nc, .usingChargingMoveCheck
	ld hl, wAIMoveWeightings - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.invLoop
	dec b
	jr z, .bideCheck
	inc hl
	ld a, [de]
	and a
	jr z, .bideCheck
	inc de
	call ReadMove
	ld a, [wEnemyMovePower]
	cp 10
	jr c, .invLoop
	ld a, [wEnemyMoveEffect]
	cp MIRROR_MOVE_EFFECT
	jr c, .invLoop
	cp PAY_DAY_EFFECT
	jr c, .foundusablemove
	cp ATTACK_UP2_EFFECT
	jr c, .invLoop
	cp HEAL_EFFECT
	jr c, .foundusablemove
	push hl
	push de
	push bc
	ld hl,UsableMoveEffectsDuringFlyOrDig
	ld de,$1
	call IsInArray
	pop bc
	pop de
	pop hl
	jr nc, .invLoop
.foundusablemove
	ld a,[hl]
	add -8
	ld [hl],a
	jr .invLoop
.usingChargingMoveCheck
	ld a, [wPlayerBattleStatus1]
	bit ChargingUp, a
	jr z, .bideCheck
	ld hl, InterruptChargingEffectMoves
	ld b, -16
	call AlterMovePriorityArray
	ld a,[wPlayerBattleStatus1]
.bideCheck
	bit StoringEnergy,a
	jr z,.mistCheck
	ld hl, wAIMoveWeightings - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.doesDamageLoop
	dec b
	jr z, .mistCheck
	inc hl
	ld a, [de]
	and a
	jr z, .mistCheck
	inc de
	call ReadMove
	ld a, [wEnemyMovePower]
	cp 10
	jr nc,.discourageDamagingMove
	ld a, [wEnemyMoveEffect]
	cp SPECIAL_DAMAGE_EFFECT
	jr nz,.doesDamageLoop
.discourageDamagingMove
	ld a,[hl]
	add $20
	ld [hl],a
	jr .doesDamageLoop
.mistCheck
	ld a,[wPlayerBattleStatus2]
	bit ProtectedByMist,a
	jr z, .substituteCheck
	ld hl, wAIMoveWeightings - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.statLoweringMoveLoop
	dec b
	jr z, .substituteCheck
	inc hl
	ld a, [de]
	and a
	jr z, .substituteCheck
	inc de
	call ReadMove
	ld a,[wEnemyMoveEffect]
	ld c,-8
	cp ATTACK_DOWN1_EFFECT
	jr c,.statLoweringMoveLoop
	cp CONVERSION_EFFECT
	jr c,.foundStatLoweringMove
	cp HAZE_EFFECT
	jr z,.foundHazeEffect
	cp ATTACK_DOWN2_EFFECT
	jr c,.statLoweringMoveLoop
	cp LIGHT_SCREEN_EFFECT
	jr nc,.statLoweringMoveLoop
.foundStatLoweringMove
	ld c,$20
.foundHazeEffect
	ld a,[hl]
	add c
	ld [hl],a
	jr .statLoweringMoveLoop
.substituteCheck
	ld a,[wPlayerBattleStatus2]
	bit HasSubstituteUp,a
	jr z,.seededCheck
	ld hl, wAIMoveWeightings - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.doesNotEffectSubstituteLoop
	dec b
	jr z, .seededCheck
	inc hl
	ld a, [de]
	and a
	jr z, .seededCheck
	inc de
	call ReadMove
	cp ATTACK_DOWN1_EFFECT
	jr c,.doesNotEffectSubstituteLoop
	cp CONVERSION_EFFECT
	jr c,.foundNonAffectingMove
	cp ATTACK_DOWN2_EFFECT
	jr c,.doesNotEffectSubstituteLoop
	cp LIGHT_SCREEN_EFFECT
	jr c,.foundNonAffectingMove
	cp CONFUSION_EFFECT
	jr z,.foundNonAffectingMove
	cp POISON_EFFECT
	jr z,.foundNonAffectingMove
	cp PARALYZE_EFFECT
	jr nz,.doesNotEffectSubstituteLoop
.foundNonAffectingMove
	ld a,[hl]
	add $20
	ld [hl],a
	jr .doesNotEffectSubstituteLoop
.seededCheck
	ld a,[wPlayerBattleStatus2]
	bit Seeded,a
	jr nz, .discourageLeechSeed
	ld a, [wBattleMonType1]
	cp GRASS
	jr z, .discourageLeechSeed
	ld a, [wBattleMonType2]
	cp GRASS
	jr nz, .lightScreenCheck
.discourageLeechSeed
	ld a,LEECH_SEED
	ld [wAIBuffer1],a
	ld b,$20
	call AlterMovePriority
.lightScreenCheck
	ld a,[wPlayerBattleStatus3]
	bit HasLightScreenUp,a
	jr z,.reflectCheck
	ld hl, wAIMoveWeightings - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.discourageSpecialMovesLoop
	dec b
	jr z, .reflectCheck
	inc hl
	ld a, [de]
	and a
	jr z, .reflectCheck
	inc de
	call ReadMove
	ld a,[wEnemyMoveType]
	cp FIRE
	jr c,.discourageSpecialMovesLoop
	inc [hl]
	jr .discourageSpecialMovesLoop
.reflectCheck
	ld a,[wPlayerBattleStatus3]
	bit HasReflectUp,a
	jr z,.enemySubstituteCheck
	ld hl, wAIMoveWeightings - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.discouragePhysicalMovesLoop
	dec b
	jr z,.enemySubstituteCheck
	inc hl
	ld a, [de]
	and a
	jr z,.enemySubstituteCheck
	inc de
	call ReadMove
	ld a,[wEnemyMoveType]
	cp FIRE
	jr nc,.discouragePhysicalMovesLoop
	inc [hl]
	jr .discouragePhysicalMovesLoop
.enemySubstituteCheck
	ld a,[wEnemyBattleStatus2]
	bit HasSubstituteUp,a
	jr z, .enemyReflectCheck
	ld a,SUBSTITUTE
	ld [wAIBuffer1],a
	ld b,$10
	call AlterMovePriority
.enemyReflectCheck
	ld a, [wEnemyBattleStatus3]
	bit HasReflectUp, a
	jr z, .enemyLightScreenCheck
	ld a, REFLECT
	ld [wAIBuffer1], a
	ld b, $10
	call AlterMovePriority
.enemyLightScreenCheck
	ld a, [wEnemyBattleStatus3]
	bit HasLightScreenUp, a
	ret z
	ld a, LIGHT_SCREEN
	ld [wAIBuffer1], a
	ld b, $10
	jp AlterMovePriority

StatusAilmentMoveEffects ; 57e2
	db SLEEP_EFFECT
	db POISON_EFFECT
	db PARALYZE_EFFECT
	db $FF

UsableMoveEffectsDuringFlyOrDig:
	db HAZE_EFFECT
	db BIDE_EFFECT
	db SWITCH_AND_TELEPORT_EFFECT
	db FLY_EFFECT
	db MIST_EFFECT
	db FOCUS_ENERGY_EFFECT ; Kappa
	db LIGHT_SCREEN_EFFECT
	db REFLECT_EFFECT
	db SUBSTITUTE_EFFECT
	db MIMIC_EFFECT
	db METRONOME_EFFECT ; Kappa
	db DISABLE_EFFECT
	db $ff

InterruptChargingEffectMoves:
	db DIG
	db FLY
	db STUN_SPORE
	db THUNDER_WAVE
	db GLARE
	db SING
	db SLEEP_POWDER
	db HYPNOSIS
	db LOVELY_KISS
	db SPORE
	db BITE
	db STOMP
	db ROLLING_KICK
	db HEADBUTT
	db BONE_CLUB
	db HYPER_FANG

ConfusionMoves:
	db SUPERSONIC
	db CONFUSE_RAY
	db $ff

SmartAI:
; damaging move priority on turn 3+
	ld a, [wAILayer2Encouragement]
	cp $2
	jr c, .healingcheck
	ld hl, wAIMoveWeightings - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.damageloop
	dec b
	jr z, .healingcheck
	inc hl
	ld a, [de]
	and a
	jr z, .healingcheck
	inc de
	call ReadMove
	ld a, [wEnemyMovePower]
	and a
	jr nz, .encourage
	ld a, [wEnemyMoveEffect]
	cp METRONOME_EFFECT
	jr z, .encourage
	cp MIRROR_MOVE_EFFECT
	jr z, .encourage
	cp BIDE_EFFECT
	jr nz, .damageloop
; encourage by 0-2
.encourage
	call Random
	cp 192 ; 75%
	ld c, a
	jr nc, .skip1
	dec [hl]
.skip1
	call Random
	cp c ; I have no idea what this does
	jr c, .damageloop
	dec [hl]
	jr .damageloop
; healing moves?
.healingcheck
	ld a, [wEnemyMonMaxHP]
	and a
	jr z, .noscale
; divide hp by four
	ld b, a
	ld a, [wEnemyMonMaxHP+1]
	srl b
	rr a
	ld b, a
	ld a, [wEnemyMonHP]
	ld c, a
	ld a, [wEnemyMonHP+1]
	srl c
	rr a
	ld c, a
	jr .realhealcheck
.noscale
	ld a, [wEnemyMonMaxHP+1]
	ld b, a
	ld a, [wEnemyMonHP+1]
	ld c, a
.realhealcheck
	push bc
	srl b
	ld a, c
	cp b
	ld hl, HealingMoves
	jr nc, .debuffhealingmoves
	ld b, -8
	call Random
	cp $c0 ; 3/4 chance
	jr nc, .explosioncheck
	jr .applyhealingchange
.debuffhealingmoves
	ld b, 10
.applyhealingchange
	call AlterMovePriorityArray
.explosioncheck
	pop bc
	srl c
	srl c
	ld a,c
	cp b ; HP 1/4 of total HP?
	ld hl, ExplosionMoves
	jr nc, .debuffexplosionmoves
	ld b, -8
	call Random
	cp $c0 ; 3/4 chance
	jr nc, .superfangcheck
	jr .applyexplosionchange
.debuffexplosionmoves
	ld b, 10
.applyexplosionchange
	call AlterMovePriorityArray
.superfangcheck
	ld a,SUPER_FANG
	ld [wAIBuffer1],a
	ld a,[wEnemyMonHP]
	ld b,a
	ld a,[wEnemyMonHP+1]
	ld c,a
	ld h,b
	ld l,c
	add hl,bc ; scale current HP x4
	add hl,bc
	add hl,bc
	ld c,l
	ld b,h
	
	ld a,[wEnemyMonMaxHP]
	ld d,a
	ld a,[wEnemyMonMaxHP+1]
	ld e,a
	ld h,d
	ld l,e
	add hl,de ; scale total HP x3
	add hl,de
	ld e,l
	ld d,h
	
	ld a, e ; wEnemyMonHPMax + 1
	sub c
	ld a, d ; wEnemyMonHPMax
	sbc b ; is 4 * current HP greater than 3 * max HP?
	ld b,$20
	jr c, .curHPnotgreater
; cur HP greater
	ld b,-5
	call Random
	cp $c0
	jr nc, .dreameatercheck
.curHPnotgreater
	call AlterMovePriority
; dream eater check
.dreameatercheck
	ld a, [wBattleMonStatus]
	and SLP
	ld a, DREAM_EATER
	ld [wAIBuffer1], a
	jr z, .debuffdreameater
	ld b, -1
	jr .applydreameater
.debuffdreameater
	ld b, 20
.applydreameater
	call AlterMovePriority
.effectivenesscheck
; encourage any damaging move with SE; slightly discourage any NVE move but not by as much
	ld hl, wAIMoveWeightings - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.seloop
	dec b
	jr z, .selfbuffcheck
	inc hl
	ld a, [de]
	and a
	jr z, .selfbuffcheck
	inc de
	call ReadMove
	ld a, [wEnemyMoveEffect]
	cp SUPER_FANG_EFFECT
	jr z, .seloop
	cp SPECIAL_DAMAGE_EFFECT
	jr z, .seloop
	ld a, [wEnemyMovePower]
	cp 10
	jr c, .seloop
	push hl
	push bc
	push de
	callab AIGetTypeEffectiveness
	pop de
	pop bc
	pop hl
	ld a, [wd11e]
	cp 10
	jr z, .seloop
	jr c, .nvemove
; strongly encourage (SE)
	rept 4
	dec [hl]
	endr
	cp 21
	jr c, .seloop
; strongly encourage 4x SE even more
	rept 3
	dec [hl]
	endr
	jr .seloop
.nvemove
; slightly discourage
	and a
	jr z, .immunity
	inc [hl]
	cp 3
	jr nc, .seloop
	inc [hl]
	jr .seloop
.immunity
; strongly discourage immunity
	ld a, [hl]
	add 50
	ld [hl], a
	jr .seloop
.selfbuffcheck
; 50% chance to encourage self-buff or status on turn 1/2
	ld a, [wAILayer2Encouragement]
	cp $2
	ld b, 20 ; 7.84%
	jr nc, .gotProbability
	dec a
	ld b, $60 ; 37.5%
	jr z, .gotProbability
	ld b, $80
.gotProbability
	call Random
	cp b
	ret nc
	ld hl, MehStatusMoves
	ld b, -3
	call AlterMovePriorityArray
	ld hl, LightBuffStatusMoves
	ld b, -5
	call AlterMovePriorityArray
	ld hl, HeavyBuffStatusMoves
	ld b, -6
	jp AlterMovePriorityArray

; slightly encourage moves with specific effects.
; in particular, stat-modifying moves and other move effects
; that fall in-bewteen
AIMoveChoiceModification2: ; 397e7 (e:57e7)
	ret

MehStatusMoves:
	db GROWL
	db DISABLE
	db MIST
	db HARDEN
	db WITHDRAW
	db DEFENSE_CURL
	db TAIL_WHIP
	db LEER
	db $FF
	
LightBuffStatusMoves:
	db GROWTH
	db MEDITATE
	db AGILITY
	db MINIMIZE
	db DOUBLE_TEAM
	db REFLECT
	db LIGHT_SCREEN
	db BARRIER
	db SUBSTITUTE
	db POISONPOWDER
	db STRING_SHOT
	db SCREECH
	db SMOKESCREEN
	db POISON_GAS
	db FLASH
	db SHARPEN
	db SAND_ATTACK
	db LEECH_SEED
	db $FF

HeavyBuffStatusMoves:
	db SWORDS_DANCE
	db AMNESIA
	db SING
	db SLEEP_POWDER
	db HYPNOSIS
	db LOVELY_KISS
	db SPORE
	db STUN_SPORE
	db THUNDER_WAVE
	db GLARE
	db CONFUSE_RAY
	db SUPERSONIC
	db $FF
	
HealingMoves:
	db REST
	db RECOVER
	db SOFTBOILED
	db $FF

ExplosionMoves:
	db EXPLOSION
	db SELFDESTRUCT
	db $FF

AlterMovePriority:
; look for move in W_AIBUFFER in wEnemyMonMoves
; [wAIBuffer1] = move
; b = priority change
	ld hl, wAIMoveWeightings - 1
	ld de, wEnemyMonMoves
	ld c, NUM_MOVES + 1
.moveloop
	dec c
	ret z
	inc hl
	ld a, [de]
	and a
	ret z
	inc de
	push bc
	ld b, a
	ld a, [wAIBuffer1]
	cp b
	pop bc
	jr nz, .moveloop
	ld a, [hl]
	add b
	ld [hl], a
	jr .moveloop
	
AlterMovePriorityArray:
; find if the enemy mon's moveset has a move in move array hl
; hl = move array
; b = priority change
	ld a, h
	ld [wAIBuffer1], a
	ld a, l
	ld [wAIBuffer2], a
	ld hl, wAIMoveWeightings - 1
	ld de, wEnemyMonMoves
	ld c, NUM_MOVES + 1
.moveloop
	dec c
	ret z
	inc hl
	ld a, [de]
	and a
	ret z
	inc de
	push hl
	push de
	push bc
	ld b, a
	ld a, [wAIBuffer1]
	ld h, a
	ld a, [wAIBuffer2]
	ld l, a
	ld a, b
	ld de, $0001
	call IsInArray
	pop bc
	pop de
	pop hl
	jr nc, .moveloop
	ld a, [hl]
	add b
	ld [hl], a
	jr .moveloop
	
; encourages moves that are effective against the player's mon (even if non-damaging).
; discourage damaging moves that are ineffective or not very effective against the player's mon,
; unless there's no damaging move that deals at least neutral damage
AIMoveChoiceModification3: ; 39817 (e:5817)
	ret

ReadMove: ; 39884 (e:5884)
	push hl
	push de
	push bc
	dec a
	ld hl,Moves
	ld bc,6
	call AddNTimes
	ld de,wEnemyMoveNum
	call CopyData
	pop bc
	pop de
	pop hl
	ret

; move choice modification methods that are applied for each trainer class
; 0 is sentinel value
TrainerClassMoveChoiceModifications: ; 3989b (e:589b)
	db 1,4,0      ; YOUNGSTER
	db 1,4,0    ; BUG CATCHER
	db 1,4,0    ; LASS
	db 1,4,0  ; SAILOR
	db 1,4,0    ; JR__TRAINER_M
	db 1,4,0    ; JR__TRAINER_F
	db 1,4,0; POKEMANIAC
	db 1,4,0  ; SUPER_NERD
	db 1,4,0    ; HIKER
	db 1,4,0    ; BIKER
	db 1,4,0  ; BURGLAR
	db 1,4,0    ; ENGINEER
	db 1,4,0  ; JUGGLER_X
	db 1,4,0  ; FISHER
	db 1,4,0  ; SWIMMER
	db 1,4,0      ; CUE_BALL
	db 1,4,0    ; GAMBLER
	db 1,4,0  ; BEAUTY
	db 1,4,0  ; PSYCHIC_TR
	db 1,4,0  ; ROCKER
	db 1,4,0    ; JUGGLER
	db 1,4,0    ; TAMER
	db 1,4,0    ; BIRD_KEEPER
	db 1,4,0    ; BLACKBELT
	db 1,4,0    ; SONY1
	db 1,4,0  ; PROF_OAK
	db 1,4,0  ; CHIEF
	db 1,4,0  ; SCIENTIST
	db 1,4,0  ; GIOVANNI
	db 1,4,0  ; ROCKET
	db 1,4,0  ; COOLTRAINER_M
	db 1,4,0  ; COOLTRAINER_F
	db 1,4,0  ; BRUNO
	db 1,4,0  ; BROCK
	db 1,4,0  ; MISTY
	db 1,4,0  ; LT__SURGE
	db 1,4,0  ; ERIKA
	db 1,4,0  ; KOGA
	db 1,4,0  ; BLAINE
	db 1,4,0  ; SABRINA
	db 1,4,0  ; GENTLEMAN
	db 1,4,0  ; SONY2
	db 1,4,0  ; SONY3
	db 1,4,0  ; LORELEI
	db 1,4,0  ; CHANNELER
	db 1,4,0  ; AGATHA
	db 1,4,0  ; LANCE

TrainerAI: ; 3a52e (e:652e)
;XXX called at 34964, 3c342, 3c398
	and a
	ld a,[wIsInBattle]
	dec a
	ret z ; if not a trainer, we're done here
	ld a,[wLinkState]
	cp LINK_STATE_BATTLING
	ret z
	ld a,[wTrainerClass] ; what trainer class is this?
	dec a
	ld c,a
	ld b,0
	ld hl,TrainerAIPointers
	add hl,bc
	add hl,bc
	add hl,bc
	ld a,[wAICount]
	and a
	ret z ; if no AI uses left, we're done here
	inc hl
	inc a
	jr nz,.getpointer
	dec hl
	ld a,[hli]
	ld [wAICount],a
.getpointer
	ld a,[hli]
	ld h,[hl]
	ld l,a
	call Random
	jp [hl]

TrainerAIPointers: ; 3a55c (e:655c)
; one entry per trainer class
; first byte, number of times (per Pokémon) it can occur
; next two bytes, pointer to AI subroutine for trainer class
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,JugglerAI ; juggler_x
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,JugglerAI ; juggler
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 2,BlackbeltAI ; blackbelt
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 1,GenericAI ; chief
	dbw 3,GenericAI
	dbw 1,GiovanniAI ; giovanni
	dbw 3,GenericAI
	dbw 2,CooltrainerMAI ; cooltrainerm
	dbw 1,CooltrainerFAI ; cooltrainerf
	dbw 2,BrunoAI ; bruno
	dbw 5,BrockAI ; brock
	dbw 1,MistyAI ; misty
	dbw 1,LtSurgeAI ; surge
	dbw 1,ErikaAI ; erika
	dbw 2,KogaAI ; koga
	dbw 2,BlaineAI ; blaine
	dbw 1,SabrinaAI ; sabrina
	dbw 3,GenericAI
	dbw 1,Sony2AI ; sony2
	dbw 1,Sony3AI ; sony3
	dbw 2,LoreleiAI ; lorelei
	dbw 3,GenericAI
	dbw 2,AgathaAI ; agatha
	dbw 1,LanceAI ; lance

JugglerAI: ; 3a5e9 (e:65e9)
	cp $40
	ret nc
	jp AISwitchIfEnoughMons

BlackbeltAI: ; 3a5ef (e:65ef)
	cp $20
	ret nc
	jp AIUseXAttack

GiovanniAI: ; 3a5f5 (e:65f5)
	cp $40
	ret nc
	jp AIUseGuardSpec

CooltrainerMAI: ; 3a5fb (e:65fb)
	cp $40
	ret nc
	jp AIUseXAttack

CooltrainerFAI: ; 3a601 (e:6601)
	cp $40
	ld a,$A
	call AICheckIfHPBelowFraction
	jp c,AIUseHyperPotion
	ld a,5
	call AICheckIfHPBelowFraction
	ret nc
	jp AISwitchIfEnoughMons

BrockAI: ; 3a614 (e:6614)
; if his active monster has a status condition, use a full heal
	ld a,[wEnemyMonStatus]
	and a
	ret z
	jp AIUseFullHeal

MistyAI: ; 3a61c (e:661c)
	cp $40
	ret nc
	jp AIUseXDefend

LtSurgeAI: ; 3a622 (e:6622)
	cp $40
	ret nc
	jp AIUseXSpeed

ErikaAI: ; 3a628 (e:6628)
	cp $80
	ret nc
	ld a,$A
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseSuperPotion

KogaAI: ; 3a634 (e:6634)
	cp $40
	ret nc
	jp AIUseXAttack

BlaineAI: ; 3a63a (e:663a)
	cp $40
	ret nc
	jp AIUseSuperPotion

SabrinaAI: ; 3a640 (e:6640)
	cp $40
	ret nc
	ld a,$A
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseHyperPotion

Sony2AI: ; 3a64c (e:664c)
	cp $20
	ret nc
	ld a,5
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUsePotion

Sony3AI: ; 3a658 (e:6658)
	cp $20
	ret nc
	ld a,5
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseFullRestore

LoreleiAI: ; 3a664 (e:6664)
	cp $80
	ret nc
	ld a,5
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseSuperPotion

BrunoAI: ; 3a670 (e:6670)
	cp $40
	ret nc
	jp AIUseXDefend

AgathaAI: ; 3a676 (e:6676)
	cp $14
	jp c,AISwitchIfEnoughMons
	cp $80
	ret nc
	ld a,4
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseSuperPotion

LanceAI: ; 3a687 (e:6687)
	cp $80
	ret nc
	ld a,5
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseHyperPotion

GenericAI: ; 3a693 (e:6693)
	and a ; clear carry
	ret

; end of individual trainer AI routines

DecrementAICount: ; 3a695 (e:6695)
	ld hl,wAICount
	dec [hl]
	scf
	ret

AI_PlayHealSFX: ; 3a69b (e:669b)
	ld a, SFX_HEAL_AILMENT
	jp PlaySoundWaitForCurrent

AIUseFullRestore: ; 3a6a0 (e:66a0)
	call AICureStatus
	ld a,FULL_RESTORE
	ld [wAIItem],a
	ld de,wHPBarOldHP
	ld hl,wEnemyMonHP + 1
	ld a,[hld]
	ld [de],a
	inc de
	ld a,[hl]
	ld [de],a
	inc de
	ld hl,wEnemyMonMaxHP + 1
	ld a,[hld]
	ld [de],a
	inc de
	ld [wHPBarMaxHP],a
	ld [wEnemyMonHP + 1],a
	ld a,[hl]
	ld [de],a
	ld [wHPBarMaxHP+1],a
	ld [wEnemyMonHP],a
	jr AIPrintItemUseAndUpdateHPBar

AIUsePotion: ; 3a6ca (e:66ca)
; enemy trainer heals his monster with a potion
	ld a,POTION
	ld b,20
	jr AIRecoverHP

AIUseSuperPotion: ; 3a6d0 (e:66d0)
; enemy trainer heals his monster with a super potion
	ld a,SUPER_POTION
	ld b,50
	jr AIRecoverHP

AIUseHyperPotion: ; 3a6d6 (e:66d6)
; enemy trainer heals his monster with a hyper potion
	ld a,HYPER_POTION
	ld b,200
	; fallthrough

AIRecoverHP: ; 3a6da (e:66da)
; heal b HP and print "trainer used $(a) on pokemon!"
	ld [wAIItem],a
	ld hl,wEnemyMonHP + 1
	ld a,[hl]
	ld [wHPBarOldHP],a
	add b
	ld [hld],a
	ld [wHPBarNewHP],a
	ld a,[hl]
	ld [wHPBarOldHP+1],a
	ld [wHPBarNewHP+1],a
	jr nc,.next
	inc a
	ld [hl],a
	ld [wHPBarNewHP+1],a
.next
	inc hl
	ld a,[hld]
	ld b,a
	ld de,wEnemyMonMaxHP + 1
	ld a,[de]
	dec de
	ld [wHPBarMaxHP],a
	sub b
	ld a,[hli]
	ld b,a
	ld a,[de]
	ld [wHPBarMaxHP+1],a
	sbc b
	jr nc,AIPrintItemUseAndUpdateHPBar
	inc de
	ld a,[de]
	dec de
	ld [hld],a
	ld [wHPBarNewHP],a
	ld a,[de]
	ld [hl],a
	ld [wHPBarNewHP+1],a
	; fallthrough

AIPrintItemUseAndUpdateHPBar: ; 3a718 (e:6718)
	call AIPrintItemUse_
	coord hl, 2, 2
	xor a
	ld [wHPBarType],a
	predef UpdateHPBar2
	jp DecrementAICount

AISwitchIfEnoughMons: ; 3a72a (e:672a)
; enemy trainer switches if there are 3 or more unfainted mons in party
	ld a,[wEnemyPartyCount]
	ld c,a
	ld hl,wEnemyMon1HP

	ld d,0 ; keep count of unfainted monsters

	; count how many monsters haven't fainted yet
.loop
	ld a,[hli]
	ld b,a
	ld a,[hld]
	or b
	jr z,.Fainted ; has monster fainted?
	inc d
.Fainted
	push bc
	ld bc, wEnemyMon2 - wEnemyMon1
	add hl,bc
	pop bc
	dec c
	jr nz,.loop

	ld a,d ; how many available monsters are there?
	cp 2 ; don't bother if only 1 or 2
	jp nc,SwitchEnemyMon
	and a
	ret

SwitchEnemyMon: ; 3a74b (e:674b)

; prepare to withdraw the active monster: copy hp, number, and status to roster

	ld a,[wEnemyMonPartyPos]
	ld hl,wEnemyMon1HP
	ld bc,wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld d,h
	ld e,l
	ld hl,wEnemyMonHP
	ld bc,4
	call CopyData

	ld hl, AIBattleWithdrawText
	call PrintText

	ld a,1
	ld [wFirstMonsNotOutYet],a
	callab EnemySendOut
	xor a
	ld [wFirstMonsNotOutYet],a

	ld a,[wLinkState]
	cp LINK_STATE_BATTLING
	ret z
	scf
	ret

AIBattleWithdrawText: ; 3a781 (e:6781)
	TX_FAR _AIBattleWithdrawText
	db "@"

AIUseFullHeal: ; 3a786 (e:6786)
	call AI_PlayHealSFX
	call AICureStatus
	ld a,FULL_HEAL
	jp AIPrintItemUse

AICureStatus: ; 3a791 (e:6791)
; cures the status of enemy's active pokemon
	ld a,[wEnemyMonPartyPos]
	ld hl,wEnemyMon1Status
	ld bc,wEnemyMon2 - wEnemyMon1
	call AddNTimes
	xor a
	ld [hl],a ; clear status in enemy team roster
	ld [wEnemyMonStatus],a ; clear status of active enemy
	ld hl,wEnemyBattleStatus3
	res 0,[hl]
	ret

AIUseXAccuracy: ; 0x3a7a8 unused
	call AI_PlayHealSFX
	ld hl,wEnemyBattleStatus2
	set 0,[hl]
	ld a,X_ACCURACY
	jp AIPrintItemUse

AIUseGuardSpec: ; 3a7b5 (e:67b5)
	call AI_PlayHealSFX
	ld hl,wEnemyBattleStatus2
	set 1,[hl]
	ld a,GUARD_SPEC
	jp AIPrintItemUse

AIUseDireHit: ; 0x3a7c2 unused
	call AI_PlayHealSFX
	ld hl,wEnemyBattleStatus2
	set 2,[hl]
	ld a,DIRE_HIT
	jp AIPrintItemUse

AICheckIfHPBelowFraction: ; 3a7cf (e:67cf)
; return carry if enemy trainer's current HP is below 1 / a of the maximum
	ld [hDivisor],a
	ld hl,wEnemyMonMaxHP
	ld a,[hli]
	ld [hDividend],a
	ld a,[hl]
	ld [hDividend + 1],a
	ld b,2
	call Divide
	ld a,[hQuotient + 3]
	ld c,a
	ld a,[hQuotient + 2]
	ld b,a
	ld hl,wEnemyMonHP + 1
	ld a,[hld]
	ld e,a
	ld a,[hl]
	ld d,a
	ld a,d
	sub b
	ret nz
	ld a,e
	sub c
	ret

AIUseXAttack: ; 3a7f2 (e:67f2)
	ld b,$A
	ld a,X_ATTACK
	jr AIIncreaseStat

AIUseXDefend: ; 3a7f8 (e:67f8)
	ld b,$B
	ld a,X_DEFEND
	jr AIIncreaseStat

AIUseXSpeed: ; 3a7fe (e:67fe)
	ld b,$C
	ld a,X_SPEED
	jr AIIncreaseStat

AIUseXSpecial: ; 3a804 (e:6804)
	ld b,$D
	ld a,X_SPECIAL
	; fallthrough

AIIncreaseStat: ; 3a808 (e:6808)
	ld [wAIItem],a
	push bc
	call AIPrintItemUse_
	pop bc
	ld hl,wEnemyMoveEffect
	ld a,[hld]
	push af
	ld a,[hl]
	push af
	push hl
	ld a,ENEMYXSTATITEM_ANIM
	ld [hli],a
	ld [hl],b
	callab StatModifierUpEffect
	pop hl
	pop af
	ld [hli],a
	pop af
	ld [hl],a
	jp DecrementAICount

AIPrintItemUse: ; 3a82c (e:682c)
	ld [wAIItem],a
	call AIPrintItemUse_
	jp DecrementAICount

AIPrintItemUse_: ; 3a835 (e:6835)
; print "x used [wAIItem] on z!"
	ld a,[wAIItem]
	ld [wd11e],a
	call GetItemName
	ld hl, AIBattleUseItemText
	jp PrintText

AIBattleUseItemText: ; 3a844 (e:6844)
	TX_FAR _AIBattleUseItemText
	db "@"