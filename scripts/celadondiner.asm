CeladonDinerScript:
	call EnableAutoTextBoxDrawing
	ret

CeladonDinerTextPointers:
	dw CeladonDinerText1
	dw CeladonDinerText2
	dw CeladonDinerText3
	dw CeladonDinerText4
	dw CeladonDinerText5

CeladonDinerText1:
	TX_MARKOV _CeladonDinerText1
	db "@"

CeladonDinerText2:
	TX_MARKOV _CeladonDinerText2
	db "@"

CeladonDinerText3:
	TX_MARKOV _CeladonDinerText3
	db "@"

CeladonDinerText4:
	TX_MARKOV _CeladonDinerText4
	db "@"

CeladonDinerText5:
	TX_ASM
	callab Func_f1f31
	jp TextScriptEnd

