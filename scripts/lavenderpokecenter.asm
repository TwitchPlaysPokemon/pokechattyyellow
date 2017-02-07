LavenderPokecenterScript:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

LavenderPokecenterTextPointers:
	dw LavenderHealNurseText
	dw LavenderPokecenterText2
	dw LavenderPokecenterText3
	dw LavenderTradeNurseText
	dw LavenderPokecenterText5

LavenderTradeNurseText:
	TX_CABLE_CLUB_RECEPTIONIST

LavenderHealNurseText:
	TX_POKECENTER_NURSE

LavenderPokecenterText2:
	TX_MARKOV _LavenderPokecenterText2
	db "@"

LavenderPokecenterText3:
	TX_MARKOV _LavenderPokecenterText3
	db "@"

LavenderPokecenterText5:
	TX_ASM
	callab PokecenterChanseyText
	jp TextScriptEnd
