ViridianForestExitScript:
	jp EnableAutoTextBoxDrawing

ViridianForestExitTextPointers:
	dw ViridianForestExitText1
	dw ViridianForestExitText2

ViridianForestExitText1:
	TX_MARKOV _ViridianForestExitText1
	db "@"

ViridianForestExitText2:
	TX_MARKOV _ViridianForestExitText2
	db "@"
