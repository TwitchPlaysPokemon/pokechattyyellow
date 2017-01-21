FarCopyDataDouble::
; Expand bc bytes of 1bpp image data
; from a:de to 2bpp data at hl.
	ld [wFarCopyDataSavedROMBank], a
	ld a, [hROMBank]
	push af
	ld a, [wFarCopyDataSavedROMBank]
	call Bankswitch
	ld a, h ; swap hl and de
	ld h, d
	ld d, a
	ld a, l
	ld l, e
	ld e, a
	ld a, b
	and a
	jr z, .eightbitcopyamount
	ld a, c
	and a ; multiple of $100
	jr z, .expandloop ; if so, do not increment b because the first instance of dec c results in underflow
.eightbitcopyamount
	inc b
.expandloop
	ld a, [de]
	inc de
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .expandloop
	dec b
	jr nz, .expandloop
	pop af
	call Bankswitch
	ret

CopyVideoData::
; Wait for the next VBlank, then copy c 2bpp
; tiles from b:de to hl, 8 tiles at a time.
; This takes c/8 frames.

	ld a, [hBGMapMode]
	push af
	xor a ; disable auto-transfer while copying
	ld [hBGMapMode], a

	ld a, [hROMBank]
	push af

	ld a, b
	call Bankswitch

	ld a, e
	ld [h2bppSrc], a
	ld a, d
	ld [h2bppSrc + 1], a

	ld a, l
	ld [h2bppDest], a
	ld a, h
	ld [h2bppDest + 1], a

.loop
	ld a, c
	cp 8
	jr nc, .keepgoing

.done
	ld [h2bppSize], a
	call DelayFrame
	pop af
	call Bankswitch
	pop af
	ld [hBGMapMode], a
	ret

.keepgoing
	ld a, 8
	ld [h2bppSize], a
	call DelayFrame
	ld a, c
	sub 8
	ld c, a
	jr .loop

CopyVideoDataDouble::
; Wait for the next VBlank, then copy c 1bpp
; tiles from b:de to hl, 8 tiles at a time.
; This takes c/8 frames.
	ld a, [hBGMapMode]
	push af
	xor a ; disable auto-transfer while copying
	ld [hBGMapMode], a
	ld a, [hROMBank]
	push af

	ld a, b
	call Bankswitch

	ld a, e
	ld [h1bppSrc], a
	ld a, d
	ld [h1bppSrc + 1], a

	ld a, l
	ld [h1bppDest], a
	ld a, h
	ld [h1bppDest + 1], a

.loop
	ld a, c
	cp 8
	jr nc, .keepgoing

.done
	ld [h1bppSize], a
	call DelayFrame
	pop af
	call Bankswitch
	pop af
	ld [hBGMapMode], a
	ret

.keepgoing
	ld a, 8
	ld [h1bppSize], a
	call DelayFrame
	ld a, c
	sub 8
	ld c, a
	jr .loop

FillMemory::
	push af
	ld a, b
	and a
	jr z, .eightbitcopyamount
	ld a, c
	and a
	jr z, .mulitpleof0x100
.eightbitcopyamount
	inc b
.mulitpleof0x100
	pop af
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop
	ret

GetFarByte::
; get a byte from a:hl
; and return it in a
	push bc
	ld b, a
	ld a, [hROMBank]
	push af
	ld a, b
	call Bankswitch
	ld b, [hl]
	pop af
	call Bankswitch
	ld a, b
	pop bc
	ret

ClearScreenArea::
; Clear tilemap area cxb at hl.
	ld a, " " ; blank tile
	ld de, 20 ; screen width
.y
	push hl
	push bc
.x
	ld [hli], a
	dec c
	jr nz, .x
	pop bc
	pop hl
	add hl, de
	dec b
	jr nz, .y
	ret

CopyScreenTileBufferToVRAM::
; Copy wTileMap to the BG Map starting at b * $100.
; This is done in thirds of 6 rows, so it takes 3 frames.

	ld c, 6

	ld hl, $600 * 0
	coord de, 0, 6 * 0
	call .setup
	call DelayFrame

	ld hl, $600 * 1
	coord de, 0, 6 * 1
	call .setup
	call DelayFrame

	ld hl, $600 * 2
	coord de, 0, 6 * 2
	call .setup
	jp DelayFrame

.setup
	ld a, d
	ld [hBGMapCopySrc+1], a
	call GetRowColAddressBgMap
	ld a, l
	ld [hBGMapCopyDest], a
	ld a, h
	ld [hBGMapCopyDest+1], a
	ld a, c
	ld [hBGMapCopySize], a
	ld a, e
	ld [hBGMapCopySrc], a
	ret

ClearScreen::
; Clear wTileMap, then wait
; for the bg map to update.
	ld bc, 20 * 18
	inc b
	coord hl, 0, 0
	ld a, " "
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop
	jp Delay3
