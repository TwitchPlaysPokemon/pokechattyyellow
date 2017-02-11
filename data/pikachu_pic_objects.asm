PikaPicAnimBGFramesPointers:
pikaanim_def: macro
\1_id: dw \1
	endm

	pikaanim_def PikaPicAnimBGFrames_0 ; 00
	pikaanim_def PikaPicAnimBGFrames_1 ; 01
	pikaanim_def PikaPicAnimBGFrames_2 ; 02
	pikaanim_def PikaPicAnimBGFrames_3 ; 03
	pikaanim_def PikaPicAnimBGFrames_Generic ; 04
	pikaanim_def PikaPicAnimBGFrames_CaughtPokemon_0 ; 05
	pikaanim_def PikaPicAnimBGFrames_Mood2Happy3_1 ; 06
	pikaanim_def PikaPicAnimBGFrames_Mood3Happy5_1 ; 07
	pikaanim_def PikaPicAnimBGFrames_Mood1Happy3_1 ; 08
	pikaanim_def PikaPicAnimBGFrames_Mood2Happy4_1 ; 09
	pikaanim_def PikaPicAnimBGFrames_Mood2Happy2_1 ; 0a
	pikaanim_def PikaPicAnimBGFrames_Mood2Happy1_1 ; 0b
	pikaanim_def PikaPicAnimBGFrames_Mood2Happy5_1 ; 0c
	pikaanim_def PikaPicAnimBGFrames_Mood3Happy3_1 ; 0d
	pikaanim_def PikaPicAnimBGFrames_Mood1Happy2_1 ; 0e
	pikaanim_def PikaPicAnimBGFrames_15 ; 0f
	pikaanim_def PikaPicAnimBGFrames_Mood3Happy6_1 ; 10
	pikaanim_def PikaPicAnimBGFrames_FastAsleep_1 ; 11
	pikaanim_def PikaPicAnimBGFrames_Mood3Happy2_1 ; 12
	pikaanim_def PikaPicAnimBGFrames_Mood3Happy1_1 ; 13
	pikaanim_def PikaPicAnimBGFrames_Mood1Happy1_1 ; 14
	pikaanim_def PikaPicAnimBGFrames_Mood3Happy4_1 ; 15
	pikaanim_def PikaPicAnimBGFrames_Mood2Happy6_1 ; 16
	pikaanim_def PikaPicAnimBGFrames_Mood1Happy5_1 ; 17
	pikaanim_def PikaPicAnimBGFrames_CaughtPokemon_1 ; 18
	pikaanim_def PikaPicAnimBGFrames_Mood2Happy7_1 ; 19
	pikaanim_def PikaPicAnimBGFrames_Mood3Happy7_1 ; 1a
	pikaanim_def PikaPicAnimBGFrames_FishingRod_1 ; 1b
	pikaanim_def PikaPicAnimBGFrames_LavenderTown_1 ; 1c
	pikaanim_def PikaPicAnimBGFrames_BillFirstTime_1 ; 1d
	pikaanim_def PikaPicAnimBGFrames_ThunderStone_1 ; 1e
	pikaanim_def PikaPicAnimBGFrames_ThunderBolt_1 ; 1f
	pikaanim_def PikaPicAnimBGFrames_PewterWake_1 ; 20
	pikaanim_def PikaPicAnimBGFrames_BillEnterTeleporter_1 ; 21
	pikaanim_def PikaPicAnimBGFrames_Statused_1 ; 22
	pikaanim_def PikaPicAnimBGFrames_35 ; 23

PikaPicAnimBGFrames_0: ; fallback
PikaPicAnimBGFrames_1: ; unused
	; Tilemap idx, duration
	pikaframe PikaAnimTilemap_1,   20
	pikaframe PikaAnimTilemap_7,    2
	pikaframe PikaAnimTilemap_1,    1
	pikaframe PikaAnimTilemap_7,    2
	pikaframe PikaAnimTilemap_1,    1
	pikaframe PikaAnimTilemap_7,    8
	pikaframeend

PikaPicAnimBGFrames_fdc1e: ; unreferenced
	pikaframe PikaAnimTilemap_2,    2
	pikaframe PikaAnimTilemap_1,    1
	pikaframe PikaAnimTilemap_2,    2
	pikaframe PikaAnimTilemap_1,    1
	pikaframe PikaAnimTilemap_2,    8
	pikaframeend

