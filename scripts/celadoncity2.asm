Func_f1ac6:
	ld hl, Text_f1acd
	call PrintText
	ret

Text_f1acd:
	TX_MARKOV _CeladonCityText10
	db "@"
