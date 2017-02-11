PikaPicAnimThunderboltPals:
	db 4, %11000000
	db 4, %11100100
	db 4, %11000000
	db 4, %11100100
	db 4, %11000000
	db 4, %11100100
	db 4, %11000000
	db 4, %11100100
	db 4, %11000000
	db 4, %11100100
	db 4, %11000000
	db 4, %11100100
	db 4, %11000000
	db 4, %11100100
	db 4, %11000000
	db 4, %11100100
	db 4, %11000000
	db 4, %11100100
	db 4, %11000000
	db 4, %11100100
	db $ff

Data_fe26b:
	pikapic_loadgfx Pic_Mood2Happy3_0
	pikapic_loadgfx Pic_Mood3Happy3_0
	pikapic_loadgfx ChatotSprite
	pikapic_animation PikaPicAnimBGFrames_1, $80, $0, $0
	pikapic_animation PikaPicAnimBGFrames_2, $b2, $5, $5
	pikapic_animation PikaPicAnimBGFrames_3, $b6, $5, $5
	pikapic_waitbgmap
	pikapic_cry
	pikapic_looptofinish

PikaPicAnimScript_00:
PikaPicAnimScript_1d:
PikaPicAnimScript_Mood2Happy3:
	pikapic_setduration 40
	pikapic_loadgfx Pic_Mood2Happy3_0
	pikapic_loadgfx GFX_Mood2Happy3_0
	pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	pikapic_animation PikaPicAnimBGFrames_Mood2Happy3_1, $99, $0, $0
	pikapic_waitbgmap
	pikapic_cry PikachuCry3
	pikapic_looptofinish

; PikaPicAnimScript_Mood3Happy5:
	; pikapic_setduration 44
	; pikapic_loadgfx Pic_Mood3Happy5_0
	; pikapic_loadgfx GFX_Mood3Happy5_0
	; pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	; pikapic_animation PikaPicAnimBGFrames_Mood3Happy5_1, $99, $0, $0
	; pikapic_waitbgmap
	; pikapic_cry
	; pikapic_looptofinish

; PikaPicAnimScript_Mood1Happy3:
	; pikapic_setduration 80
	; pikapic_loadgfx Pic_Mood1Happy3_0
	; pikapic_loadgfx GFX_Mood1Happy3_0
	; pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	; pikapic_animation PikaPicAnimBGFrames_Mood1Happy3_1, $99, $0, $0
	; pikapic_waitbgmap
	; pikapic_cry
	; pikapic_looptofinish

PikaPicAnimScript_Mood2Happy4:
	pikapic_setduration 64
	pikapic_loadgfx Pic_Mood2Happy4_0
	pikapic_loadgfx GFX_Mood2Happy4_0
	pikapic_loadgfx GFX_Mood2Happy4_1
	pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	pikapic_animation PikaPicAnimBGFrames_Mood2Happy4_1, $99, $0, $0
	pikapic_waitbgmap
	pikapic_cry
	pikapic_looptofinish

PikaPicAnimScript_Mood2Happy2:
	pikapic_setduration 24
	pikapic_loadgfx Pic_Mood2Happy2_0
	pikapic_loadgfx GFX_Mood2Happy2_0
	pikapic_loadgfx GFX_Mood2Happy2_1
	pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	pikapic_animation PikaPicAnimBGFrames_Mood2Happy2_1, $99, $0, $0
	pikapic_waitbgmap
	pikapic_cry
	pikapic_looptofinish

PikaPicAnimScript_Mood2Happy1:
	pikapic_setduration 50
	pikapic_loadgfx Pic_Mood2Happy1_0
	pikapic_loadgfx GFX_Mood2Happy1_0
	pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	pikapic_animation PikaPicAnimBGFrames_Mood2Happy1_1, $99, $0, $0
	pikapic_waitbgmap
	pikapic_cry PikachuCry38
	pikapic_looptofinish

PikaPicAnimScript_Mood2Happy5:
	pikapic_setduration 58
	pikapic_loadgfx Pic_Mood2Happy5_0
	pikapic_loadgfx GFX_Mood2Happy5_0
	pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	pikapic_animation PikaPicAnimBGFrames_Mood2Happy5_1, $99, $0, $0
	pikapic_waitbgmap
	pikapic_cry
	pikapic_looptofinish

; PikaPicAnimScript_Mood3Happy3:
	; pikapic_setduration 44
	; pikapic_loadgfx Pic_Mood3Happy3_0
	; pikapic_loadgfx GFX_Mood3Happy3_0
	; pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	; pikapic_animation PikaPicAnimBGFrames_Mood3Happy3_1, $99, $0, $0
	; pikapic_waitbgmap
	; pikapic_cry
	; pikapic_looptofinish

