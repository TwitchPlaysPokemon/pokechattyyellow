PikaPicTilemapPointers:
pikatilemap_def: macro
\1_id: dw \1
	endm

	pikatilemap_def PikaAnimTilemap_0
	pikatilemap_def PikaAnimTilemap_1_0
	pikatilemap_def PikaAnimTilemap_fdc1e_0
	pikatilemap_def PikaAnimTilemap_3
	pikatilemap_def PikaAnimTilemap_4
	pikatilemap_def PikaAnimTilemap_5
	pikatilemap_def PikaAnimTilemap_6
	pikatilemap_def PikaAnimTilemap_1_1
	pikatilemap_def PikaAnimTilemap_2_0
	pikatilemap_def PikaAnimTilemap_CaughtPokemon_0_0
	pikatilemap_def PikaAnimTilemap_FishingRod_1_1
	pikatilemap_def PikaAnimTilemap_FishingRod_1_2
	pikatilemap_def PikaAnimTilemap_FishingRod_1_3
	pikatilemap_def PikaAnimTilemap_13
	pikatilemap_def PikaAnimTilemap_Mood2Happy3_1_0
	pikatilemap_def PikaAnimTilemap_Mood3Happy5_1_0
	pikatilemap_def PikaAnimTilemap_Mood1Happy3_1_0
	pikatilemap_def PikaAnimTilemap_Mood2Happy4_1_0
	pikatilemap_def PikaAnimTilemap_Mood2Happy2_1_0
	pikatilemap_def PikaAnimTilemap_Mood2Happy1_1_0
	pikatilemap_def PikaAnimTilemap_Mood2Happy5_1_0
	pikatilemap_def PikaAnimTilemap_Mood3Happy3_1_0
	pikatilemap_def PikaAnimTilemap_Mood1Happy2_1_0
	pikatilemap_def PikaAnimTilemap_15_0
	pikatilemap_def PikaAnimTilemap_Mood3Happy6_1_1
	pikatilemap_def PikaAnimTilemap_FastAsleep_1_0
	pikatilemap_def PikaAnimTilemap_Mood3Happy2_1_0
	pikatilemap_def PikaAnimTilemap_Mood3Happy1_1_0
	pikatilemap_def PikaAnimTilemap_Mood1Happy1_1_0
	pikatilemap_def PikaAnimTilemap_Mood3Happy4_1_0
	pikatilemap_def PikaAnimTilemap_Mood2Happy6_1_0
	pikatilemap_def PikaAnimTilemap_Mood1Happy5_1_0
	pikatilemap_def PikaAnimTilemap_CaughtPokemon_1_0
	pikatilemap_def PikaAnimTilemap_Mood2Happy7_1_0
	pikatilemap_def PikaAnimTilemap_Mood3Happy7_1_0
	pikatilemap_def PikaAnimTilemap_35
	pikatilemap_def PikaAnimTilemap_LavenderTown_1_0
	pikatilemap_def PikaAnimTilemap_BillFirstTime_1_0
	pikatilemap_def PikaAnimTilemap_Burned_1_0
	pikatilemap_def PikaAnimTilemap_39
	pikatilemap_def PikaAnimTilemap_40
	pikatilemap_def PikaAnimTilemap_41
	pikatilemap_def PikaAnimTilemap_42

PikaAnimTilemap_0:
	db $ff ; unused


	; $ff inhibits overwriting that tile
PikaAnimTilemap_1_0:
PikaAnimTilemap_42:
	db 5, 5
	db $00, $05, $0a, $0f, $14
	db $01, $06, $0b, $10, $15
	db $02, $07, $0c, $11, $16
	db $03, $08, $0d, $12, $17
	db $04, $09, $0e, $13, $18

PikaAnimTilemap_fdc1e_0: ; unused
	db 5, 5
	db $19, $1e, $23, $28, $2d
	db $1a, $1f, $24, $29, $2e
	db $1b, $20, $25, $2a, $2f
	db $1c, $21, $26, $2b, $30
	db $1d, $22, $27, $2c, $31

PikaAnimTilemap_1_1:
	db 5, 5
	db $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff
	db $ff, $20, $25, $ff, $ff
	db $ff, $21, $26, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff

PikaAnimTilemap_3:
	db 1, 1
	db $00

PikaAnimTilemap_4:
	db 2, 1
	db $00
	db $01

PikaAnimTilemap_5:
	db 1, 2
	db $00, $01

PikaAnimTilemap_6:
PikaAnimTilemap_2_0:
	db 2, 2
	db $00, $01
	db $02, $03

PikaAnimTilemap_fde71: ; unused
	db 3, 2
	db $00, $01
	db $02, $03
	db $04, $05

PikaAnimTilemap_fde79: ; unused
	db 2, 3
	db $00, $01, $02
	db $03, $04, $05

PikaAnimTilemap_Mood2Happy3_1_0:
	db 5, 5
	db $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff
	db $00, $01, $02, $03, $04
	db $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff

