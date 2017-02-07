Route2Script:
	jp EnableAutoTextBoxDrawing

Route2TextPointers:
	dw PickUpItemText
	dw PickUpItemText
	dw Route2Text3
	dw Route2Text4

Route2Text3:
	TX_MARKOV _Route2Text3
	db "@"

Route2Text4:
	TX_MARKOV _Route2Text4
	db "@"
