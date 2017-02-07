SafariZoneCenterScript:
	jp EnableAutoTextBoxDrawing

SafariZoneCenterTextPointers:
	dw PickUpItemText
	dw SafariZoneCenterText2
	dw SafariZoneCenterText3

SafariZoneCenterText2:
	TX_MARKOV _SafariZoneCenterText2
	db "@"

SafariZoneCenterText3:
	TX_MARKOV _SafariZoneCenterText3
	db "@"
