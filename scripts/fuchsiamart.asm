FuchsiaMartScript:
	call EnableAutoTextBoxDrawing
	ret

FuchsiaMartTextPointers:
	dw FuchsiaCashierText
	dw FuchsiaMartText2
	dw FuchsiaMartText3

FuchsiaMartText2:
	TX_MARKOV _FuchsiaMartText2
	db "@"

FuchsiaMartText3:
	TX_MARKOV _FuchsiaMartText3
	db "@"
