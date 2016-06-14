TextBoxBorder::
; Draw a cxb text box at hl.

	; top row
	push hl
	ld a, "┌"
	ld [hli], a
	inc a ; ─
	call NPlaceChar
	inc a ; ┐
	ld [hl], a
	pop hl

	ld de, 20
	add hl, de

	; middle rows
.next
	push hl
	ld a, "│"
	ld [hli], a
	ld a, " "
	call NPlaceChar
	ld [hl], "│"
	pop hl

	ld de, 20
	add hl, de
	dec b
	jr nz, .next

	; bottom row
	ld a, "└"
	ld [hli], a
	ld a, "─"
	call NPlaceChar
	ld [hl], "┘"
	ret

NPlaceChar::
; Place char a c times.
	ld d, c
.loop
	ld [hli], a
	dec d
	jr nz, .loop
	ret

PlaceString::
	push hl
PlaceNextChar::
	ld a, [de]

	cp "@"
	jr nz, Char4ETest
	ld b, h
	ld c, l
	pop hl
	ret

Char4ETest::
	cp $4E ; next
	jr nz, .char4FTest
	ld bc, 2 * SCREEN_WIDTH
	ld a, [hFlags_0xFFFA]
	bit 2, a
	jr z, .ok
	ld bc, SCREEN_WIDTH
.ok
	pop hl
	add hl, bc
	push hl
	jp PlaceNextChar_inc

.char4FTest
	cp $4F ; line
	jr nz, .next3
	pop hl
	coord hl, 1, 16
	push hl
	jp PlaceNextChar_inc

.next3 ; Check against a dictionary
dict: macro
if \1 == 0
	and a
else
	cp \1
endc
	jp z, \2
endm

	dict $00, Char00 ; error
	dict $4C, Char4C ; autocont
	dict $4B, Char4B ; cont_
	dict $51, Char51 ; para
	dict $49, Char49 ; page
	dict $52, Char52 ; player
	dict $53, Char53 ; rival
	dict $54, Char54 ; POKé
	dict $5B, Char5B ; PC
	dict $5E, Char5E ; ROCKET
	dict $5C, Char5C ; TM
	dict $5D, Char5D ; TRAINER
	dict $55, Char55 ; cont
	dict $56, Char56 ; 6 dots
	dict $57, Char57 ; done
	dict $58, Char58 ; prompt
	dict $4A, Char4A ; PKMN
	dict $5F, Char5F ; dex
	dict $59, Char59 ; TARGET
	dict $5A, Char5A ; USER

	ld [hli], a
	call PrintLetterDelay
PlaceNextChar_inc::
	inc de
	jp PlaceNextChar

Char00::
	ld b, h
	ld c, l
	pop hl
	ld de, Char00Text
	dec de
	ret

Char00Text:: ; “%d ERROR.”
	TX_FAR _Char00Text
	db "@"

print_name: macro
	push de
	ld de, \1
	jr FinishDTE
endm

Char52:: print_name wPlayerName ; player’s name
Char53:: print_name wRivalName ; rival’s name
Char5D:: print_name Char5DText ; TRAINER
Char5C:: print_name Char5CText ; TM
Char5B:: print_name Char5BText ; PC
Char5E:: print_name Char5EText ; ROCKET
Char54:: print_name Char54Text ; POKé
Char56:: print_name Char56Text ; ……
Char4A:: print_name Char4AText ; PKMN

Char59::
; depending on whose turn it is, print
; enemy active monster’s name, prefixed with “Enemy ”
; or
; player active monster’s name
; (like Char5A but flipped)
	ld a, [hBattleTurn]
	xor 1
	jr MonsterNameCharsCommon

Char5A::
; depending on whose turn it is, print
; player active monster’s name
; or
; enemy active monster’s name, prefixed with “Enemy ”
	ld a, [hBattleTurn]
MonsterNameCharsCommon::
	push de
	and a
	jr nz, .Enemy
	ld de, wBattleMonNick ; player active monster name
	jr FinishDTE

.Enemy
	; print “Enemy ”
	ld de, Char5AText
	call PlaceString
	ld h, b
	ld l, c
	ld de, wEnemyMonNick ; enemy active monster name

