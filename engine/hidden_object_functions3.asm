; prints text for bookshelves in buildings without sign events
PrintBookshelfText:
	ld a, [wCurMapTileset]
	ld b, a
	ld a, [wPlayerFacingDirection] ; player's sprite facing direction
	cp SPRITE_FACING_UP
	jr nz, .checkOverworldTiles
; facing up
	ld hl, BookshelfTileIDs
	call FindBookshelfID
	jr c, .bookshelf
.checkOverworldTiles
	ld hl, OverworldTileIDs
	call FindBookshelfID
	jr nc, .noMatch
	ld a, [hl]
	push af
	call EnableAutoTextBoxDrawing
	pop af
	ld de, .Return
	push de
	and a
	jr nz, .surf
	jpba TryCutOW

.surf
	jpba TrySurfOW

.Return
	ld a, 0
	sbc 0
	ld [hIsCardKeyDoor], a
	ret

.bookshelf
	ld a, [hl]
	push af
	call EnableAutoTextBoxDrawing
	pop af
	call PrintPredefTextID
	xor a
	ld [hIsCardKeyDoor], a
	ret

.noMatch
	ld a, $ff
	ld [hIsCardKeyDoor], a
	jpba PrintCardKeyText

nextBookshelfEntry1
	inc hl
nextBookshelfEntry2
	inc hl
FindBookshelfID:
	ld a, [hli]
	cp $ff
	ret z
	cp b
	jr nz, nextBookshelfEntry1
	ld a, [hli]
	cp c
	jr nz, nextBookshelfEntry2
	scf
	ret

; format: db tileset id, bookshelf tile id, text id
BookshelfTileIDs:
bookshelf_tile: MACRO
	db \1, \2
	db_tx_pre \3
	ENDM

	bookshelf_tile PLATEAU,      $30,  IndigoPlateauStatues
	bookshelf_tile HOUSE,        $3D,  TownMapText
	bookshelf_tile HOUSE,        $1E,  BookOrSculptureText
	bookshelf_tile MANSION,      $32,  BookOrSculptureText
	bookshelf_tile REDS_HOUSE_1, $32,  BookOrSculptureText
	bookshelf_tile LAB,          $28,  BookOrSculptureText
	bookshelf_tile LOBBY,        $16,  ElevatorText
	bookshelf_tile GYM,          $1D,  BookOrSculptureText
	bookshelf_tile DOJO,         $1D,  BookOrSculptureText
	bookshelf_tile GATE,         $22,  BookOrSculptureText
	bookshelf_tile MART,         $54,  PokemonStuffText
	bookshelf_tile MART,         $55,  PokemonStuffText
	bookshelf_tile POKECENTER,   $54,  PokemonStuffText
	bookshelf_tile POKECENTER,   $55,  PokemonStuffText
	bookshelf_tile LOBBY,        $50,  PokemonStuffText
	bookshelf_tile LOBBY,        $52,  PokemonStuffText
	bookshelf_tile SHIP,         $36,  BookOrSculptureText
	db $FF

OverworldTileIDs:
	db OVERWORLD, $3d, 0
	db GYM,       $50, 0
	db $FF

IndigoPlateauStatues:
	TX_ASM
	ld hl, IndigoPlateauStatuesText1
	call PrintText
	ld a, [wXCoord]
	bit 0, a
	ld hl, IndigoPlateauStatuesText2
	jr nz, .ok
	ld hl, IndigoPlateauStatuesText3
.ok
	call PrintText
	jp TextScriptEnd

IndigoPlateauStatuesText1:
	TX_FAR _IndigoPlateauStatuesText1
	db "@"

IndigoPlateauStatuesText2:
	TX_FAR _IndigoPlateauStatuesText2
	db "@"

IndigoPlateauStatuesText3:
	TX_FAR _IndigoPlateauStatuesText3
	db "@"

BookOrSculptureText:
	TX_ASM
	ld hl, PokemonBooksText
	ld a, [wCurMapTileset]
	cp MANSION ; Celadon Mansion tileset
	jr nz, .ok
	aCoord 8, 6
	cp $38
	jr nz, .ok
	ld hl, DiglettSculptureText
.ok
	call PrintText
	jp TextScriptEnd

PokemonBooksText:
	TX_FAR _PokemonBooksText
	db "@"

DiglettSculptureText:
	TX_FAR _DiglettSculptureText
	db "@"

ElevatorText:
	TX_FAR _ElevatorText
	db "@"

TownMapText:
	TX_FAR _TownMapText
	TX_BUTTON_SOUND
	TX_ASM
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, wd730
	set 6, [hl]
	call GBPalWhiteOutWithDelay3
	xor a
	ld [hWY], a
	inc a
	ld [hBGMapMode], a
	call LoadFontTilePatterns
	callba DisplayTownMap
	ld hl, wd730
	res 6, [hl]
	ld de, TextScriptEnd
	push de
	ld a, [hROMBank]
	push af
	jp CloseTextDisplay

PokemonStuffText:
	TX_FAR _PokemonStuffText
	db "@"
