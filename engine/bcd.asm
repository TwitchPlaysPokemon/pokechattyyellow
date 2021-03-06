; divide hMoney by hDivideBCDDivisor
; return output in hDivideBCDQuotient (same as hDivideBCDDivisor)
; used only to halve player money upon losing a fight
DivideBCDPredef::
DivideBCDPredef2::
DivideBCDPredef3:: ; only used function
DivideBCDPredef4::
	call GetPredefRegisters

DivideBCD::
	xor a
	ld [hDivideBCDBuffer], a
	ld [hDivideBCDBuffer + 1], a
	ld [hDivideBCDBuffer + 2], a
	ld d, $1
.loop1
	ld a, [hDivideBCDDivisor]
	and $f0
	jr nz, .go
	inc d
	ld a, [hDivideBCDDivisor]
	swap a
	and $f0
	ld b, a
	ld a, [hDivideBCDDivisor + 1]
	swap a
	ld [hDivideBCDDivisor + 1], a
	and $f
	or b
	ld [hDivideBCDDivisor], a
	ld a, [hDivideBCDDivisor + 1]
	and $f0
	ld b, a
	ld a, [hDivideBCDDivisor + 2]
	swap a
	ld [hDivideBCDDivisor + 2], a
	and $f
	or b
	ld [hDivideBCDDivisor + 1], a
	ld a, [hDivideBCDDivisor + 2]
	and $f0
	ld [hDivideBCDDivisor + 2], a
	jr .loop1

.go
	push de
	push de
	call DivideBCD_f686
	pop de
	ld a, b
	swap a
	and $f0
	ld [hDivideBCDBuffer], a
	dec d
	jr z, .skip
	push de
	call DivideBCD_f65d
	call DivideBCD_f686
	pop de
	ld a, [hDivideBCDBuffer]
	or b
	ld [hDivideBCDBuffer], a
	dec d
	jr z, .skip
	push de
	call DivideBCD_f65d
	call DivideBCD_f686
	pop de
	ld a, b
	swap a
	and $f0
	ld [hDivideBCDBuffer + 1], a
	dec d
	jr z, .skip
	push de
	call DivideBCD_f65d
	call DivideBCD_f686
	pop de
	ld a, [hDivideBCDBuffer + 1]
	or b
	ld [hDivideBCDBuffer + 1], a
	dec d
	jr z, .skip
	push de
	call DivideBCD_f65d
	call DivideBCD_f686
	pop de
	ld a, b
	swap a
	and $f0
	ld [hDivideBCDBuffer + 2], a
	dec d
	jr z, .skip
	push de
	call DivideBCD_f65d
	call DivideBCD_f686
	pop de
	ld a, [hDivideBCDBuffer + 2]
	or b
	ld [hDivideBCDBuffer + 2], a
.skip
	ld a, [hDivideBCDBuffer]
	ld [hDivideBCDQuotient], a
	ld a, [hDivideBCDBuffer + 1]
	ld [hDivideBCDQuotient + 1], a
	ld a, [hDivideBCDBuffer + 2]
	ld [hDivideBCDQuotient + 2], a
	pop de
	ld a, $6
	sub d
	and a
	ret z
.loop2
	push af
	call DivideBCD_f65d
	pop af
	dec a
	jr nz, .loop2
	ret

DivideBCD_f65d:
	ld a, [hDivideBCDDivisor + 2]
	swap a
	and $f
	ld b, a
	ld a, [hDivideBCDDivisor + 1]
	swap a
	ld [hDivideBCDDivisor + 1], a
	and $f0
	or b
	ld [hDivideBCDDivisor + 2], a
	ld a, [hDivideBCDDivisor + 1]
	and $f
	ld b, a
	ld a, [hDivideBCDDivisor]
	swap a
	ld [hDivideBCDDivisor], a
	and $f0
	or b
	ld [hDivideBCDDivisor + 1], a
	ld a, [hDivideBCDDivisor]
	and $f
	ld [hDivideBCDDivisor], a
	ret

DivideBCD_f686:
	ld bc, $3
.asm_f689
	ld de, hMoney
	ld hl, hDivideBCDDivisor
	push bc
	call StringCmp
	pop bc
	ret c
	inc b
	ld de, hMoney + 2
	ld hl, hDivideBCDDivisor + 2
	push bc
	call SubBCD
	pop bc
	jr .asm_f689

AddBCDPredef::
	call GetPredefRegisters

AddBCD::
	and a
	ld b, c
.add
	ld a, [de]
	adc [hl]
	daa
	ld [de], a
	dec de
	dec hl
	dec c
	jr nz, .add
	jr nc, .done
	ld a, $99
	inc de
.fill
	ld [de], a
	inc de
	dec b
	jr nz, .fill
.done
	ret

SubBCDPredef::
	call GetPredefRegisters

SubBCD::
	and a
	ld b, c
.sub
	ld a, [de]
	sbc [hl]
	daa
	ld [de], a
	dec de
	dec hl
	dec c
	jr nz, .sub
	jr nc, .done
	inc de
.fill
	ld [de], a
	inc de
	dec b
	jr nz, .fill
	scf
.done
	ret

