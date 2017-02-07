SafariZoneEastScript:
	jp EnableAutoTextBoxDrawing

SafariZoneEastTextPointers:
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw SafariZoneEastText5
	dw SafariZoneEastText6
	dw SafariZoneEastText7

SafariZoneEastText5:
	TX_MARKOV _SafariZoneEastText5
	db "@"

SafariZoneEastText6:
	TX_MARKOV _SafariZoneEastText6
	db "@"

SafariZoneEastText7:
	TX_MARKOV _SafariZoneEastText7
	db "@"
