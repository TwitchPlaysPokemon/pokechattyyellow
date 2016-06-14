OpenSRAM::
	push af
	ld a, $1
	ld [MBC1SRamBankingMode], a
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	pop af
	ld [MBC1SRamBank], a
	ret

CloseSRAM::
	push af
	ld a, $0
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	pop af
	ret
