YellowIntro_AnimatedObjectFramesData:
	dw .Frame_00
	dw .Frame_01
	dw .Frame_02
	dw .Frame_03
	dw .Frame_04
	dw .Frame_05
	dw .Frame_06
	dw .Frame_07
	dw .Frame_08
	dw .Frame_09
	dw .Frame_0a

.Frame_00:
	frame $00, 32
	endanim

.Frame_01:
	frame $01, 4
	frame $02, 4
	frame $03, 4
	dorestart

.Frame_02:
	frame $04, 4
	frame $05, 4
	frame $06, 4
	dorestart

.Frame_03:
	frame $07, 4
	frame $08, 4
	frame $09, 4
	dorestart

.Frame_04:
	frame $0a, 32
	endanim

.Frame_05:
	frame $0b, 32
	endanim

.Frame_06:
	frame $0c, 32
	endanim

.Frame_07:
	frame $0d, 32
	endanim

.Frame_08:
	frame $0e, 32
	endanim

.Frame_09:
	frame $0f, 31
	frame $11, 2
	frame $0f, 2
	frame $11, 2
	frame $0f, 31
	frame $11, 2
	frame $0f, 23
	frame $10, 32
	endanim

.Frame_0a:
	frame $12, 4
	frame $13, 4
	dorestart

YellowIntro_AnimatedObjectOAMData:
	dbw $00, .OAM_00 ; 00
	dbw $96, .OAM_01 ; 01
	dbw $98, .OAM_01 ; 02
	dbw $9a, .OAM_01 ; 03
	dbw $0c, .OAM_04 ; 04
	dbw $0e, .OAM_04 ; 05
	dbw $3c, .OAM_04 ; 06
	dbw $60, .OAM_07 ; 07
	dbw $70, .OAM_07 ; 08
	dbw $80, .OAM_07 ; 09
	dbw $90, .OAM_0a ; 0a
	dbw $00, .OAM_0a ; 0b
	dbw $06, .OAM_0a ; 0c
	dbw $c6, .OAM_0d ; 0d
	dbw $6d, .OAM_0e ; 0e
	dbw $f0, .OAM_0f ; 0f
	dbw $f4, .OAM_0f ; 10
	dbw $f8, .OAM_0f ; 11
	dbw $9c, .OAM_12 ; 12
	dbw $ec, .OAM_12 ; 13

.OAM_00:
	db 1
	db $fc, $fc, $00, $00

.OAM_01:
	db 4
	db $f8, $f8, $00, $00
	db $f8, $00, $01, $00
	db $00, $f8, $10, $00
	db $00, $00, $11, $00

.OAM_04:
	db 8
	db $f0, $f8, $00, $00
	db $f0, $00, $01, $00
	db $f8, $f8, $10, $00
	db $f8, $00, $11, $00
	db $00, $f8, $20, $00
	db $00, $00, $20, $20
	db $08, $f8, $21, $00
	db $08, $00, $21, $20

.OAM_07:
	db 20
	db $e8, $f8, $00, $00
	db $e8, $00, $01, $00
	db $f0, $f8, $02, $00
	db $f0, $00, $03, $00
	db $f8, $f0, $04, $00
	db $f8, $f8, $05, $00
	db $f8, $00, $06, $00
	db $f8, $08, $04, $20
	db $00, $f0, $07, $00
	db $00, $f8, $08, $00
	db $00, $00, $08, $20
	db $00, $08, $07, $20
	db $08, $f0, $09, $00
	db $08, $f8, $0a, $00
	db $08, $00, $0a, $20
	db $08, $08, $09, $20
	db $10, $f0, $0b, $00
	db $10, $f8, $0c, $00
	db $10, $00, $0c, $20
	db $10, $08, $0b, $20

.OAM_0a:
	db 36
	db $e8, $e8, $00, $00
	db $e8, $f0, $01, $00
	db $e8, $f8, $02, $00
	db $e8, $00, $03, $00
	db $e8, $08, $04, $00
	db $e8, $10, $05, $00
	db $f0, $e8, $10, $00
	db $f0, $f0, $11, $00
	db $f0, $f8, $12, $00
	db $f0, $00, $13, $00
	db $f0, $08, $14, $00
	db $f0, $10, $15, $00
	db $f8, $e8, $20, $00
	db $f8, $f0, $21, $00
	db $f8, $f8, $22, $00
	db $f8, $00, $23, $00
	db $f8, $08, $24, $00
	db $f8, $10, $25, $00
	db $00, $e8, $30, $00
	db $00, $f0, $31, $00
	db $00, $f8, $32, $00
	db $00, $00, $33, $00
	db $00, $08, $34, $00
	db $00, $10, $35, $00
	db $08, $e8, $40, $00
	db $08, $f0, $41, $00
	db $08, $f8, $42, $00
	db $08, $00, $43, $00
	db $08, $08, $44, $00
	db $08, $10, $45, $00
	db $10, $e8, $50, $00
	db $10, $f0, $51, $00
	db $10, $f8, $52, $00
	db $10, $00, $53, $00
	db $10, $08, $54, $00
	db $10, $10, $55, $00

.OAM_0d:
	db 25
	db $ec, $f0, $00, $00
	db $ec, $f8, $01, $00
	db $ec, $00, $02, $00
	db $ec, $08, $03, $00
	db $ec, $10, $04, $00
	db $f4, $f0, $05, $00
	db $f4, $f8, $06, $00
	db $f4, $00, $07, $00
	db $f4, $08, $08, $00
	db $f4, $10, $09, $00
	db $fc, $f0, $10, $00
	db $fc, $f8, $11, $00
	db $fc, $00, $12, $00
	db $fc, $08, $13, $00
	db $fc, $10, $14, $00
	db $04, $f0, $15, $00
	db $04, $f8, $16, $00
	db $04, $00, $17, $00
	db $04, $08, $18, $00
	db $04, $10, $19, $00
	db $0c, $f0, $20, $00
	db $0c, $f8, $21, $00
	db $0c, $00, $22, $00
	db $0c, $08, $23, $00
	db $0c, $10, $24, $00

.OAM_0e:
	db 4
	db $fc, $f0, $00, $01
	db $fc, $f8, $01, $01
	db $fc, $00, $01, $21
	db $fc, $08, $00, $21

.OAM_0f:
	db 8
	db $f8, $e8, $00, $10
	db $f8, $f0, $01, $10
	db $00, $e8, $02, $10
	db $00, $f0, $03, $10
	db $f8, $08, $01, $30
	db $f8, $10, $00, $30
	db $00, $08, $03, $30
	db $00, $10, $02, $30

.OAM_12:
	db 12
	db $f8, $d8, $00, $10
	db $f8, $e0, $01, $10
	db $f8, $e8, $02, $10
	db $00, $d8, $10, $10
	db $00, $e0, $11, $10
	db $00, $e8, $12, $10
	db $f8, $10, $02, $30
	db $f8, $18, $01, $30
	db $f8, $20, $00, $30
	db $00, $10, $12, $30
	db $00, $18, $11, $30
	db $00, $20, $10, $30
