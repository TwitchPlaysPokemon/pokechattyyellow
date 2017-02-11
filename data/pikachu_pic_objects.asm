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
	pikaanim_def PikaPicAnimBGFrames_LavenderTown_2 ; 1c
	pikaanim_def PikaPicAnimBGFrames_BillFirstTime_1 ; 1d
	pikaanim_def PikaPicAnimBGFrames_Burned_1 ; 1e
	pikaanim_def PikaPicAnimBGFrames_ThunderBolt_1 ; 1f
	pikaanim_def PikaPicAnimBGFrames_PewterWake_1 ; 20
	pikaanim_def PikaPicAnimBGFrames_BillEnterTeleporter_1 ; 21
	pikaanim_def PikaPicAnimBGFrames_Statused_1 ; 22
	pikaanim_def PikaPicAnimBGFrames_35 ; 23

PikaPicAnimBGFrames_0: ; fallback
PikaPicAnimBGFrames_1: ; unused
	; Tilemap idx, duration
	pikaframe PikaAnimTilemap_1_0,                 20
	pikaframe PikaAnimTilemap_1_1,                  2
	pikaframe PikaAnimTilemap_1_0,                  1
	pikaframe PikaAnimTilemap_1_1,                  2
	pikaframe PikaAnimTilemap_1_0,                  1
	pikaframe PikaAnimTilemap_1_1,                  8
	pikaframeend

PikaPicAnimBGFrames_fdc1e: ; unreferenced
	pikaframe PikaAnimTilemap_fdc1e_0,              2
	pikaframe PikaAnimTilemap_1_0,                  1
	pikaframe PikaAnimTilemap_fdc1e_0,              2
	pikaframe PikaAnimTilemap_1_0,                  1
	pikaframe PikaAnimTilemap_fdc1e_0,              8
	pikaframeend

PikaPicAnimBGFrames_2: ; unused
	pikaframesleep                                  8
	pikaframe PikaAnimTilemap_2_0,                  8
	pikaframesleep                                  8
	pikaframe PikaAnimTilemap_2_0,                  8
	pikaframeend

PikaPicAnimBGFrames_3: ; unused
	pikaframe PikaAnimTilemap_2_0,                  8
	pikaframesleep                                  8
	pikaframe PikaAnimTilemap_2_0,                  8
	pikaframesleep                                  8
	pikaframeend

PikaPicAnimBGFrames_Generic:
PikaPicAnimBGFrames_35: ; fallback
	pikaframe PikaAnimTilemap_1_0,                  0
	pikaframeend

PikaPicAnimBGFrames_CaughtPokemon_0:
	pikaframe PikaAnimTilemap_CaughtPokemon_0_0,    0
	pikaframeend

PikaPicAnimBGFrames_Mood2Happy3_1:
	pikaframesleep                                  2
	pikaframe PikaAnimTilemap_Mood2Happy3_1_0,      4
	pikaframesleep                                  8
	pikaframe PikaAnimTilemap_Mood2Happy3_1_0,      4
	pikaframesleep                                 64
	pikaframe PikaAnimTilemap_Mood2Happy3_1_0,      4
	pikaframesleep                                 64
	pikaframeend

PikaPicAnimBGFrames_Mood3Happy5_1:
	pikaframesleep                                  4
	pikaframe PikaAnimTilemap_Mood3Happy5_1_0,      4
	pikaframesleep                                  4
	pikaframe PikaAnimTilemap_Mood3Happy5_1_0,      4
	pikaframesleep                                  8
	pikaframe PikaAnimTilemap_Mood3Happy5_1_0,      4
	pikaframesleep                                  8
	pikaframe PikaAnimTilemap_Mood3Happy5_1_0,      4
	pikaframeend

PikaPicAnimBGFrames_Mood1Happy3_1:
	pikaframe PikaAnimTilemap_Mood1Happy3_1_0,      1
	pikaframesleep                                  1
	pikaframe PikaAnimTilemap_Mood1Happy3_1_0,      1
	pikaframesleep                                 64
	pikaframe PikaAnimTilemap_Mood1Happy3_1_0,      1
	pikaframesleep                                 64
	pikaframeend

PikaPicAnimBGFrames_Mood2Happy4_1:
	pikaframesleep                                  8
	pikaframe PikaAnimTilemap_Mood2Happy4_1_0,      8
	pikaframesleep                                 20
	pikaframe PikaAnimTilemap_Mood2Happy4_1_0,      8
	pikaframeend

