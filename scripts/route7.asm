Route7Script:
	call EnableAutoTextBoxDrawing
	ret

Route7TextPointers:
	dw Route7Text1

Route7Text1:
	TX_MARKOV _Route7Text1
	db "@"
