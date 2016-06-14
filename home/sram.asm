OpenSRAM::
	push af
	ld a, $1
	ld [MBC5SRamBankingMode], a
	ld a, SRAM_ENABLE
	ld [MBC5SRamEnable], a
	pop af
	ld [MBC5SRamBank], a
	ret

CloseSRAM::
	push af
	ld a, $0
	ld [MBC5SRamBankingMode], a
	ld [MBC5SRamEnable], a
	pop af
	ret
