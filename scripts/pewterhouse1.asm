PewterHouse1Script:
	call EnableAutoTextBoxDrawing
	ret

PewterHouse1TextPointers:
	dw PewterHouse1Text1
	dw PewterHouse1Text2
	dw PewterHouse1Text3

PewterHouse1Text1:
	TX_MARKOV _PewterHouse1Text1
	TX_ASM
	ld a, NIDORAN_M
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

PewterHouse1Text2:
	TX_MARKOV _PewterHouse1Text2
	db "@"

PewterHouse1Text3:
	TX_MARKOV _PewterHouse1Text3
	db "@"