PikaPicAnimBGFrames_Mood2Happy2_1:
	pikaframesleep                                  2
	pikaframe PikaAnimTilemap_Mood2Happy2_1_0,      2
	pikaframesleep                                  2
	pikaframe PikaAnimTilemap_Mood2Happy2_1_0,     64
	pikaframesleep                                  3
	pikaframe PikaAnimTilemap_Mood2Happy2_1_0,     64
	pikaframeend

PikaPicAnimBGFrames_Mood2Happy1_1:
	pikaframesleep                                  8
	pikaframe PikaAnimTilemap_Mood2Happy1_1_0,     64
	pikaframesleep                                  4
	pikaframe PikaAnimTilemap_Mood2Happy1_1_0,     64
	pikaframeend

PikaPicAnimBGFrames_Mood2Happy5_1:
	pikaframe PikaAnimTilemap_Mood2Happy5_1_0,      8
	pikaframesleep                                  2
	pikaframe PikaAnimTilemap_Mood2Happy5_1_0,      8
	pikaframesleep                                  2
	pikaframe PikaAnimTilemap_Mood2Happy5_1_0,      8
	pikaframeend

PikaPicAnimBGFrames_Mood3Happy3_1:
	pikaframe PikaAnimTilemap_Mood3Happy3_1_0,      4
	pikaframesleep                                  8
	pikaframe PikaAnimTilemap_Mood3Happy3_1_0,      4
	pikaframesleep                                 64
	pikaframe PikaAnimTilemap_Mood3Happy3_1_0,      4
	pikaframesleep                                 64
	pikaframeend

PikaPicAnimBGFrames_Mood1Happy2_1:
	pikaframesleep                                  2
	pikaframe PikaAnimTilemap_Mood1Happy2_1_0,      2
	pikaframesleep                                  2
	pikaframe PikaAnimTilemap_Mood1Happy2_1_0,      2
	pikaframesleep                                 20
	pikaframe PikaAnimTilemap_Mood1Happy2_1_0,      2
	pikaframeend

PikaPicAnimBGFrames_15: ; unused
	pikaframesleep                                  8
	pikaframe PikaAnimTilemap_15_0,                 8
	pikaframeend

PikaPicAnimBGFrames_Mood3Happy6_1:
	pikaframesleep                                  8
	pikaframe PikaAnimTilemap_15_0,                 3
	pikaframe PikaAnimTilemap_Mood3Happy6_1_1,      5
	pikaframe PikaAnimTilemap_15_0,                 3
	pikaframesleep                                  5
	pikaframeend

PikaPicAnimBGFrames_FastAsleep_1:
	pikaframesleep                                 20
	pikaframe PikaAnimTilemap_FastAsleep_1_0,       8
	pikaframesleep                                 20
	pikaframe PikaAnimTilemap_FastAsleep_1_0,       8
	pikaframeend

PikaPicAnimBGFrames_Mood3Happy2_1:
	pikaframesleep                                 13
	pikaframe PikaAnimTilemap_Mood3Happy2_1_0,     12
	pikaframesleep                                100
	pikaframe PikaAnimTilemap_Mood3Happy2_1_0,      8
	pikaframeend

PikaPicAnimBGFrames_Mood3Happy1_1:
	pikaframesleep                                  5
	pikaframe PikaAnimTilemap_Mood3Happy1_1_0,      5
	pikaframesleep                                  5
	pikaframe PikaAnimTilemap_Mood3Happy1_1_0,      5
	pikaframesleep                                100
	pikaframeend

PikaPicAnimBGFrames_Mood1Happy1_1:
	pikaframesleep                                  2
	pikaframe PikaAnimTilemap_Mood1Happy1_1_0,      2
	pikaframesleep                                  2
	pikaframe PikaAnimTilemap_Mood1Happy1_1_0,      2
	pikaframeend

PikaPicAnimBGFrames_Mood3Happy4_1:
	pikaframesleep                                  5
	pikaframe PikaAnimTilemap_Mood3Happy4_1_0,      5
	pikaframesleep                                  5
	pikaframe PikaAnimTilemap_Mood3Happy4_1_0,      5
	pikaframeend

PikaPicAnimBGFrames_Mood2Happy6_1:
	pikaframe PikaAnimTilemap_Mood2Happy6_1_0,      8
	pikaframesleep                                100
	pikaframeend

PikaPicAnimBGFrames_Mood1Happy5_1:
	pikaframesleep                                 10
	pikaframe PikaAnimTilemap_Mood1Happy5_1_0,      3
	pikaframesleep                                  3
	pikaframe PikaAnimTilemap_Mood1Happy5_1_0,      3
	pikaframesleep                                100
	pikaframeend