; PikaPicAnimScript_Mood1Happy2:
	; pikapic_setduration 56
	; pikapic_loadgfx Pic_Mood1Happy2_0
	; pikapic_loadgfx GFX_Mood1Happy2_0
	; pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	; pikapic_animation PikaPicAnimBGFrames_Mood1Happy2_1, $99, $0, $0
	; pikapic_waitbgmap
	; pikapic_cry
	; pikapic_looptofinish

; PikaPicAnimScript_Mood3Happy6:
	; pikapic_setduration 56
	; pikapic_loadgfx Pic_Mood3Happy6_0
	; pikapic_loadgfx GFX_Mood3Happy6_0
	; pikapic_loadgfx GFX_Mood3Happy6_1
	; pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	; pikapic_animation PikaPicAnimBGFrames_Mood3Happy6_1, $99, $0, $0
	; pikapic_waitbgmap
	; pikapic_cry
	; pikapic_looptofinish

PikaPicAnimScript_FastAsleep:
	pikapic_setduration 100
	pikapic_loadgfx Pic_FastAsleep_0
	pikapic_loadgfx GFX_FastAsleep_0
	pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	pikapic_animation PikaPicAnimBGFrames_FastAsleep_1, $99, $0, $0
	pikapic_waitbgmap
	pikapic_cry
	pikapic_looptofinish

; PikaPicAnimScript_Mood3Happy2:
	; pikapic_setduration 50
	; pikapic_loadgfx Pic_Mood3Happy2_0
	; pikapic_loadgfx GFX_Mood3Happy2_0
	; pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	; pikapic_animation PikaPicAnimBGFrames_Mood3Happy2_1, $99, $0, $0
	; pikapic_waitbgmap
	; pikapic_cry PikachuCry25
	; pikapic_looptofinish

; PikaPicAnimScript_Mood3Happy1:
	; pikapic_setduration 50
	; pikapic_loadgfx Pic_Mood3Happy1_0
	; pikapic_loadgfx GFX_Mood3Happy1_0
	; pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	; pikapic_animation PikaPicAnimBGFrames_Mood3Happy1_1, $99, $0, $0
	; pikapic_waitbgmap
	; pikapic_cry
	; pikapic_looptofinish

; PikaPicAnimScript_Mood1Happy1:
	; pikapic_setduration 40
	; pikapic_loadgfx Pic_Mood1Happy1_0
	; pikapic_loadgfx GFX_Mood1Happy1_0
	; pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	; pikapic_animation PikaPicAnimBGFrames_Mood1Happy1_1, $99, $0, $0
	; pikapic_waitbgmap
	; pikapic_cry
	; pikapic_looptofinish

; PikaPicAnimScript_Mood3Happy4:
	; pikapic_setduration 50
	; pikapic_loadgfx Pic_Mood3Happy4_0
	; pikapic_loadgfx GFX_Mood3Happy4_0
	; pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	; pikapic_animation PikaPicAnimBGFrames_Mood3Happy4_1, $99, $0, $0
	; pikapic_waitbgmap
	; pikapic_cry
	; pikapic_looptofinish

PikaPicAnimScript_Mood2Happy6:
	pikapic_setduration 32
	pikapic_loadgfx Pic_Mood2Happy6_0
	pikapic_loadgfx GFX_Mood2Happy6_0
	pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	pikapic_animation PikaPicAnimBGFrames_Mood2Happy6_1, $99, $0, $0
	pikapic_waitbgmap
	pikapic_cry
	pikapic_looptofinish

; PikaPicAnimScript_Mood1Happy5:
	; pikapic_setduration 100
	; pikapic_loadgfx Pic_Mood1Happy5_0
	; pikapic_loadgfx GFX_Mood1Happy5_0
	; pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	; pikapic_animation PikaPicAnimBGFrames_Mood1Happy5_1, $99, $0, $0
	; pikapic_waitbgmap
	; pikapic_cry
	; pikapic_looptofinish

PikaPicAnimScript_CaughtPokemon:
	pikapic_setduration 32
	pikapic_loadgfx Pic_Mood2Happy2_0
	pikapic_loadgfx Pic_Mood2Happy4_0
	pikapic_loadgfx GFX_Mood2Happy3_0
	pikapic_loadgfx GFX_Mood2Happy4_0
	pikapic_animation PikaPicAnimBGFrames_CaughtPokemon_0, $80, $0, $0
	pikapic_animation PikaPicAnimBGFrames_CaughtPokemon_1, $99, $0, $0
	pikapic_waitbgmap
	pikapic_cry PikachuCry18
	pikapic_looptofinish

PikaPicAnimScript_Mood2Happy7:
	pikapic_setduration 44
	pikapic_loadgfx Pic_Mood2Happy7_0
	pikapic_loadgfx GFX_Mood2Happy7_0
	pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	pikapic_animation PikaPicAnimBGFrames_Mood2Happy7_1, $99, $0, $0
	pikapic_waitbgmap
	pikapic_cry
	pikapic_looptofinish

