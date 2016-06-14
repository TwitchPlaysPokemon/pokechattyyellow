_Multiply:
	ld a, $8
	ld b, a
	xor a
	ld [hProduct], a          ; $ff95
	ld [hMathBuffer + 1], a   ; $ff9b
	ld [hMathBuffer + 1+1], a ; $ff9c
	ld [hMathBuffer + 1+2], a ; $ff9d
	ld [hMathBuffer + 1+3], a ; $ff9e
.multiplyLoop
	ld a, [hMultiplier] ; $ff99
	srl a
	ld [hMultiplier], a ; $ff99
	jr nc, .smallMultiplier ; less than $80
; code to possibly multiply the multiplicand by 2 and divide the multiplier by 2?
	ld a, [hMathBuffer + 1+3]
	ld c, a
	ld a, [hMultiplicand+2]
	add c
	ld [hMathBuffer + 1+3], a
	ld a, [hMathBuffer + 1+2]
	ld c, a
	ld a, [hMultiplicand+1]
	adc c
	ld [hMathBuffer + 1+2], a
	ld a, [hMathBuffer + 1+1] ; $ff9c
	ld c, a
	ld a, [hMultiplicand] ; $ff96
	adc c
	ld [hMathBuffer + 1+1], a ; $ff9c
	ld a, [hMathBuffer + 1]
	ld c, a
	ld a, [hProduct] ; $ff95
	adc c
	ld [hMathBuffer + 1], a
.smallMultiplier
	dec b
	jr z, .done
	ld a, [hMultiplicand+2]
	sla a
	ld [hMultiplicand+2], a
	ld a, [hMultiplicand+1]
	rl a
	ld [hMultiplicand+1], a
	ld a, [hMultiplicand] ; $ff96
	rl a
	ld [hMultiplicand], a ; $ff96
	ld a, [hProduct] ; $ff95
	rl a
	ld [hProduct], a ; $ff95
	jr .multiplyLoop
.done
	ld a, [hMathBuffer + 1+3]
	ld [hProduct+3], a
	ld a, [hMathBuffer + 1+2]
	ld [hProduct+2], a
	ld a, [hMathBuffer + 1+1] ; $ff9c
	ld [hProduct+1], a ; $ff96
	ld a, [hMathBuffer + 1]
	ld [hProduct], a ; $ff95
	ret

_Divide:
	xor a
	ld [hMathBuffer], a   ; ff9a
	ld [hMathBuffer+1], a ; ff9b
	ld [hMathBuffer+2], a ; ff9c
	ld [hMathBuffer+3], a ; ff9d
	ld [hMathBuffer+4], a ; ff9e
	ld a, $9
	ld e, a
.asm_f6680
	ld a, [hMathBuffer]
	ld c, a
	ld a, [hDividend+1] ; $ff96
	sub c
	ld d, a
	ld a, [hDivisor] ; $ff99
	ld c, a
	ld a, [hDividend] ; $ff95
	sbc c
	jr c, .asm_f669b
	ld [hDividend], a ; $ff95
	ld a, d
	ld [hDividend+1], a ; $ff96
	ld a, [hMathBuffer+4]
	inc a
	ld [hMathBuffer+4], a
	jr .asm_f6680
.asm_f669b
	ld a, b
	cp $1
	jr z, .done
	ld a, [hMathBuffer+4]
	sla a
	ld [hMathBuffer+4], a
	ld a, [hMathBuffer+3]
	rl a
	ld [hMathBuffer+3], a
	ld a, [hMathBuffer+2] ; $ff9c
	rl a
	ld [hMathBuffer+2], a ; $ff9c
	ld a, [hMathBuffer+1]
	rl a
	ld [hMathBuffer+1], a
	dec e
	jr nz, .asm_f66d1
	ld a, $8
	ld e, a
	ld a, [hMathBuffer]
	ld [hDivisor], a ; $ff99
	xor a
	ld [hMathBuffer], a
	ld a, [hDividend+1] ; $ff96
	ld [hDividend], a ; $ff95
	ld a, [hDividend+2]
	ld [hDividend+1], a ; $ff96
	ld a, [hDividend+3]
	ld [hDividend+2], a
.asm_f66d1
	ld a, e
	cp $1
	jr nz, .asm_f66d7
	dec b
.asm_f66d7
	ld a, [hDivisor] ; $ff99
	srl a
	ld [hDivisor], a ; $ff99
	ld a, [hMathBuffer]
	rr a
	ld [hMathBuffer], a
	jr .asm_f6680
.done
	ld a, [hDividend+1] ; $ff96
	ld [hRemainder], a ; $ff99
	ld a, [hMathBuffer+4]
	ld [hQuotient+3], a
	ld a, [hMathBuffer+3]
	ld [hQuotient+2], a
	ld a, [hMathBuffer+2] ; $ff9c
	ld [hQuotient+1], a ; $ff96
	ld a, [hMathBuffer+1]
	ld [hQuotient], a ; $ff95
	ret