FinishDTE::
	call PlaceString
	ld h, b
	ld l, c
	pop de
	inc de
	jp PlaceNextChar

Char5CText:: db "TM@"
Char5DText:: db "TRAINER@"
Char5BText:: db "PC@"
Char5EText:: db "ROCKET@"
Char54Text:: db "POKé@"
Char56Text:: db "……@"
Char5AText:: db "Enemy @"
Char4AText:: db $E1, $E2, "@" ; PKMN

Char55::
	push de
	ld b, h
	ld c, l
	ld hl, Char55Text
	call TextCommandProcessor
	ld h, b
	ld l, c
	pop de
	inc de
	jp PlaceNextChar

Char55Text::
; equivalent to Char4B
	TX_FAR _Char55Text
	db "@"

Char5F::
; ends a Pokédex entry
	ld [hl], "."
	pop hl
	ret

Char58:: ; prompt
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jp z, .ok
	ld a, $EE
	Coorda 18, 16
.ok
	call ProtectedDelay3
	call ManualTextScroll
	ld a, " "
	Coorda 18, 16
Char57:: ; done
	pop hl
	ld de, Char58Text
	dec de
	ret

Char58Text::
	db "@"

Char51:: ; para
	push de
	ld a, $EE
	Coorda 18, 16
	call ProtectedDelay3
	call ManualTextScroll
	coord hl, 1, 13
	lb bc, 4, 18
	call ClearScreenArea
	ld c, 20
	call DelayFrames
	pop de
	coord hl, 1, 14
	jp PlaceNextChar_inc

Char49::
	ld a, [hFlags_0xFFFA]
	bit 3, a
	jr z, .Char49
	ld a, $4e
	jp Char4ETest

.Char49
	push de
	ld a, $EE
	Coorda 18, 16
	call ProtectedDelay3
	call ManualTextScroll
	coord hl, 1, 10
	lb bc, 7, 18
	call ClearScreenArea
	ld c, 20
	call DelayFrames
	pop de
	pop hl
	coord hl, 1, 11
	push hl
	jp PlaceNextChar_inc

Char4B::
	ld a, $EE
	Coorda 18, 16
	call ProtectedDelay3
	push de
	call ManualTextScroll
	pop de
	ld a, " "
	Coorda 18, 16
	;fall through
Char4C::
	push de
	call ScrollTextUpOneLine
	call ScrollTextUpOneLine
	coord hl, 1, 16
	pop de
	jp PlaceNextChar_inc

ScrollTextUpOneLine::
	coord hl, 0, 14
	coord de, 0, 13
	ld b, 60
.next
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .next
	coord hl, 1, 16
	ld a, " "
	ld b, SCREEN_WIDTH - 2
.next2
	ld [hli], a
	dec b
	jr nz, .next2

	; wait five frames
	ld b, 5
.WaitFrame
	call DelayFrame
	dec b
	jr nz, .WaitFrame

	ret

ProtectedDelay3::
	push bc
	call Delay3
	pop bc
	ret

TextCommandProcessor::
	ld a, [wLetterPrintingDelayFlags]
	push af
	set 1, a
	ld e, a
	ld a, [$fff9]
	xor e
	ld [wLetterPrintingDelayFlags], a
	ld a, c
	ld [wTextDestinationTileAddrBuffer], a
	ld a, b
	ld [wTextDestinationTileAddrBuffer + 1], a

NextTextCommand::
	ld a, [hli]
	cp "@" ; terminator
	jr nz, .doTextCommand
	pop af
	ld [wLetterPrintingDelayFlags], a
	ret

.doTextCommand
	push hl
	ld hl, TextCommandJumpTable
	push bc
	add a
	ld b, 0
	ld c, a
	add hl, bc
	pop bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

; draw box
; 04AAAABBCC
; AAAA = address of upper left corner
; BB = height
; CC = width
TextCommand04::
	pop hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	push hl
	ld h, d
	ld l, e
	call TextBoxBorder
	pop hl
	jr NextTextCommand

; place string inline
; 00{string}
TextCommand00::
	pop hl
	ld d, h
	ld e, l
	ld h, b
	ld l, c
	call PlaceString
	ld h, d
	ld l, e
	inc hl
	jr NextTextCommand

