MtMoon2Script:
	call EnableAutoTextBoxDrawing
	ret

MtMoon2TextPointers:
	dw MtMoonText1

MtMoonText1:
	TX_MARKOV _MtMoonText1
	db "@"
