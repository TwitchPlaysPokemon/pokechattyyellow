CinnabarMartScript:
	jp EnableAutoTextBoxDrawing

CinnabarMartTextPointers:
	dw CinnabarCashierText
	dw CinnabarMartText2
	dw CinnabarMartText3

CinnabarMartText2:
	TX_MARKOV _CinnabarMartText2
	db "@"

CinnabarMartText3:
	TX_MARKOV _CinnabarMartText3
	db "@"
