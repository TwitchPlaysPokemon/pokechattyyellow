CeruleanMartScript:
	jp EnableAutoTextBoxDrawing

CeruleanMartTextPointers:
	dw CeruleanCashierText
	dw CeruleanMartText2
	dw CeruleanMartText3

CeruleanMartText2:
	TX_MARKOV _CeruleanMartText2
	db "@"

CeruleanMartText3:
	TX_MARKOV _CeruleanMartText3
	db "@"
