_Multiply:: ; 66de
; hMultiplier is one byte.
	push de
	push hl
	ld a, [hMultiplier]
	cp 1
	jr z, .skip
	and a
	jr nz, .skip2
	ld [hProduct], a
	ld [hProduct + 1], a
	ld [hProduct + 2], a
	ld [hProduct + 3], a
	jr .skip
.skip2
	ld c, a
	ld a, [hMultiplicand]
	ld e, a
	ld a, [hMultiplicand + 1]
	ld h, a
	ld a, [hMultiplicand + 2]
	ld l, a
	xor a
	ld d, a
	ld [hProduct], a
	ld [hProduct + 1], a
	ld [hProduct + 2], a
	ld [hProduct + 3], a
	ld b, 8

.loop
	srl c
	jr nc, .next

	ld a, [hProduct + 3]
	add l
	ld [hProduct + 3], a
	ld a, [hProduct + 2]
	adc h
	ld [hProduct + 2], a
	ld a, [hProduct + 1]
	adc e
	ld [hProduct + 1], a
	ld a, [hProduct]
	adc d
	ld [hProduct], a

.next
	sla l
	rl h
	rl e
	rl d
	dec b
	jr nz, .loop
.skip
	pop hl
	pop de
	ret
; 673e

_Divide:: ; 673e
	push hl
	ld a, [hDivisor]
	ld d, a
	ld c, hDividend % $100
	ld e, 0
	ld l, e
.loop
	push bc
	ld b, 8
	ld a, [$ff00+c]
	ld h, a
	ld l, 0
.loop2
	sla h
	rl e
	ld a, e
	jr c, .carry
	cp d
	jr c, .skip
.carry
	sub d
	ld e, a
	inc l
.skip
	ld a, b
	cp 1
	jr z, .done
	sla l
	dec b
	jr .loop2
.done
	ld a, c
	add hMathBuffer - hDividend
	ld c, a
	ld a, l
	ld [$ff00+c], a
	pop bc
	inc c
	dec b
	jr nz, .loop

	xor a
	ld [hDividend], a
	ld [hDividend + 1], a
	ld [hDividend + 2], a
	ld [hDividend + 3], a
	ld a, e
	ld [hDividend + 4], a ; I believe the remainder is stored here...
	ld [hDivisor], a ; and here too...
	ld a, c
	sub hDividend % $100
	ld b, a
	ld a, c
	add hMathBuffer - hDividend - 1
	ld c, a
	ld a, [$ff00+c]
	ld [hDividend + 3], a
	dec b
	jr z, .finished
	dec c
	ld a, [$ff00+c]
	ld [hDividend + 2], a
	dec b
	jr z, .finished
	dec c
	ld a, [$ff00+c]
	ld [hDividend + 1], a
	dec b
	jr z, .finished
	dec c
	ld a, [$ff00+c]
	ld [hDividend], a
.finished
	pop hl
	ret
; 67c1