; PikaPicAnimScript_Mood3Happy7:
	; pikapic_setduration 50
	; pikapic_loadgfx Pic_Mood3Happy7_0
	; pikapic_loadgfx GFX_Mood3Happy7_0
	; pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	; pikapic_animation PikaPicAnimBGFrames_Mood3Happy7_1, $99, $0, $0
	; pikapic_waitbgmap
	; pikapic_cry
	; pikapic_looptofinish

PikaPicAnimScript_FishingRod:
	pikapic_setduration 70
	pikapic_loadgfx Pic_FishingRod_0
	pikapic_loadgfx GFX_FishingRod_0
	pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	pikapic_animation PikaPicAnimBGFrames_FishingRod_1, $99, $0, $0
	pikapic_waitbgmap
	pikapic_cry PikachuCry20
	pikapic_looptofinish

PikaPicAnimScript_LavenderTown:
	pikapic_setduration 24
	pikapic_loadgfx GFX_LavenderTown_0
	pikapic_loadgfx GFX_LavenderTown_1
	pikapic_loadgfx GFX_LavenderTown_2
	pikapic_loadgfx GFX_LavenderTown_3
	pikapic_animation PikaPicAnimBGFrames_CaughtPokemon_0, $80, $0, $0
	pikapic_animation PikaPicAnimBGFrames_LavenderTown_1, $99, $0, $0
	pikapic_animation PikaPicAnimBGFrames_LavenderTown_2, $b2, $0, $0
	pikapic_waitbgmap
	pikapic_cry
	pikapic_looptofinish

PikaPicAnimScript_BillFirstTime:
	pikapic_setduration 70
	pikapic_loadgfx GFX_BillFirstTime_0
	pikapic_loadgfx GFX_BillFirstTime_1
	pikapic_animation PikaPicAnimBGFrames_CaughtPokemon_0, $80, $0, $0
	pikapic_animation PikaPicAnimBGFrames_BillFirstTime_1, $99, $0, $0
	pikapic_waitbgmap
	pikapic_cry
	pikapic_looptofinish

PikaPicAnimScript_Burned:
	pikapic_setduration 60
	pikapic_loadgfx GFX_Burned_0
	pikapic_loadgfx GFX_Burned_1
	pikapic_animation PikaPicAnimBGFrames_CaughtPokemon_0, $80, $0, $0
	pikapic_animation PikaPicAnimBGFrames_Burned_1, $99, $0, $0
	pikapic_waitbgmap
	pikapic_cry
	pikapic_looptofinish

; PikaPicAnimScript_ThunderBolt:
	; pikapic_setduration 50
	; pikapic_loadgfx Pic_ThunderBolt_0
	; pikapic_loadgfx GFX_ThunderBolt_0
	; pikapic_loadgfx GFX_ThunderBolt_1
	; pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	; pikapic_animation PikaPicAnimBGFrames_ThunderBolt_1, $99, $0, $0
	; pikapic_waitbgmap
	; pikapic_cry
	; pikapic_writebyte 13
	; pikapic_waitbgmap
	; pikapic_thunderbolt
	; pikapic_ret

Data_fe51f:
	pikapic_waitbgmap
PikaPicAnimScript_PewterWake:
	pikapic_setduration 100
	pikapic_loadgfx Pic_FastAsleep_0
	pikapic_loadgfx GFX_FastAsleep_0
	pikapic_loadgfx GFX_PewterWake_1
	pikapic_loadgfx GFX_PewterWake_2
	pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	pikapic_animation PikaPicAnimBGFrames_PewterWake_1, $99, $0, $0
	pikapic_waitbgmap
	pikapic_cry
	pikapic_looptofinish

PikaPicAnimScript_BillEnterTeleporter:
	pikapic_setduration 30
	pikapic_loadgfx Pic_BillEnterTeleporter_0
	pikapic_loadgfx GFX_BillEnterTeleporter_0
	pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	pikapic_animation PikaPicAnimBGFrames_BillEnterTeleporter_1, $99, $0, $0
	pikapic_waitbgmap
	pikapic_cry
	pikapic_looptofinish

PikaPicAnimScript_Statused:
	pikapic_setduration 40
	pikapic_loadgfx Pic_Statused_0
	pikapic_loadgfx GFX_Statused_0
	pikapic_loadgfx GFX_Statused_1
	pikapic_loadgfx GFX_Statused_2
	pikapic_animation PikaPicAnimBGFrames_Generic, $80, $0, $0
	pikapic_animation PikaPicAnimBGFrames_Statused_1, $99, $0, $0
	pikapic_waitbgmap
	pikapic_cry
	pikapic_looptofinish

