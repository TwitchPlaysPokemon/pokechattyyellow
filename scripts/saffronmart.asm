SaffronMartScript:
	jp EnableAutoTextBoxDrawing

SaffronMartTextPointers:
	dw SaffronCashierText
	dw SaffronMartText2
	dw SaffronMartText3

SaffronMartText2:
	TX_MARKOV _SaffronMartText2
	db "@"

SaffronMartText3:
	TX_MARKOV _SaffronMartText3
	db "@"