PikaPicAnimBGFrames_CaughtPokemon_1:
	pikaframesleep                                  3
	pikaframe PikaAnimTilemap_CaughtPokemon_1_0,  100
	pikaframesleep                                  8
	pikaframe PikaAnimTilemap_CaughtPokemon_1_0,    8
	pikaframeend

PikaPicAnimBGFrames_Mood2Happy7_1:
	pikaframe PikaAnimTilemap_Mood2Happy7_1_0,      6
	pikaframesleep                                  6
	pikaframe PikaAnimTilemap_Mood2Happy7_1_0,      6
	pikaframesleep                                  6
	pikaframeend

PikaPicAnimBGFrames_Mood3Happy7_1:
	pikaframesleep                                  8
	pikaframe PikaAnimTilemap_Mood3Happy7_1_0,     12
	pikaframesleep                                  8
	pikaframe PikaAnimTilemap_Mood3Happy7_1_0,     12
	pikaframeend

PikaPicAnimBGFrames_FishingRod_1:
	pikaframesleep                                  8
	pikaframe PikaAnimTilemap_CaughtPokemon_0_0,    8
	pikaframesleep                                  8
	pikaframe PikaAnimTilemap_CaughtPokemon_0_0,    8
	pikaframesleep                                  8
	pikaframe PikaAnimTilemap_CaughtPokemon_0_0,    8
	pikaframesleep                                  8
	pikaframe PikaAnimTilemap_CaughtPokemon_0_0,  100
	pikaframeend

PikaPicAnimBGFrames_LavenderTown_1:
	pikaframesleep                                  2
	pikaframe PikaAnimTilemap_LavenderTown_1_0,     2
	pikaframesleep                                  2
	pikaframe PikaAnimTilemap_LavenderTown_1_0,     2
	pikaframesleep                                  2
	pikaframe PikaAnimTilemap_LavenderTown_1_0,     2
	pikaframesleep                                  2
	pikaframe PikaAnimTilemap_LavenderTown_1_0,     2
	pikaframesleep                                100
	pikaframeend

PikaPicAnimBGFrames_LavenderTown_2:
	pikaframesleep                                 16
	pikaframe PikaAnimTilemap_LavenderTown_1_0,     2
	pikaframe PikaAnimTilemap_FishingRod_1_1,       2
	pikaframe PikaAnimTilemap_LavenderTown_1_0,     2
	pikaframe PikaAnimTilemap_FishingRod_1_1,     100
	pikaframeend

PikaPicAnimBGFrames_BillFirstTime_1:
	pikaframesleep                                 16
	pikaframe PikaAnimTilemap_BillFirstTime_1_0,   16
	pikaframesleep                                 16
	pikaframe PikaAnimTilemap_BillFirstTime_1_0,   16
	pikaframeend

PikaPicAnimBGFrames_Burned_1:
	pikaframesleep                                  6
	pikaframe PikaAnimTilemap_Burned_1_0,           6
	pikaframesleep                                  6
	pikaframe PikaAnimTilemap_Burned_1_0,           6
	pikaframesleep                                100
	pikaframeend

PikaPicAnimBGFrames_ThunderBolt_1:
	pikaframesleep                                  6
	pikaframe PikaAnimTilemap_CaughtPokemon_0_0,    6
	pikaframe PikaAnimTilemap_FishingRod_1_1,     100
	pikaframeend

PikaPicAnimBGFrames_PewterWake_1:
	pikaframesleep                                 20
	pikaframe PikaAnimTilemap_CaughtPokemon_0_0,    8
	pikaframesleep                                 20
	pikaframe PikaAnimTilemap_CaughtPokemon_0_0,    8
	pikaframe PikaAnimTilemap_FishingRod_1_1,       8
	pikaframe PikaAnimTilemap_FishingRod_1_2,     100
	pikaframeend

PikaPicAnimBGFrames_BillEnterTeleporter_1:
	pikaframesleep                                  4
	pikaframe PikaAnimTilemap_CaughtPokemon_0_0,  100
	pikaframeend

PikaPicAnimBGFrames_Statused_1:
	pikaframesleep                                  4
	pikaframe PikaAnimTilemap_CaughtPokemon_0_0,    4
	pikaframesleep                                  4
	pikaframe PikaAnimTilemap_CaughtPokemon_0_0,    4
	pikaframesleep                                  4
	pikaframe PikaAnimTilemap_CaughtPokemon_0_0,    4
	pikaframe PikaAnimTilemap_FishingRod_1_1,       4
	pikaframe PikaAnimTilemap_FishingRod_1_2,     100
	pikaframeend