PikaPicAnimGFXHeaders:
pikapicanimgfx: MACRO
\2_id::
	db \1 ; (-1 if compressed)
	dba \2
	endm

PikaPicAnimGFX_Null_id::
	dbbw            1, $39,$0000
	pikapicanimgfx -1, Pic_Mood2Happy3_0
	pikapicanimgfx 25, GFX_Mood2Happy3_0
; 	pikapicanimgfx -1, Pic_Mood3Happy5_0
; 	pikapicanimgfx 10, GFX_Mood3Happy5_0
; 	pikapicanimgfx -1, Pic_Mood1Happy3_0
; 	pikapicanimgfx  6, GFX_Mood1Happy3_0
	pikapicanimgfx -1, Pic_Mood2Happy4_0
	pikapicanimgfx 25, GFX_Mood2Happy4_0
	pikapicanimgfx 25, GFX_Mood2Happy4_1
	pikapicanimgfx -1, Pic_Mood2Happy2_0
	pikapicanimgfx 25, GFX_Mood2Happy2_0
	pikapicanimgfx 25, GFX_Mood2Happy2_1
	pikapicanimgfx -1, Pic_Mood2Happy1_0
	pikapicanimgfx  4, GFX_Mood2Happy1_0
	pikapicanimgfx -1, Pic_Mood2Happy5_0
	pikapicanimgfx 25, GFX_Mood2Happy5_0
	pikapicanimgfx -1, Pic_Mood3Happy3_0
; 	pikapicanimgfx 10, GFX_Mood3Happy3_0
; 	pikapicanimgfx -1, Pic_Mood1Happy2_0
; 	pikapicanimgfx  6, GFX_Mood1Happy2_0
; 	pikapicanimgfx -1, Pic_Mood3Happy6_0
; 	pikapicanimgfx 25, GFX_Mood3Happy6_0
; 	pikapicanimgfx 25, GFX_Mood3Happy6_1
	pikapicanimgfx -1, Pic_FastAsleep_0
	pikapicanimgfx 25, GFX_FastAsleep_0
; 	pikapicanimgfx -1, Pic_Mood3Happy2_0
; 	pikapicanimgfx 25, GFX_Mood3Happy2_0
; 	pikapicanimgfx -1, Pic_Mood3Happy1_0
; 	pikapicanimgfx 25, GFX_Mood3Happy1_0
; 	pikapicanimgfx -1, Pic_Mood1Happy1_0
; 	pikapicanimgfx 25, GFX_Mood1Happy1_0
; 	pikapicanimgfx -1, Pic_Mood3Happy4_0
; 	pikapicanimgfx 25, GFX_Mood3Happy4_0
	pikapicanimgfx -1, Pic_Mood2Happy6_0
	pikapicanimgfx 25, GFX_Mood2Happy6_0
; 	pikapicanimgfx -1, Pic_Mood1Happy5_0
; 	pikapicanimgfx 25, GFX_Mood1Happy5_0
	pikapicanimgfx -1, Pic_Mood2Happy7_0
	pikapicanimgfx 25, GFX_Mood2Happy7_0
; 	pikapicanimgfx -1, Pic_Mood3Happy7_0
; 	pikapicanimgfx 25, GFX_Mood3Happy7_0
	pikapicanimgfx -1, Pic_FishingRod_0
	pikapicanimgfx 25, GFX_FishingRod_0
	; pikapicanimgfx 25, GFX_FishingRod_1
	; pikapicanimgfx 25, GFX_FishingRod_2
	; pikapicanimgfx 25, GFX_FishingRod_3
	pikapicanimgfx 25, GFX_LavenderTown_0
	pikapicanimgfx 25, GFX_LavenderTown_1
	pikapicanimgfx 25, GFX_LavenderTown_2
	pikapicanimgfx 25, GFX_LavenderTown_3
	pikapicanimgfx 25, GFX_BillFirstTime_0
	pikapicanimgfx 25, GFX_BillFirstTime_1
	pikapicanimgfx 25, GFX_Burned_0
	pikapicanimgfx 25, GFX_Burned_1
	; pikapicanimgfx -1, Pic_ThunderBolt_0
	; pikapicanimgfx 25, GFX_ThunderBolt_0
	; pikapicanimgfx 25, GFX_ThunderBolt_1
	pikapicanimgfx 25, GFX_PewterWake_1
	pikapicanimgfx 25, GFX_PewterWake_2
	pikapicanimgfx -1, Pic_BillEnterTeleporter_0
	pikapicanimgfx 25, GFX_BillEnterTeleporter_0
	pikapicanimgfx -1, Pic_Statused_0
	pikapicanimgfx 25, GFX_Statused_0
	pikapicanimgfx 25, GFX_Statused_1
	pikapicanimgfx 25, GFX_Statused_2
	pikapicanimgfx 24, ChatotSprite