; place string from RAM
; 01AAAA
; AAAA = address of string
TextCommand01::
	pop hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld h, b
	ld l, c
	call PlaceString
	pop hl
	jr NextTextCommand

; print BCD number
; 02AAAABB
; AAAA = address of BCD number
; BB
; bits 0-4 = length in bytes
; bits 5-7 = unknown flags
TextCommand02::
	pop hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	push hl
	ld h, b
	ld l, c
	ld c, a
	call PrintBCDNumber
	ld b, h
	ld c, l
	pop hl
	jr NextTextCommand

; repoint destination address
; 03AAAA
; AAAA = new destination address
TextCommand03::
	pop hl
	ld a, [hli]
	ld [wTextDestinationTileAddrBuffer], a
	ld c, a
	ld a, [hli]
	ld [wTextDestinationTileAddrBuffer + 1], a
	ld b, a
	jp NextTextCommand

; repoint destination to second line of dialogue text box
; 05
; (no arguments)
TextCommand05::
	pop hl
	coord bc, 1, 16 ; address of second line of dialogue text box
	jp NextTextCommand

; blink arrow and wait for A or B to be pressed
; 06
; (no arguments)
TextCommand06::
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jp z, TextCommand0D
	ld a, $ee ; down arrow
	Coorda 18, 16 ; place down arrow in lower right corner of dialogue text box
	push bc
	call ManualTextScroll ; blink arrow and wait for A or B to be pressed
	pop bc
	ld a, " "
	Coorda 18, 16 ; overwrite down arrow with blank space
	pop hl
	jp NextTextCommand

; scroll text up one line
; 07
; (no arguments)
TextCommand07::
	ld a, " "
	Coorda 18, 16 ; place blank space in lower right corner of dialogue text box
	call ScrollTextUpOneLine
	call ScrollTextUpOneLine
	pop hl
	coord bc, 1, 16 ; address of second line of dialogue text box
	jp NextTextCommand

; execute asm inline
; 08{code}
TextCommand08::
	pop hl
	ld de, NextTextCommand
	push de ; return address
	jp [hl]

; print decimal number (converted from binary number)
; 09AAAABB
; AAAA = address of number
; BB
; bits 0-3 = how many digits to display
; bits 4-7 = how long the number is in bytes
TextCommand09::
	pop hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	push hl
	ld h, b
	ld l, c
	ld b, a
	and $0f
	ld c, a
	ld a, b
	and $f0
	swap a
	set BIT_LEFT_ALIGN, a
	ld b, a
	call PrintNumber
	ld b, h
	ld c, l
	pop hl
	jp NextTextCommand

; wait half a second if the user doesn't hold A or B
; 0A
; (no arguments)
TextCommand0A::
	push bc
	call Joypad
	ld a, [hJoyHeld]
	and A_BUTTON | B_BUTTON
	jr nz, .skipDelay
	ld c, 30
	call DelayFrames
.skipDelay
	pop bc
	pop hl
	jp NextTextCommand

; plays sounds
; this actually handles various command ID's, not just 0B
; (no arguments)
TextCommand0B::
	pop hl
	push bc
	dec hl
	ld a, [hli]
	ld b, a ; b = command number that got us here
	push hl
	ld hl, TextCommandSounds
.loop
	ld a, [hli]
	cp b
	jr z, .matchFound
	inc hl
	jr .loop
.matchFound
	cp $14
	jr z, .pokemonCry
	cp $15
	jr z, .pokemonCry
	cp $16
	jr z, .pokemonCry
	ld a, [hl]
	call PlaySound
	call WaitForSoundToFinish
	pop hl
	pop bc
	jp NextTextCommand
.pokemonCry
	push de
	ld a, [hl]
	call PlayCry
	pop de
	pop hl
	pop bc
	jp NextTextCommand

