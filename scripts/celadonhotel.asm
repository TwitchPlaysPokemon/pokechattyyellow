CeladonHotelScript:
	jp EnableAutoTextBoxDrawing

CeladonHotelTextPointers:
	dw CeladonHotelText1
	dw CeladonHotelText2
	dw CeladonHotelText3

CeladonHotelText1:
	TX_MARKOV _CeladonHotelText1
	db "@"

CeladonHotelText2:
	TX_MARKOV _CeladonHotelText2
	db "@"

CeladonHotelText3:
	TX_MARKOV _CeladonHotelText3
	db "@"
