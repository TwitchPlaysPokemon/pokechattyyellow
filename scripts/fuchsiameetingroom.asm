FuchsiaMeetingRoomScript:
	call EnableAutoTextBoxDrawing
	ret

FuchsiaMeetingRoomTextPointers:
	dw FuchsiaMeetingRoomText1
	dw FuchsiaMeetingRoomText2
	dw FuchsiaMeetingRoomText3

FuchsiaMeetingRoomText1:
	TX_MARKOV _FuchsiaMeetingRoomText1
	db "@"

FuchsiaMeetingRoomText2:
	TX_MARKOV _FuchsiaMeetingRoomText2
	db "@"

FuchsiaMeetingRoomText3:
	TX_MARKOV _FuchsiaMeetingRoomText3
	db "@"