; format: text command ID, sound ID or cry ID
TextCommandSounds::
	TX_SFX_ITEM,           SFX_GET_ITEM_1
	TX_SFX_TURN_OFF_PC,    SFX_TURN_OFF_PC
	TX_SFX_POKEDEX_RATING, SFX_POKEDEX_RATING
	TX_SFX_ITEM2,          SFX_GET_ITEM_1
	TX_SFX_CONGRATS,       SFX_GET_ITEM_2
	TX_SFX_KEY_ITEM,       SFX_GET_KEY_ITEM
	TX_SFX_TRADE_MACHINE,  SFX_TRADE_MACHINE
	TX_CRY_PIKACHU,        PIKACHU ; used in OakSpeech
	TX_CRY_PIDGEOT,        PIDGEOT  ; used in SaffronCityText12
	TX_CRY_DEWGONG,        DEWGONG  ; unused?

; draw ellipses
; 0CAA
; AA = number of ellipses to draw
TextCommand0C::
	pop hl
	ld a, [hli]
	ld d, a
	push hl
	ld h, b
	ld l, c
.loop
	ld a, $75 ; ellipsis
	ld [hli], a
	push de
	call Joypad
	pop de
	ld a, [hJoyHeld] ; joypad state
	and A_BUTTON | B_BUTTON
	jr nz, .skipDelay ; if so, skip the delay
	ld c, 10
	call DelayFrames
.skipDelay
	dec d
	jr nz, .loop
	ld b, h
	ld c, l
	pop hl
	jp NextTextCommand

; wait for A or B to be pressed
; 0D
; (no arguments)
TextCommand0D::
	push bc
	call ManualTextScroll ; wait for A or B to be pressed
	pop bc
	pop hl
	jp NextTextCommand

; process text commands in another ROM bank
; 17AAAABB
; AAAA = address of text commands
; BB = bank
TextCommand17::
	pop hl
	ld a, [hROMBank]
	push af
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	call Bankswitch
	push hl
	ld l, e
	ld h, d
	call TextCommandProcessor
	pop hl
	pop af
	ld [hROMBank], a
	ld [MBC5RomBank], a
	jp NextTextCommand

TextCommand18::
TextCommand19::
	pop hl
; bc is the tilemap dest
; hl, on the stack, is the text source
	ld a, [hROMBank]
	push af
	dec hl
	ld a, [hli]
	sub $18 ; LUA_REQUEST_NPC or LUA_REQUEST_CHATOT
	ld [hLSB], a
	jr z, .chatot
	ld a, [hli]
	ld [hMarkovChain], a
	ld a, [hli]
	ld [hMarkovChain + 1], a
	ld a, [hli]
	call Bankswitch
	jr .okay

.chatot
	xor a
	ld [hMarkovChain], a
	ld [hMarkovChain + 1], a
.okay
	pop af
	call Bankswitch
	push hl
	ld a, LUA_REQUEST_CHAIN
	ld [hLSC], a
.loop
	halt
	nop
	ld a, [hLSC]
	and a ; cp LUA_REQUEST_COMPLETE
	jr nz, .loop
.char_loop
	ld a, LUA_REQUEST_NEXT_CHAR
	ld [hLSC], a
.loop2
	halt
	nop
	ld a, [hLSC]
	and a ; cp LUA_REQUEST_COMPLETE
	jr nz, .loop2
	ld a, [hLSB]
	cp $57 ; done
	jr z, .done
	ld [hMarkovChain], a
	ld a, "@"
	ld [hMarkovChain + 1], a
	ld h, b
	ld l, c
	ld de, hMarkovChain
	call PlaceString
	jr .char_loop

.done
	pop hl
	jp NextTextCommand

TextCommandJumpTable::
	dw TextCommand00
	dw TextCommand01
	dw TextCommand02
	dw TextCommand03
	dw TextCommand04
	dw TextCommand05
	dw TextCommand06
	dw TextCommand07
	dw TextCommand08
	dw TextCommand09
	dw TextCommand0A
	dw TextCommand0B
	dw TextCommand0C
	dw TextCommand0D
	dw TextCommand0B
	dw TextCommand0B
	dw TextCommand0B
	dw TextCommand0B
	dw TextCommand0B
	dw TextCommand0B
	dw TextCommand0B
	dw TextCommand0B
	dw TextCommand0B
	dw TextCommand17
	dw TextCommand18
	dw TextCommand19
