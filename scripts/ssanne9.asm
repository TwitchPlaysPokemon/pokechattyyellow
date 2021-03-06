SSAnne9Script:
	call DisableAutoTextBoxDrawing
	ld hl, SSAnne9TrainerHeaders
	ld de, SSAnne9ScriptPointers
	ld a, [wSSAnne9CurScript]
	call ExecuteCurMapScriptInTable
	ld [wSSAnne9CurScript], a
	ret

SSAnne9ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SSAnne9TextPointers:
	dw SSAnne9Text1
	dw SSAnne9Text2
	dw SSAnne9Text3
	dw SSAnne9Text4
	dw SSAnne9Text5
	dw PickUpItemText
	dw SSAnne9Text7
	dw SSAnne9Text8
	dw PickUpItemText
	dw SSAnne9Text10
	dw SSAnne9Text11
	dw SSAnne9Text12
	dw SSAnne9Text13

SSAnne9TrainerHeaders:
SSAnne9TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_9_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_9_TRAINER_0
	dw SSAnne9BattleText1 ; TextBeforeBattle
	dw SSAnne9AfterBattleText1 ; TextAfterBattle
	dw SSAnne9EndBattleText1 ; TextEndBattle
	dw SSAnne9EndBattleText1 ; TextEndBattle

SSAnne9TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_9_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_9_TRAINER_1
	dw SSAnne9BattleText2 ; TextBeforeBattle
	dw SSAnne9AfterBattleText2 ; TextAfterBattle
	dw SSAnne9EndBattleText2 ; TextEndBattle
	dw SSAnne9EndBattleText2 ; TextEndBattle

SSAnne9TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_9_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_9_TRAINER_2
	dw SSAnne9BattleText3 ; TextBeforeBattle
	dw SSAnne9AfterBattleText3 ; TextAfterBattle
	dw SSAnne9EndBattleText3 ; TextEndBattle
	dw SSAnne9EndBattleText3 ; TextEndBattle

SSAnne9TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_9_TRAINER_3
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_9_TRAINER_3
	dw SSAnne9BattleText4 ; TextBeforeBattle
	dw SSAnne9AfterBattleText4 ; TextAfterBattle
	dw SSAnne9EndBattleText4 ; TextEndBattle
	dw SSAnne9EndBattleText4 ; TextEndBattle

	db $ff

SSAnne9Text1:
	TX_ASM
	ld hl, SSAnne9TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SSAnne9Text2:
	TX_ASM
	ld hl, SSAnne9TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SSAnne9Text3:
	TX_ASM
	ld hl, SSAnne9TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SSAnne9Text4:
	TX_ASM
	ld hl, SSAnne9TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SSAnne9Text5:
	TX_ASM
	call SaveScreenTilesToBuffer1
	ld hl, SSAnne9Text_61bf2
	call PrintText
	call LoadScreenTilesFromBuffer1
	ld a, SNORLAX
	call DisplayPokedex
	jp TextScriptEnd

SSAnne9Text_61bf2:
	TX_MARKOV _SSAnne9Text_61bf2
	db "@"

SSAnne9Text7:
	TX_ASM
	ld hl, SSAnne9Text_61c01
	call PrintText
	jp TextScriptEnd

SSAnne9Text_61c01:
	TX_MARKOV _SSAnne9Text_61c01
	db "@"

SSAnne9Text8:
	TX_ASM
	ld hl, SSAnne9Text_61c10
	call PrintText
	jp TextScriptEnd

SSAnne9Text_61c10:
	TX_MARKOV _SSAnne9Text_61c10
	db "@"

SSAnne9Text10:
	TX_ASM
	callba Func_f2570
	jp TextScriptEnd

SSAnne9Text11:
	TX_ASM
	callba Func_f257c
	jp TextScriptEnd

SSAnne9Text12:
	TX_ASM
	callba Func_f2588
	jp TextScriptEnd

SSAnne9Text13:
	TX_ASM
	callba Func_f2594
	jp TextScriptEnd

SSAnne9BattleText1:
	TX_MARKOV _SSAnne9BattleText1
	db "@"

SSAnne9EndBattleText1:
	TX_MARKOV _SSAnne9EndBattleText1
	db "@"

SSAnne9AfterBattleText1:
	TX_MARKOV _SSAnne9AfterBattleText1
	db "@"

SSAnne9BattleText2:
	TX_MARKOV _SSAnne9BattleText2
	db "@"

SSAnne9EndBattleText2:
	TX_MARKOV _SSAnne9EndBattleText2
	db "@"

SSAnne9AfterBattleText2:
	TX_MARKOV _SSAnne9AfterBattleText2
	db "@"

SSAnne9BattleText3:
	TX_MARKOV _SSAnne9BattleText3
	db "@"

SSAnne9EndBattleText3:
	TX_MARKOV _SSAnne9EndBattleText3
	db "@"

SSAnne9AfterBattleText3:
	TX_MARKOV _SSAnne9AfterBattleText3
	db "@"

SSAnne9BattleText4:
	TX_MARKOV _SSAnne9BattleText4
	db "@"

SSAnne9EndBattleText4:
	TX_MARKOV _SSAnne9EndBattleText4
	db "@"

SSAnne9AfterBattleText4:
	TX_MARKOV _SSAnne9AfterBattleText4
	db "@"
