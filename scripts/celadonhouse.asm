CeladonHouseScript:
	call EnableAutoTextBoxDrawing
	ret

CeladonHouseTextPointers:
	dw CeladonHouseText1
	dw CeladonHouseText2
	dw CeladonHouseText3

CeladonHouseText1:
	TX_MARKOV _CeladonHouseText1
	db "@"

CeladonHouseText2:
	TX_MARKOV _CeladonHouseText2
	db "@"

CeladonHouseText3:
	TX_MARKOV _CeladonHouseText3
	db "@"