PikaAnimTilemap_Mood3Happy5_1_0:
	db 5, 5
	db $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff
	db $00, $01, $02, $03, $04
	db $05, $06, $07, $08, $09

PikaAnimTilemap_Mood1Happy3_1_0:
	db 5, 5
	db $00, $01, $ff, $ff, $ff
	db $02, $03, $ff, $ff, $ff
	db $04, $05, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff

PikaAnimTilemap_Mood2Happy4_1_0:
	db 5, 5
	db $ff, $ff, $ff, $ff, $ff
	db $00, $01, $02, $03, $04
	db $05, $06, $07, $08, $09
	db $0a, $0b, $0c, $0d, $0e
	db $0f, $10, $11, $12, $13

PikaAnimTilemap_Mood2Happy2_1_0:
	db 5, 5
	db $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $00, $01
	db $ff, $ff, $ff, $02, $03
	db $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff

PikaAnimTilemap_Mood2Happy1_1_0:
	db 5, 5
	db $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff
	db $00, $01, $ff, $ff, $ff
	db $02, $03, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff

PikaAnimTilemap_Mood2Happy5_1_0:
	db 5, 5
	db $00, $01, $02, $03, $04
	db $05, $06, $07, $08, $09
	db $0a, $0b, $0c, $0d, $0e
	db $0f, $10, $11, $12, $13
	db $14, $15, $16, $17, $18

PikaAnimTilemap_Mood3Happy3_1_0:
	db 5, 5
	db $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff
	db $00, $01, $02, $03, $04
	db $05, $06, $07, $08, $09
	db $ff, $ff, $ff, $ff, $ff

PikaAnimTilemap_Mood1Happy2_1_0:
	db 5, 5
	db $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff
	db $00, $01, $ff, $ff, $ff
	db $02, $03, $ff, $ff, $ff
	db $04, $05, $ff, $ff, $ff

PikaAnimTilemap_15_0:
	db 5, 5
	db $00, $01, $02, $03, $04
	db $05, $06, $07, $08, $09
	db $0a, $0b, $0c, $0d, $0e
	db $0f, $10, $11, $12, $13
	db $14, $15, $16, $17, $18

PikaAnimTilemap_Mood3Happy6_1_1:
	db 5, 5
	db $19, $1a, $1b, $1c, $1d
	db $1e, $1f, $20, $21, $22
	db $23, $24, $25, $26, $27
	db $28, $29, $2a, $2b, $2c
	db $2d, $2e, $2f, $30, $31

PikaAnimTilemap_CaughtPokemon_0_0:
PikaAnimTilemap_FastAsleep_1_0:
PikaAnimTilemap_Mood3Happy2_1_0:
PikaAnimTilemap_Mood3Happy1_1_0:
PikaAnimTilemap_Mood1Happy1_1_0:
PikaAnimTilemap_Mood3Happy4_1_0:
PikaAnimTilemap_Mood2Happy6_1_0:
PikaAnimTilemap_Mood1Happy5_1_0:
PikaAnimTilemap_CaughtPokemon_1_0:
PikaAnimTilemap_Mood2Happy7_1_0:
PikaAnimTilemap_Mood3Happy7_1_0:
PikaAnimTilemap_35:
PikaAnimTilemap_LavenderTown_1_0:
PikaAnimTilemap_BillFirstTime_1_0:
PikaAnimTilemap_Burned_1_0:
PikaAnimTilemap_39:
	db 5, 5
	db $00, $01, $02, $03, $04
	db $05, $06, $07, $08, $09
	db $0a, $0b, $0c, $0d, $0e
	db $0f, $10, $11, $12, $13
	db $14, $15, $16, $17, $18

PikaAnimTilemap_FishingRod_1_1:
PikaAnimTilemap_40:
	db 5, 5
	db $19, $1a, $1b, $1c, $1d
	db $1e, $1f, $20, $21, $22
	db $23, $24, $25, $26, $27
	db $28, $29, $2a, $2b, $2c
	db $2d, $2e, $2f, $30, $31

PikaAnimTilemap_FishingRod_1_2:
PikaAnimTilemap_41:
	db 5, 5
	db $32, $33, $34, $35, $36
	db $37, $38, $39, $3a, $3b
	db $3c, $3d, $3e, $3f, $40
	db $41, $42, $43, $44, $45
	db $46, $47, $48, $49, $4a

PikaAnimTilemap_FishingRod_1_3:
	db 5, 5
	db $4b, $4c, $4d, $4e, $4f
	db $50, $51, $52, $53, $54
	db $55, $56, $57, $58, $59
	db $5a, $5b, $5c, $5d, $5e
	db $5f, $60, $61, $62, $63

PikaAnimTilemap_13:
	db 5, 5
	db $64, $65, $66, $67, $68
	db $69, $6a, $6b, $6c, $6d
	db $6e, $6f, $70, $71, $72
	db $73, $74, $75, $76, $77
	db $78, $79, $7a, $7b, $7c