PikaPicAnimBGFrames_2: ; unused
	pikaframedelay                  8
	pikaframe PikaAnimTilemap_8,    8
	pikaframedelay                  8
	pikaframe PikaAnimTilemap_8,    8
	pikaframeend

PikaPicAnimBGFrames_3: ; unused
	pikaframe PikaAnimTilemap_8,    8
	pikaframedelay                  8
	pikaframe PikaAnimTilemap_8,    8
	pikaframedelay                  8
	pikaframeend

PikaPicAnimBGFrames_Generic:
PikaPicAnimBGFrames_35: ; fallback
	pikaframe PikaAnimTilemap_1,    0
	pikaframeend

PikaPicAnimBGFrames_CaughtPokemon_0:
	pikaframe PikaAnimTilemap_9,    0
	pikaframeend

PikaPicAnimBGFrames_Mood2Happy3_1:
	pikaframedelay                  2
	pikaframe PikaAnimTilemap_14,   4
	pikaframedelay                  8
	pikaframe PikaAnimTilemap_14,   4
	pikaframedelay                 64
	pikaframe PikaAnimTilemap_14,   4
	pikaframedelay                 64
	pikaframeend

PikaPicAnimBGFrames_Mood3Happy5_1:
	pikaframedelay                  4
	pikaframe PikaAnimTilemap_15,   4
	pikaframedelay                  4
	pikaframe PikaAnimTilemap_15,   4
	pikaframedelay                  8
	pikaframe PikaAnimTilemap_15,   4
	pikaframedelay                  8
	pikaframe PikaAnimTilemap_15,   4
	pikaframeend

PikaPicAnimBGFrames_Mood1Happy3_1:
	pikaframe PikaAnimTilemap_16,   1
	pikaframedelay                  1
	pikaframe PikaAnimTilemap_16,   1
	pikaframedelay                 64
	pikaframe PikaAnimTilemap_16,   1
	pikaframedelay                 64
	pikaframeend

PikaPicAnimBGFrames_Mood2Happy4_1:
	pikaframedelay                  8
	pikaframe PikaAnimTilemap_17,   8
	pikaframedelay                 20
	pikaframe PikaAnimTilemap_17,   8
	pikaframeend

PikaPicAnimBGFrames_Mood2Happy2_1:
	pikaframedelay                  2
	pikaframe PikaAnimTilemap_18,   2
	pikaframedelay                  2
	pikaframe PikaAnimTilemap_18,  64
	pikaframedelay                  3
	pikaframe PikaAnimTilemap_18,  64
	pikaframeend

PikaPicAnimBGFrames_Mood2Happy1_1:
	pikaframedelay                  8
	pikaframe PikaAnimTilemap_19,  64
	pikaframedelay                  4
	pikaframe PikaAnimTilemap_19,  64
	pikaframeend

PikaPicAnimBGFrames_Mood2Happy5_1:
	pikaframe PikaAnimTilemap_20,   8
	pikaframedelay                  2
	pikaframe PikaAnimTilemap_20,   8
	pikaframedelay                  2
	pikaframe PikaAnimTilemap_20,   8
	pikaframeend

PikaPicAnimBGFrames_Mood3Happy3_1:
	pikaframe PikaAnimTilemap_21,   4
	pikaframedelay                  8
	pikaframe PikaAnimTilemap_21,   4
	pikaframedelay                 64
	pikaframe PikaAnimTilemap_21,   4
	pikaframedelay                 64
	pikaframeend

PikaPicAnimBGFrames_Mood1Happy2_1:
	pikaframedelay                  2
	pikaframe PikaAnimTilemap_22,   2
	pikaframedelay                  2
	pikaframe PikaAnimTilemap_22,   2
	pikaframedelay                 20
	pikaframe PikaAnimTilemap_22,   2
	pikaframeend

PikaPicAnimBGFrames_15: ; unused
	pikaframedelay                  8
	pikaframe PikaAnimTilemap_23,   8
	pikaframeend

PikaPicAnimBGFrames_Mood3Happy6_1:
	pikaframedelay                  8
	pikaframe PikaAnimTilemap_23,   3
	pikaframe PikaAnimTilemap_24,   5
	pikaframe PikaAnimTilemap_23,   3
	pikaframedelay                  5
	pikaframeend

PikaPicAnimBGFrames_FastAsleep_1:
	pikaframedelay                 20
	pikaframe PikaAnimTilemap_25,   8
	pikaframedelay                 20
	pikaframe PikaAnimTilemap_25,   8
	pikaframeend

