VermilionMartScript:
	jp EnableAutoTextBoxDrawing

VermilionMartTextPointers:
	dw VermilionCashierText
	dw VermilionMartText2
	dw VermilionMartText3

VermilionMartText2:
	TX_MARKOV _VermilionMartText2
	db "@"

VermilionMartText3:
	TX_MARKOV _VermilionMartText3
	db "@"
