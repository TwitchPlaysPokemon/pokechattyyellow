CeladonGymScript:
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	call nz, CeladonGymScript_48927
	call EnableAutoTextBoxDrawing
	ld hl, CeladonGymTrainerHeaders
	ld de, CeladonGymScriptPointers
	ld a, [wCeladonGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCeladonGymCurScript], a
	ret

CeladonGymScript_48927:
	ld hl, Gym4CityName
	ld de, Gym4LeaderName
	jp LoadGymLeaderAndCityName

Gym4CityName:
	db "CELADON CITY@"

Gym4LeaderName:
	db "ERIKA@"

CeladonGymText_48943:
	xor a
	ld [wJoyIgnore], a
	ld [wCeladonGymCurScript], a
	ld [wCurMapScript], a
	ret

CeladonGymScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw CeladonGymScript3

CeladonGymScript3:
	ld a, [wIsInBattle]
	cp $ff
	jp z, CeladonGymText_48943
	ld a, $f0
	ld [wJoyIgnore], a

CeladonGymText_48963:
	ld a, $9
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_ERIKA
	lb bc, TM_21, 1
	call GiveItem
	jr nc, .BagFull
	ld a, $a
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM21
	jr .asm_4898c
.BagFull
	ld a, $b
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
.asm_4898c
	ld hl, wObtainedBadges
	set 3, [hl]
	ld hl, wBeatGymFlags
	set 3, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_CELADON_GYM_TRAINER_0, EVENT_BEAT_CELADON_GYM_TRAINER_7

	jp CeladonGymText_48943

CeladonGymTextPointers:
	dw CeladonGymText1
	dw CeladonGymText2
	dw CeladonGymText3
	dw CeladonGymText4
	dw CeladonGymText5
	dw CeladonGymText6
	dw CeladonGymText7
	dw CeladonGymText8
	dw CeladonGymText9
	dw TM21Text
	dw TM21NoRoomText

CeladonGymTrainerHeaders:
CeladonGymTrainerHeader0:
	dbEventFlagBit EVENT_BEAT_CELADON_GYM_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_CELADON_GYM_TRAINER_0
	dw CeladonGymBattleText2 ; TextBeforeBattle
	dw CeladonGymAfterBattleText2 ; TextAfterBattle
	dw CeladonGymEndBattleText2 ; TextEndBattle
	dw CeladonGymEndBattleText2 ; TextEndBattle

CeladonGymTrainerHeader2:
	dbEventFlagBit EVENT_BEAT_CELADON_GYM_TRAINER_2
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_CELADON_GYM_TRAINER_2
	dw CeladonGymBattleText3 ; TextBeforeBattle
	dw CeladonGymAfterBattleText3 ; TextAfterBattle
	dw CeladonGymEndBattleText3 ; TextEndBattle
	dw CeladonGymEndBattleText3 ; TextEndBattle

CeladonGymTrainerHeader3:
	dbEventFlagBit EVENT_BEAT_CELADON_GYM_TRAINER_3
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_CELADON_GYM_TRAINER_3
	dw CeladonGymBattleText4 ; TextBeforeBattle
	dw CeladonGymAfterBattleText4 ; TextAfterBattle
	dw CeladonGymEndBattleText4 ; TextEndBattle
	dw CeladonGymEndBattleText4 ; TextEndBattle

CeladonGymTrainerHeader4:
	dbEventFlagBit EVENT_BEAT_CELADON_GYM_TRAINER_4
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_CELADON_GYM_TRAINER_4
	dw CeladonGymBattleText5 ; TextBeforeBattle
	dw CeladonGymAfterBattleText5 ; TextAfterBattle
	dw CeladonGymEndBattleText5 ; TextEndBattle
	dw CeladonGymEndBattleText5 ; TextEndBattle

CeladonGymTrainerHeader5:
	dbEventFlagBit EVENT_BEAT_CELADON_GYM_TRAINER_5
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_CELADON_GYM_TRAINER_5
	dw CeladonGymBattleText6 ; TextBeforeBattle
	dw CeladonGymAfterBattleText6 ; TextAfterBattle
	dw CeladonGymEndBattleText6 ; TextEndBattle
	dw CeladonGymEndBattleText6 ; TextEndBattle

CeladonGymTrainerHeader6:
	dbEventFlagBit EVENT_BEAT_CELADON_GYM_TRAINER_6
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_CELADON_GYM_TRAINER_6
	dw CeladonGymBattleText7 ; TextBeforeBattle
	dw CeladonGymAfterBattleText7 ; TextAfterBattle
	dw CeladonGymEndBattleText7 ; TextEndBattle
	dw CeladonGymEndBattleText7 ; TextEndBattle