PikaPicAnimBGFrames_Mood3Happy2_1:
	pikaframedelay                 13
	pikaframe PikaAnimTilemap_26,  12
	pikaframedelay                100
	pikaframe PikaAnimTilemap_26,   8
	pikaframeend

PikaPicAnimBGFrames_Mood3Happy1_1:
	pikaframedelay                  5
	pikaframe PikaAnimTilemap_27,   5
	pikaframedelay                  5
	pikaframe PikaAnimTilemap_27,   5
	pikaframedelay                100
	pikaframeend

PikaPicAnimBGFrames_Mood1Happy1_1:
	pikaframedelay                  2
	pikaframe PikaAnimTilemap_28,   2
	pikaframedelay                  2
	pikaframe PikaAnimTilemap_28,   2
	pikaframeend

PikaPicAnimBGFrames_Mood3Happy4_1:
	pikaframedelay                  5
	pikaframe PikaAnimTilemap_29,   5
	pikaframedelay                  5
	pikaframe PikaAnimTilemap_29,   5
	pikaframeend

PikaPicAnimBGFrames_Mood2Happy6_1:
	pikaframe PikaAnimTilemap_30,   8
	pikaframedelay                100
	pikaframeend

PikaPicAnimBGFrames_Mood1Happy5_1:
	pikaframedelay                 10
	pikaframe PikaAnimTilemap_31,   3
	pikaframedelay                  3
	pikaframe PikaAnimTilemap_31,   3
	pikaframedelay                100
	pikaframeend

PikaPicAnimBGFrames_CaughtPokemon_1:
	pikaframedelay                  3
	pikaframe PikaAnimTilemap_32, 100
	pikaframedelay                  8
	pikaframe PikaAnimTilemap_32,   8
	pikaframeend

PikaPicAnimBGFrames_Mood2Happy7_1:
	pikaframe PikaAnimTilemap_33,   6
	pikaframedelay                  6
	pikaframe PikaAnimTilemap_33,   6
	pikaframedelay                  6
	pikaframeend

PikaPicAnimBGFrames_Mood3Happy7_1:
	pikaframedelay                  8
	pikaframe PikaAnimTilemap_34,  12
	pikaframedelay                  8
	pikaframe PikaAnimTilemap_34,  12
	pikaframeend

PikaPicAnimBGFrames_FishingRod_1:
	pikaframedelay                  8
	pikaframe PikaAnimTilemap_9,    2
	pikaframe PikaAnimTilemap_10,   1
	pikaframe PikaAnimTilemap_11,   1
	pikaframe PikaAnimTilemap_12, 100
	pikaframeend

PikaPicAnimBGFrames_LavenderTown_1:
	pikaframedelay                  8
	pikaframe PikaAnimTilemap_36, 100
	pikaframeend

PikaPicAnimBGFrames_BillFirstTime_1:
	pikaframedelay                 16
	pikaframe PikaAnimTilemap_37,  16
	pikaframedelay                 16
	pikaframe PikaAnimTilemap_37,  16
	pikaframeend

PikaPicAnimBGFrames_ThunderStone_1:
	pikaframedelay                  6
	pikaframe PikaAnimTilemap_38,   6
	pikaframedelay                  6
	pikaframe PikaAnimTilemap_38,   6
	pikaframedelay                100
	pikaframeend

PikaPicAnimBGFrames_ThunderBolt_1:
	pikaframedelay                  6
	pikaframe PikaAnimTilemap_9,    6
	pikaframe PikaAnimTilemap_10, 100
	pikaframeend

PikaPicAnimBGFrames_PewterWake_1:
	pikaframedelay                 20
	pikaframe PikaAnimTilemap_9,    8
	pikaframedelay                 20
	pikaframe PikaAnimTilemap_9,    8
	pikaframe PikaAnimTilemap_10,   8
	pikaframe PikaAnimTilemap_11, 100
	pikaframeend

PikaPicAnimBGFrames_BillEnterTeleporter_1:
	pikaframedelay                  4
	pikaframe PikaAnimTilemap_9,  100
	pikaframeend

PikaPicAnimBGFrames_Statused_1:
    pikaframedelay                 12
	pikaframe PikaAnimTilemap_9,   12
	pikaframedelay                 12
	pikaframe PikaAnimTilemap_9,  100
	pikaframeend
