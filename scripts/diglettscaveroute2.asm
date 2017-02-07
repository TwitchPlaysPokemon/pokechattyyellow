DiglettsCaveRoute2Script:
	ld a, ROUTE_2
	ld [wLastMap], a
	jp EnableAutoTextBoxDrawing

DiglettsCaveRoute2TextPointers:
	dw DiglettsCaveRoute2Text1

DiglettsCaveRoute2Text1:
	TX_MARKOV _DiglettsCaveRoute2Text1
	db "@"