CeladonGymTrainerHeader7:
	dbEventFlagBit EVENT_BEAT_CELADON_GYM_TRAINER_7, 1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_CELADON_GYM_TRAINER_7, 1
	dw CeladonGymBattleText8 ; TextBeforeBattle
	dw CeladonGymAfterBattleText8 ; TextAfterBattle
	dw CeladonGymEndBattleText8 ; TextEndBattle
	dw CeladonGymEndBattleText8 ; TextEndBattle

	db $ff

CeladonGymText1:
	TX_ASM
	CheckEvent EVENT_BEAT_ERIKA
	jr z, .asm_48a2d
	CheckEventReuseA EVENT_GOT_TM21
	jr nz, .asm_48a25
	call z, CeladonGymText_48963
	call DisableWaitingAfterTextDisplay
	jr .asm_48a5b
.asm_48a25
	ld hl, CeladonGymText_48a68
	call PrintText
	jr .asm_48a5b
.asm_48a2d
	ld hl, CeladonGymText_48a5e
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, CeladonGymText_48a63
	ld de, CeladonGymText_48a63
	call SaveEndBattleTextPointers
	ld a, [hSpriteIndexOrTextID]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $4
	ld [wGymLeaderNo], a
	ld a, $3
	ld [wCeladonGymCurScript], a
	ld [wCurMapScript], a
.asm_48a5b
	jp TextScriptEnd

CeladonGymText_48a5e:
	TX_MARKOV _CeladonGymText_48a5e
	db "@"

CeladonGymText_48a63:
	TX_MARKOV _CeladonGymText_48a63
	db "@"

CeladonGymText_48a68:
	TX_MARKOV _CeladonGymText_48a68
	db "@"

CeladonGymText9:
	TX_MARKOV _CeladonGymText9
	db "@"

TM21Text:
	TX_MARKOV _ReceivedTM21Text
	TX_SFX_ITEM
	TX_MARKOV _TM21ExplanationText
	db "@"

TM21NoRoomText:
	TX_MARKOV _TM21NoRoomText
	db "@"

CeladonGymText2:
	TX_ASM
	ld hl, CeladonGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText2:
	TX_MARKOV _CeladonGymBattleText2
	db "@"

CeladonGymEndBattleText2:
	TX_MARKOV _CeladonGymEndBattleText2
	db "@"

CeladonGymAfterBattleText2:
	TX_MARKOV _CeladonGymAfterBattleText2
	db "@"

CeladonGymText3:
	TX_ASM
	ld hl, CeladonGymTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText3:
	TX_MARKOV _CeladonGymBattleText3
	db "@"

CeladonGymEndBattleText3:
	TX_MARKOV _CeladonGymEndBattleText3
	db "@"

CeladonGymAfterBattleText3:
	TX_MARKOV _CeladonGymAfterBattleText3
	db "@"

CeladonGymText4:
	TX_ASM
	ld hl, CeladonGymTrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText4:
	TX_MARKOV _CeladonGymBattleText4
	db "@"

CeladonGymEndBattleText4:
	TX_MARKOV _CeladonGymEndBattleText4
	db "@"

CeladonGymAfterBattleText4:
	TX_MARKOV _CeladonGymAfterBattleText4
	db "@"

CeladonGymText5:
	TX_ASM
	ld hl, CeladonGymTrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText5:
	TX_MARKOV _CeladonGymBattleText5
	db "@"

CeladonGymEndBattleText5:
	TX_MARKOV _CeladonGymEndBattleText5
	db "@"

CeladonGymAfterBattleText5:
	TX_MARKOV _CeladonGymAfterBattleText5
	db "@"

CeladonGymText6:
	TX_ASM
	ld hl, CeladonGymTrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText6:
	TX_MARKOV _CeladonGymBattleText6
	db "@"

CeladonGymEndBattleText6:
	TX_MARKOV _CeladonGymEndBattleText6
	db "@"

CeladonGymAfterBattleText6:
	TX_MARKOV _CeladonGymAfterBattleText6
	db "@"

CeladonGymText7:
	TX_ASM
	ld hl, CeladonGymTrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText7:
	TX_MARKOV _CeladonGymBattleText7
	db "@"

CeladonGymEndBattleText7:
	TX_MARKOV _CeladonGymEndBattleText7
	db "@"

CeladonGymAfterBattleText7:
	TX_MARKOV _CeladonGymAfterBattleText7
	db "@"

CeladonGymText8:
	TX_ASM
	ld hl, CeladonGymTrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText8:
	TX_MARKOV _CeladonGymBattleText8
	db "@"

CeladonGymEndBattleText8:
	TX_MARKOV _CeladonGymEndBattleText8
	db "@"

CeladonGymAfterBattleText8:
	TX_MARKOV _CeladonGymAfterBattleText8
	db "@"
