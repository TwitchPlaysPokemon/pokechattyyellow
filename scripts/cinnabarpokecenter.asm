CinnabarPokecenterScript:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

CinnabarPokecenterTextPointers:
	dw CinnabarHealNurseText
	dw CinnabarPokecenterText2
	dw CinnabarPokecenterText3
	dw CinnabarTradeNurseText
	dw CinnabarPokecenterText5

CinnabarHealNurseText:
	TX_POKECENTER_NURSE

CinnabarPokecenterText2:
	TX_MARKOV _CinnabarPokecenterText2
	db "@"

CinnabarPokecenterText3:
	TX_MARKOV _CinnabarPokecenterText3
	db "@"

CinnabarTradeNurseText:
	TX_CABLE_CLUB_RECEPTIONIST

CinnabarPokecenterText5:
	TX_ASM
	callab PokecenterChanseyText
	jp TextScriptEnd

