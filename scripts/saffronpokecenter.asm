SaffronPokecenterScript:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

SaffronPokecenterTextPointers:
	dw SaffronHealNurseText
	dw SaffronPokecenterText2
	dw SaffronPokecenterText3
	dw SaffronTradeNurseText
	dw SaffronPokecenterText5

SaffronHealNurseText:
	TX_POKECENTER_NURSE

SaffronPokecenterText2:
	TX_MARKOV _SaffronPokecenterText2
	db "@"

SaffronPokecenterText3:
	TX_MARKOV _SaffronPokecenterText3
	db "@"

SaffronTradeNurseText:
	TX_CABLE_CLUB_RECEPTIONIST

SaffronPokecenterText5:
	TX_ASM
	callab PokecenterChanseyText
	jp TextScriptEnd

