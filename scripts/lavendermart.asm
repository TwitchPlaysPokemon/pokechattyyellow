LavenderMartScript:
	jp EnableAutoTextBoxDrawing

LavenderMartTextPointers:
	dw LavenderCashierText
	dw LavenderMartText2
	dw LavenderMartText3

LavenderMartText2:
	TX_MARKOV _LavenderMartText2
	db "@"

LavenderMartText3:
	TX_ASM
	CheckEvent EVENT_RESCUED_MR_FUJI
	jr nz, .Nugget
	ld hl, .ReviveText
	call PrintText
	jr .done

.Nugget
	ld hl, .NuggetText
	call PrintText
.done
	jp TextScriptEnd

.ReviveText
	TX_MARKOV _LavenderMartReviveText
	db "@"

.NuggetText
	TX_MARKOV _LavenderMartNuggetText
	db "@"
