; yellow has its own format.

; entry = trainerclass, trainerid, moveset+, 0
; moveset = partymon location, partymon's move, moveid

SpecialTrainerMoves:
	db YOUNGSTER,$4
	db 1,1,BUBBLEBEAM
	db 1,3,THUNDERBOLT
	db 2,1,MEGA_DRAIN
	db 2,2,TOXIC
	db 2,3,REST
	db 2,4,DOUBLE_TEAM
	db 3,1,COUNTER
	db 3,4,FIRE_BLAST
	db 0
	
	db YOUNGSTER,$5
	db 1,1,BODY_SLAM
	db 1,2,REFLECT
	db 1,3,RAGE
	db 1,4,BLIZZARD
	db 2,1,SUBMISSION
	db 3,1,SUBSTITUTE
	db 0

	db YOUNGSTER,$7
	db 1,1,THUNDER
	db 1,2,BLIZZARD
	db 1,3,TOXIC
	db 1,4,REST
	db 2,1,SKULL_BASH
	db 2,3,DIG
	db 3,1,RAGE
	db 3,2,SWIFT
	db 0
	
	db YOUNGSTER,$0e
	db 1,1,FLY
	db 1,2,DOUBLE_TEAM
	db 2,1,ROCK_SLIDE
	db 2,2,SUBSTITUTE
	db 0

	db BUG_CATCHER,$2
	db 1,1,TACKLE
	db 2,1,POISON_STING
	db 0

	db BUG_CATCHER,$5
	db 2,1,POISON_STING
	db 4,1,TACKLE
	db 0

	db BUG_CATCHER,$7	
	db 2,1,POISON_STING
	db 3,2,POISON_STING
	db 3,3,SWORDS_DANCE
	db 0

	db BUG_CATCHER,$8	
	db 2,1,TACKLE
	db 3,3,SOLARBEAM
	db 0

	db BUG_CATCHER,$9	
	db 1,1,TACKLE
	db 2,1,POISON_STING
	db 3,1,PSYCHIC_M
	db 3,2,DOUBLE_TEAM
	db 3,3,REST
	db 0
	
	db BUG_CATCHER,$0a
	db 2,1,POISON_STING
	db 3,2,SWORDS_DANCE
	db 3,3,CUT
	db 0

	db BUG_CATCHER,$0b
	db 2,1,TACKLE
	db 3,2,SEISMIC_TOSS
	db 0
	
	db BUG_CATCHER,$0d
	db 1,3,PSYWAVE
	db 1,4,SOLARBEAM
	db 2,1,SWIFT
	db 2,2,SWORDS_DANCE
	db 2,4,STRING_SHOT
	db 0
	
	db BUG_CATCHER,$0e
	db 1,2,SWIFT
	db 1,3,SWORDS_DANCE
	db 2,1,SOLARBEAM
	db 2,2,DIG
	db 2,3,CUT
	db 2,4,SWORDS_DANCE
	db 0
	
	db BUG_CATCHER,$0f
	db 1,3,REFLECT
	db 2,2,SWORDS_DANCE
	db 3,2,RAGE
	db 0
		
	db LASS,$8
	db 1,1,FLY
	db 2,1,BUBBLEBEAM
	db 3,2,HORN_DRILL
	db 0
	
	db LASS,$0b
	db 1,1,SOLARBEAM
	db 1,2,ICE_BEAM
	db 1,3,PSYCHIC_M
	db 0

	db LASS,$0d
	db 2,1,BUBBLEBEAM
	db 0

	db LASS,$0e
	db 1,2,STRENGTH
	db 2,1,SOLARBEAM
	db 2,2,BUBBLEBEAM
	db 2,3,PSYWAVE
	db 2,4,$fe
	db 0
	
	db LASS,$10
	db 1,2,$fe
	db 2,2,$fe
	db 0
	
	db JR_TRAINER_M, $2
	db 1,3,ROCK_SLIDE
	db 2,1,TAKE_DOWN
	db 3,1,WATER_GUN
	db 3,4,SOLARBEAM
	db 0
	
	db JR_TRAINER_F,$1
	db 1,1,BUBBLEBEAM
	db 1,2,MEGA_PUNCH
	db 2,1,WATER_GUN
	db 2,3,PSYWAVE
	db 3,1,WATER_GUN
	db 3,3,REFLECT
	db 3,4,THUNDER_WAVE
	db 4,1,MIMIC
	db 4,2,REST
	db 4,3,SEISMIC_TOSS
	db 0
	
	db JR_TRAINER_F,$5
	db 1,2,TAKE_DOWN
	db 2,1,BUBBLEBEAM
	db 2,2,ICE_BEAM
	db 3,1,STRENGTH
	db 3,2,DRAGON_RAGE
	db 3,3,DIG
	db 0

	db JR_TRAINER_F,$7
	db 1,1,STRENGTH
	db 1,3,FIRE_BLAST
	db 2,1,SING
	db 2,3,BODY_SLAM
	db 0 
	
	db JR_TRAINER_F,$8
	db 1,2,SOLARBEAM
	db 2,1,SKULL_BASH
	db 2,2,DIG
	db 2,3,SWORDS_DANCE
	db 3,1,SWORDS_DANCE
	db 3,2,CUT
	db 0

	db JR_TRAINER_F,$0b
	db 1,1,RAZOR_LEAF
	db 1,2,GROWTH
	db 1,3,$fe
	db 1,4,$fe
	db 2,1,MEGA_DRAIN
	db 2,2,GROWTH
	db 2,3,$fe
	db 2,4,$fe
	db 0

	db JR_TRAINER_F,$0c
	db 1,1,FIRE_BLAST
	db 1,3,HORN_DRILL
	db 2,1,DOUBLE_EDGE
	db 3,2,SWORDS_DANCE
	db 0

	db JR_TRAINER_F,$0d
	db 1,3,PSYCHIC_M
	db 2,1,SURF
	db 2,2,ICE_BEAM
	db 3,1,FLAMETHROWER
	db 3,2,FIRE_SPIN
	db 3,3,TAKE_DOWN
	db 3,4,$fe
	db 0

	db JR_TRAINER_F,$0e
	db 1,1,BODY_SLAM
	db 1,2,SURF
	db 2,1,TAKE_DOWN
	db 2,2,THUNDER
	db 2,3,$fe
	db 2,4,$fe
	db 3,3,SLAM
	db 3,4,MEGA_DRAIN
	db 0

	db JR_TRAINER_F,$0f
	db 1,1,SURF
	db 1,3,THUNDER
	db 2,1,SOLARBEAM
	db 2,2,LEECH_SEED
	db 3,2,BLIZZARD
	db 0
	
	db JR_TRAINER_F,$10
	db 1,1,SURF
	db 0

	db JR_TRAINER_F,$11
	db 1,1,FLY
	db 1,2,TOXIC
	db 1,3,SUBSTITUTE
	db 1,4,REFLECT
	db 2,1,FLY
	db 2,2,TOXIC
	db 2,3,SUBSTITUTE
	db 2,4,REFLECT
	db 3,1,FLY
	db 3,2,TOXIC
	db 3,3,SUBSTITUTE
	db 0 
	
	db JR_TRAINER_F,$14
	db 1,1,DOUBLE_EDGE
	db 1,2,FIRE_BLAST
	db 1,3,THUNDERBOLT
	db 1,4,PSYCHIC_M
	db 0

	db JR_TRAINER_F,$15
	db 1,1,SUBMISSION
	db 1,3,SEISMIC_TOSS
	db 2,1,SURF
	db 2,2,ICE_BEAM
	db 2,3,DIG
	db 2,4,$fe
	db 3,1,PSYCHIC_M
	db 3,2,SOLARBEAM
	db 3,3,STRING_SHOT
	db 3,4,$fe
	db 0

	db JR_TRAINER_F,$16
	db 1,2,MEGA_KICK
	db 0

	db JR_TRAINER_F,$17
	db 1,1,PETAL_DANCE
	db 1,2,ACID
	db 1,3,SLEEP_POWDER
	db 1,4,SWORDS_DANCE
	db 2,1,POISONPOWDER
	db 2,2,DOUBLE_EDGE
	db 2,3,DOUBLE_TEAM
	db 2,4,REST
	db 3,1,ACID
	db 3,2,STUN_SPORE
	db 3,3,TAKE_DOWN
	db 3,4,$fe
	db 0

	db JR_TRAINER_F,$18
	db 1,1,SURF
	db 2,1,DOUBLE_TEAM
	db 2,4,SURF
	db 0

	db JR_TRAINER_F,$19
	db 1,2,TRI_ATTACK
	db 1,3,FIRE_BLAST
	db 2,1,DRAGON_RAGE
	db 3,1,MEGA_DRAIN
	db 3,2,TAKE_DOWN
	db 0
	
	db POKEMANIAC,$2
	db 1,4,SUBMISSION
	db 2,1,DISABLE
	db 2,2,PSYCHIC_M
	db 2,3,BUBBLEBEAM
	db 2,4,TRI_ATTACK
	db 3,2,FIRE_BLAST
	db 0

	db POKEMANIAC,$5
	db 1,2,SWIFT
	db 2,1,ICE_BEAM
	db 0

	db POKEMANIAC,$6
	db 2,1,SUBMISSION
	db 2,2,SKULL_BASH
	db 3,1,PSYCHIC_M
	db 4,1,SURF
	db 4,3,ICE_BEAM
	db 0

	db POKEMANIAC,$7
	db 1,1,PSYCHIC_M
	db 2,2,DRAGON_RAGE
	db 2,3,THUNDERBOLT
	db 3,1,REST
	db 3,3,TOXIC
	db 0
	
	db SUPER_NERD,$2
	db 1,1,SELFDESTRUCT
	db 2,4,DOUBLE_TEAM
	db 0

	db SUPER_NERD,$3
	db 1,1,FLASH
	db 2,1,ICE_BEAM
	db 2,2,$fe
	db 2,4,$fe
	db 0
	
	db SUPER_NERD,$5
	db 1,1,SELFDESTRUCT
	db 1,2,$fe
	db 1,3,$fe
	db 1,4,$fe
	db 2,1,TOXIC
	db 2,2,SONICBOOM
	db 2,3,REST
	db 2,4,$fe
	db 0
	
	db SUPER_NERD,$9
	db 1,1,FIRE_BLAST
	db 1,2,TAKE_DOWN
	db 1,3,QUICK_ATTACK
	db 1,4,BIDE
	db 0

	db SUPER_NERD,$0a
	db 1,1,FLAMETHROWER
	db 1,2,DIG
	db 1,3,DRAGON_RAGE
	db 0

	db SUPER_NERD,$0b
	db 1,1,BODY_SLAM
	db 1,3,HYPER_BEAM
	db 1,4,HORN_DRILL
	db 0

	db SUPER_NERD,$0c
	db 1,1,HORN_DRILL
	db 2,1,HORN_DRILL
	db 2,3,BODY_SLAM
	db 3,1,HORN_DRILL
	db 3,3,DOUBLE_EDGE
	db 0

	db HIKER,$2
	db 1,1,MEGA_PUNCH
	db 1,2,COUNTER
	db 2,1,BIDE
	db 2,2,REST
	db 3,1,FLY
	db 3,2,TOXIC
	db 4,1,ROCK_SLIDE
	db 4,2,DOUBLE_TEAM
	db 0
	
	db HIKER,$3
	db 1,1,SELFDESTRUCT
	db 2,3,SWIFT
	db 3,1,RAZOR_WIND
	db 3,3,SWORDS_DANCE
	db 3,4,REST
	db 0
	
	db HIKER,$4
	db 1,2,SKULL_BASH
	db 2,1,THUNDER
	db 2,2,HORN_DRILL
	db 0
	
	db HIKER,$6
	db 1,1,MEGA_PUNCH
	db 0

	db HIKER,$0b
	db 1,1,SUBMISSION
	db 1,2,MEGA_KICK
	db 1,3,ROCK_SLIDE
	db 1,4,METRONOME
	db 2,4,DIG
	db 0

	db HIKER,$0c
	db 1,1,SEISMIC_TOSS
	db 1,2,EARTHQUAKE
	db 1,3,STRENGTH
	db 2,1,FIRE_BLAST
	db 2,4,ROCK_SLIDE
	db 3,1,RAGE
	db 3,4,METRONOME
	db 0

	db HIKER,$0d
	db 1,1,FISSURE
	db 1,2,EARTHQUAKE
	db 1,3,BODY_SLAM
	db 1,4,DOUBLE_TEAM
	db 2,1,FISSURE
	db 2,2,EARTHQUAKE
	db 2,3,BODY_SLAM
	db 2,4,SAND_ATTACK
	db 3,1,FISSURE
	db 3,2,EARTHQUAKE
	db 3,3,BODY_SLAM
	db 3,4,DOUBLE_TEAM
	db 4,1,FISSURE
	db 4,2,ROCK_SLIDE
	db 0
	
	db HIKER,$0e
	db 1,1,ICE_BEAM
	db 0
	
	db BIKER,$1
	db 1,1,SUBMISSION
	db 1,3,EARTHQUAKE
	db 2,1,SURF
	db 0

	db BIKER,$2
	db 1,1,STRENGTH
	db 1,2,SUBMISSION
	db 1,3,BIDE
	db 1,4,$fe
	db 2,1,SKULL_BASH
	db 2,3,THUNDERBOLT
	db 2,4,$fe
	db 3,1,BUBBLEBEAM
	db 3,2,TAKE_DOWN
	db 3,3,COUNTER
	db 3,4,PSYWAVE
	db 0

	db BIKER,$3
	db 1,1,ROCK_SLIDE
	db 2,2,SURF
	db 2,3,THUNDERBOLT
	db 2,4,$fe
	db 0

	db BIKER,$4
	db 1,1,FIRE_PUNCH
	db 1,2,$fe
	db 1,3,$fe
	db 1,4,$fe
	db 0

	db BIKER,$7
	db 1,1,EARTHQUAKE
	db 1,2,DOUBLE_EDGE
	db 1,3,$fe
	db 1,4,$fe
	db 0

	db BIKER,$7
	db 1,1,SWORDS_DANCE
	db 1,2,DOUBLE_EDGE
	db 1,3,PIN_MISSILE
	db 1,4,AGILITY
	db 0

	db BIKER,$0b
	db 1,1,SURF
	db 1,2,SKULL_BASH
	db 1,3,$fe
	db 1,4,$fe
	db 2,1,ROCK_SLIDE
	db 3,1,FIRE_BLAST
	db 3,2,DRAGON_RAGE
	db 3,3,$fe
	db 0

	db BIKER,$0c
	db 1,1,DRAGON_RAGE
	db 1,2,FLAMETHROWER
	db 1,3,SLASH
	db 1,4,$fe
	db 2,1,SLASH
	db 2,2,SAND_ATTACK
	db 2,3,SUBMISSION
	db 2,4,$fe
	db 3,1,SURF
	db 3,2,ICE_BEAM
	db 3,3,$fe
	db 3,4,$fe
	db 0

	db BIKER,$0d
	db 1,1,SOLARBEAM
	db 1,3,BODY_SLAM
	db 1,4,REFLECT
	db 0

	db BIKER,$0e
	db 1,1,MIMIC
	db 2,1,THUNDER
	db 2,4,SUBMISSION
	db 3,1,TAKE_DOWN
	db 3,2,DIG
	db 3,3,DRAGON_RAGE
	db 3,4,$fe
	db 0

	db BIKER,$0f
	db 1,1,DOUBLE_EDGE
	db 1,4,ROCK_SLIDE
	db 2,1,BUBBLEBEAM
	db 2,2,THUNDER_WAVE
	db 3,1,THUNDERBOLT
	db 3,4,TAKE_DOWN
	db 0
	
	db BURGLAR,$4
	db 1,1,COUNTER
	db 1,2,DIG
	db 2,1,SWORDS_DANCE
	db 2,3,DIG
	db 2,4,SUBMISSION
	db 0

	db BURGLAR,$6
	db 1,1,DIG
	db 1,3,BODY_SLAM
	db 2,1,DOUBLE_EDGE
	db 2,2,REFLECT
	db 0

	db BURGLAR,$7
	db 1,1,EARTHQUAKE
	db 2,2,SWORDS_DANCE
	db 3,4,FIRE_BLAST
	db 0

	db BURGLAR,$8
	db 1,1,FIRE_BLAST
	db 2,1,PSYCHIC_M
	db 2,2,EXPLOSION
	db 3,1,EARTHQUAKE
	db 3,4,DOUBLE_EDGE
	db 0

	db BURGLAR,$9
	db 1,2,FIRE_BLAST
	db 1,3,THUNDER
	db 2,1,DOUBLE_EDGE
	db 2,3,REST
	db 2,4,DOUBLE_TEAM
	db 3,1,PSYWAVE
	db 3,2,SOLARBEAM
	db 0

	db FISHER,$3
	db 1,1,HYDRO_PUMP
	db 1,2,$fe
	db 0

	db FISHER,$4
	db 1,1,HYPNOSIS
	db 1,2,SURF
	db 1,3,$fe
	db 1,4,$fe
	db 2,1,BUBBLEBEAM
	db 2,2,REST
	db 2,3,$fe
	db 2,4,$fe
	db 3,1,SUBMISSION
	db 3,2,ICE_BEAM
	db 3,3,$fe
	db 3,4,$fe
	db 0

	db FISHER,$6
	db 1,3,BUBBLEBEAM
	db 2,2,SELFDESTRUCT
	db 3,1,SURF
	db 3,2,TAKE_DOWN
	db 3,3,$fe
	db 3,4,$fe
	db 4,1,BUBBLEBEAM
	db 4,3,REST
	db 4,4,$fe
	db 0
	
	db FISHER,$7
	db 1,1,SURF
	db 2,1,DOUBLE_EDGE
	db 2,2,BLIZZARD
	db 3,1,DOUBLE_EDGE
	db 0

	db FISHER,$8
	db 1,2,REFLECT
	db 1,3,TRI_ATTACK
	db 0

	db FISHER,$9
	db 1,2,HYDRO_PUMP
	db 2,2,HYDRO_PUMP
	db 3,2,HYDRO_PUMP
	db 4,2,HYDRO_PUMP
	db 5,2,HYDRO_PUMP
	db 6,2,HYDRO_PUMP
	db 0

	db FISHER,$0b
	db 1,1,SURF
	db 1,2,DOUBLE_EDGE
	db 1,4,$fe
	db 2,1,TAKE_DOWN
	db 2,2,ACID
	db 3,1,BUBBLEBEAM
	db 3,2,THUNDERBOLT
	db 0

	db SWIMMER,$2
	db 1,1,SURF
	db 1,2,PSYCHIC_M
	db 1,3,$fe
	db 1,4,$fe
	db 2,1,SURF
	db 2,2,BLIZZARD
	db 2,3,EXPLOSION
	db 2,4,$fe
	db 0

	db SWIMMER,$3
	db 1,1,HYDRO_PUMP
	db 1,2,BLIZZARD
	db 1,3,COUNTER
	db 1,4,$fe
	db 0

	db SWIMMER,$5
	db 1,1,SURF
	db 1,2,$fe
	db 1,3,$fe
	db 1,4,$fe
	db 2,1,BUBBLEBEAM
	db 2,2,ICE_BEAM
	db 2,3,MEGA_DRAIN
	db 2,4,$fe
	db 0

	db SWIMMER,$8
	db 1,1,BUBBLEBEAM
	db 1,2,THUNDERBOLT
	db 1,3,PSYCHIC_M
	db 1,4,$fe
	db 2,1,SURF
	db 2,2,ICE_BEAM
	db 2,3,$fe
	db 2,4,$fe
	db 0

	db SWIMMER,$9
	db 1,1,BLIZZARD
	db 1,2,DOUBLE_EDGE
	db 1,3,AGILITY
	db 1,4,$fe
	db 2,1,FISSURE
	db 2,2,SUBMISSION
	db 2,3,SKULL_BASH
	db 2,4,$fe
	db 0

	db SWIMMER,$0a
	db 1,1,COUNTER
	db 1,2,BLIZZARD
	db 2,2,MEGA_KICK
	db 2,3,SUBMISSION
	db 2,4,DIG
	db 3,2,HORN_DRILL
	db 0

	db SWIMMER,$0b
	db 1,1,SURF
	db 1,2,SUBMISSION
	db 1,3,EARTHQUAKE
	db 1,4,PSYCHIC_M
	db 0

	db SWIMMER,$0c
	db 1,1,SKULL_BASH
	db 1,2,ICE_BEAM
	db 2,1,MEGA_DRAIN
	db 2,3,MIMIC
	db 0
	
	db SWIMMER,$0d
	db 1,1,SURF
	db 1,2,MINIMIZE
	db 1,3,RECOVER
	db 0

	db SWIMMER,$0e
	db 1,1,REST
	db 1,2,TAKE_DOWN
	db 0

	db SWIMMER,$0f
	db 1,2,BODY_SLAM
	db 1,4,$fe
	db 2,3,MEGA_KICK
	db 3,2,SURF
	db 4,1,ICE_BEAM
	db 4,2,DIG
	db 0
	
	db CUE_BALL,$1
	db 1,1,THUNDER
	db 1,2,$fe
	db 1,3,$fe
	db 1,4,$fe
	db 2,1,BLIZZARD
	db 2,2,$fe
	db 2,3,$fe
	db 2,4,$fe
	db 0
	
	db CUE_BALL,$3
	db 1,1,PSYWAVE
	db 1,2,MINIMIZE
	db 1,3,SOFTBOILED
	db 1,4,SING
	db 0
	
	db CUE_BALL,$4
	db 1,1,BLIZZARD
	db 1,3,$fe
	db 1,4,$fe
	db 0

	db CUE_BALL,$7
	db 1,1,TOXIC
	db 1,2,SWORDS_DANCE
	db 1,3,SLASH
	db 1,4,DOUBLE_TEAM
	db 2,1,VICEGRIP
	db 2,2,SEISMIC_TOSS
	db 2,3,GUILLOTINE
	db 2,4,SWORDS_DANCE
	db 0
	
	db CUE_BALL,$9
	db 1,1,BLIZZARD
	db 1,3,THUNDER
	db 2,1,THUNDERBOLT
	db 2,2,SEISMIC_TOSS
	db 2,3,BODY_SLAM
	db 3,1,SUBMISSION
	db 3,2,ROCK_SLIDE
	db 4,2,FIRE_BLAST
	db 0
	
	db GAMBLER,$2
	db 1,1,METRONOME
	db 1,2,$fe
	db 1,3,$fe
	db 1,4,$fe
	db 2,1,METRONOME
	db 2,2,$fe
	db 2,3,$fe
	db 2,4,$fe
	db 3,1,METRONOME
	db 3,2,$fe
	db 3,3,$fe
	db 3,4,$fe
	db 0
	
	db GAMBLER,$3
	db 1,1,HORN_DRILL
	db 1,2,AGILITY
	db 1,3,THUNDER_WAVE
	db 1,4,$fe
	db 2,1,FISSURE
	db 2,2,$fe
	db 2,3,$fe
	db 2,4,$fe
	db 0
	
	db GAMBLER,$4
	db 1,1,BIDE
	db 1,2,$fe
	db 1,3,$fe
	db 1,4,$fe
	db 2,1,BIDE
	db 2,2,$fe
	db 2,3,$fe
	db 2,4,$fe
	db 3,1,BIDE
	db 3,2,$fe
	db 3,3,$fe
	db 3,4,$fe
	db 0

	db GAMBLER,$5
	db 1,1,BIDE
	db 1,2,$fe
	db 1,3,$fe
	db 1,4,$fe
	db 2,1,BIDE
	db 2,2,$fe
	db 2,3,$fe
	db 2,4,$fe
	db 3,1,BIDE
	db 3,2,$fe
	db 3,3,$fe
	db 3,4,$fe
	db 0

	db GAMBLER,$7
	db 1,1,TAKE_DOWN
	db 1,2,DIG
	db 1,3,$fe
	db 2,3,DRAGON_RAGE
	db 3,1,DRAGON_RAGE
	db 3,2,MEGA_PUNCH
	db 3,3,COUNTER
	db 3,4,$fe
	db 0
	
	db BEAUTY,$1
	db 1,1,DOUBLE_EDGE
	db 1,2,DIG
	db 2,1,EGG_BOMB
	db 2,2,REFLECT
	db 2,3,LEECH_SEED
	db 2,4,STUN_SPORE
	db 0

	db BEAUTY,$3
	db 1,3,LEECH_SEED
	db 0
	
	db BEAUTY,$5
	db 1,3,THUNDERBOLT
	db 1,4,$fe
	db 0

	db BEAUTY,$6
	db 1,1,DOUBLE_EDGE
	db 1,2,SURF
	db 2,1,SWORDS_DANCE
	db 2,2,DOUBLE_EDGE
	db 0

	db BEAUTY,$7
	db 1,1,DOUBLE_EDGE
	db 1,2,FLY
	db 0

	db BEAUTY,$8
	db 1,2,SOLARBEAM
	db 1,3,PSYCHIC_M
	db 1,4,SLEEP_POWDER
	db 0

	db BEAUTY,$0a
	db 1,1,PSYWAVE
	db 1,2,BUBBLEBEAM
	db 1,4,$fe
	db 0

	db BEAUTY,$0c
	db 1,1,BUBBLEBEAM
	db 0

	db BEAUTY,$0e
	db 1,1,PSYCHIC_M
	db 1,2,THUNDERBOLT
	db 1,3,$fe
	db 1,4,$fe
	db 0

	db BEAUTY,$0f
	db 1,1,SURF
	db 1,2,DRAGON_RAGE
	db 1,3,FIRE_BLAST
	db 1,4,AGILITY
	db 0
	
	db PSYCHIC_TR,$1
	db 1,1,PSYCHIC_M
	db 1,2,DREAM_EATER
	db 1,3,PSYWAVE
	db 1,4,HYPNOSIS
	db 2,1,PSYCHIC_M
	db 2,2,SURF
	db 2,3,FIRE_BLAST
	db 2,4,AMNESIA
	db 3,1,PSYCHIC_M
	db 3,2,SOLARBEAM
	db 3,3,EGG_BOMB
	db 3,4,STUN_SPORE
	db 0

	db PSYCHIC_TR,$2
	db 1,1,METRONOME
	db 1,2,$fe
	db 1,3,$fe
	db 1,4,$fe
	db 2,1,METRONOME
	db 2,2,$fe
	db 2,3,$fe
	db 2,4,$fe
	db 0

	db PSYCHIC_TR,$3
	db 1,1,DREAM_EATER
	db 1,2,HYPNOSIS
	db 1,4,PSYWAVE
	db 2,1,SURF
	db 2,2,FIRE_BLAST
	db 3,2,EGG_BOMB
	db 3,4,PSYCHIC_M
	db 0

	db PSYCHIC_TR,$4
	db 1,1,METRONOME
	db 1,2,$fe
	db 1,3,$fe
	db 1,4,$fe
	db 2,1,METRONOME
	db 2,2,$fe
	db 2,3,$fe
	db 2,4,$fe
	db 0
	
	db ROCKER,$2
	db 1,1,THUNDERBOLT
	db 2,1,THUNDERBOLT
	db 2,2,HYPER_BEAM
	db 2,4,$fe
	db 0
	
	db JUGGLER,$2
	db 1,1,SEISMIC_TOSS
	db 1,2,PSYWAVE
	db 1,3,$fe
	db 1,4,$fe
	db 2,1,PSYWAVE
	db 2,2,$fe
	db 2,3,$fe
	db 2,4,$fe
	db 3,1,SEISMIC_TOSS
	db 3,2,PSYWAVE
	db 3,3,$fe
	db 3,4,$fe
	db 4,1,HORN_DRILL
	db 4,2,AGILITY
	db 4,3,$fe
	db 4,4,$fe
	db 0

	db JUGGLER,$3
	db 1,1,THUNDERBOLT
	db 1,2,ICE_BEAM
	db 1,3,BUBBLEBEAM
	db 1,4,$fe
	db 2,1,BODY_SLAM
	db 2,2,HORN_DRILL
	db 2,3,SURF
	db 2,4,$fe
	db 0

	db JUGGLER,$4
	db 1,1,SKULL_BASH
	db 1,2,$fe
	db 1,3,$fe
	db 1,4,$fe
	db 2,1,BODY_SLAM
	db 2,2,BLIZZARD
	db 2,3,DOUBLE_KICK
	db 2,4,TAIL_WHIP
	db 0

	db JUGGLER,$5
	db 1,1,BIDE
	db 1,2,$fe
	db 1,3,$fe
	db 1,4,$fe
	db 2,1,BIDE
	db 2,2,$fe
	db 2,3,$fe
	db 2,4,$fe
	db 3,1,BIDE
	db 3,2,$fe
	db 3,3,$fe
	db 3,4,$fe
	db 0

	db JUGGLER,$8
	db 1,1,BODY_SLAM
	db 1,2,HORN_DRILL
	db 1,3,$fe
	db 1,4,$fe
	db 2,1,SLUDGE
	db 2,2,MINIMIZE
	db 2,3,POISON_GAS
	db 2,4,FIRE_BLAST
	db 3,1,SOLARBEAM
	db 3,2,PSYBEAM
	db 3,3,SLEEP_POWDER
	db 3,4,$fe
	db 4,1,THUNDERBOLT
	db 5,1,TOXIC
	db 5,2,SELFDESTRUCT
	db 5,3,DOUBLE_TEAM
	db 5,4,SUBSTITUTE
	db 6,1,BLIZZARD
	db 6,2,BIDE
	db 6,3,$fe
	db 6,4,$fe
	db 0
	
	db TAMER,$1
	db 1,1,EARTHQUAKE
	db 2,1,TWINEEDLE
	db 2,2,TAKE_DOWN
	db 2,3,PIN_MISSILE
	db 2,4,AGILITY
	db 3,1,ACID
	db 3,2,ROCK_SLIDE
	db 0

	db TAMER,$2
	db 1,1,BODY_SLAM
	db 1,2,LEECH_SEED
	db 2,1,SUBSTITUTE
	db 3,1,ACID
	db 3,2,SUBSTITUTE
	db 3,3,SLEEP_POWDER
	db 3,4,SOLARBEAM
	db 4,1,ACID
	db 4,2,REST
	db 4,3,STUN_SPORE
	db 4,4,MEGA_DRAIN
	db 5,1,GROWTH  
	db 6,1,TAKE_DOWN
	db 6,2,POISONPOWDER
	db 6,3,REFLECT
	db 6,4,$fe
	db 0
	
	db TAMER,$3
	db 1,1,EARTHQUAKE
	db 1,2,ROCK_SLIDE
	db 1,3,$fe
	db 1,4,$fe
	db 2,1,MEGA_KICK
	db 2,2,SUBMISSION
	db 2,3,EARTHQUAKE
	db 2,4,$fe
	db 0

	db TAMER,$4
	db 1,1,EARTHQUAKE
	db 2,1,EARTHQUAKE
	db 2,2,HORN_DRILL
	db 2,3,$fe
	db 0

	db TAMER,$5
	db 1,1,BIDE
	db 1,2,BUBBLEBEAM
	db 1,3,THUNDERBOLT
	db 1,4,SLASH
	db 2,1,HYDRO_PUMP
	db 2,2,SEISMIC_TOSS
	db 2,3,MEGA_KICK
	db 2,4,DISABLE
	db 3,1,ROCK_SLIDE
	db 3,2,MEGA_PUNCH
	db 3,3,EARTHQUAKE
	db 3,4,EXPLOSION
	db 0

	db BIRD_KEEPER,$1
	db 1,1,DOUBLE_EDGE
	db 2,2,SWORDS_DANCE
	db 3,1,HYPER_BEAM
	db 3,2,SUBSTITUTE
	db 0

	db BIRD_KEEPER,$2
	db 1,1,PSYCHIC_M
	db 1,2,SOLARBEAM
	db 1,3,SLEEP_POWDER
	db 1,4,$fe
	db 2,1,FLY
	db 0

	db BIRD_KEEPER,$3
	db 1,1,RAZOR_WIND
	db 1,2,WATER_GUN
	db 1,3,$fe
	db 1,4,$fe
	db 0

	db BIRD_KEEPER,$5
	db 1,1,DOUBLE_EDGE
	db 2,1,FLY
	db 2,2,TAKE_DOWN
	db 2,4,TOXIC
	db 0

	db BIRD_KEEPER,$6
	db 1,1,FLY
	db 1,2,TOXIC
	db 1,3,SUBSTITUTE
	db 1,4,$fe
	db 0

	db BIRD_KEEPER,$7
	db 1,1,DRILL_PECK
	db 1,2,DOUBLE_EDGE
	db 1,3,SKY_ATTACK
	db 1,4,$fe
	db 0

	db BIRD_KEEPER,$9
	db 1,1,FLY
	db 0

	db BIRD_KEEPER,$0a
	db 1,1,DOUBLE_EDGE
	db 1,2,FLY
	db 1,3,QUICK_ATTACK
	db 1,4,$fe
	db 2,1,DRILL_PECK
	db 2,2,FLY
	db 2,3,TRI_ATTACK
	db 2,4,AGILITY
	db 3,1,SWIFT
	db 0

	db BIRD_KEEPER,$0b
	db 1,1,SKY_ATTACK
	db 0

	db BIRD_KEEPER,$0f
	db 1,1,HYDRO_PUMP
	db 1,2,$fe
	db 0

	db BLACKBELT,$2
	db 1,1,SUBMISSION
	db 1,2,DIG
	db 1,3,COUNTER
	db 1,4,$fe
	db 0

	db BLACKBELT,$3
	db 1,1,SUBMISSION
	db 1,2,THRASH
	db 1,3,SEISMIC_TOSS
	db 2,1,SUBMISSION
	db 2,2,THRASH
	db 2,3,SEISMIC_TOSS
	db 0

	db BLACKBELT,$4
	db 1,1,SUBMISSION
	db 1,2,MEGA_PUNCH
	db 1,3,FIRE_BLAST
	db 1,4,FISSURE
	db 0

	db BLACKBELT,$5
	db 1,1,SUBMISSION
	db 1,2,SEISMIC_TOSS
	db 1,3,ROCK_SLIDE
	db 1,4,LEER
	db 3,1,SUBMISSION
	db 3,2,SKULL_BASH
	db 3,3,RAGE
	db 3,4,$fe
	db 0

	db BLACKBELT,$7
	db 1,1,EARTHQUAKE
	db 1,2,FIRE_BLAST
	db 1,3,SUBMISSION
	db 1,4,$fe
	db 0

	db BLACKBELT,$8
	db 1,1,MEGA_KICK
	db 1,2,SUBMISSION
	db 1,3,DIG
	db 1,4,COUNTER
	db 2,1,SUBMISSION
	db 2,2,COUNTER
	db 3,1,SUBMISSION
	db 0

	db BLACKBELT,$9
	db 1,1,DOUBLE_EDGE
	db 2,1,DOUBLE_EDGE
	db 2,2,SUBMISSION
	db 2,3,TOXIC
	db 3,1,SUBMISSION
	db 0

	db SONY1,$3
	db 1,3,PSYWAVE
	db 1,4,REFLECT
	db 2,1,SLASH
	db 2,2,SEISMIC_TOSS
	db 2,3,$fe
	db 3,1,METRONOME
	db 3,2,FLASH
	db 4,1,SWIFT
	db 4,2,SAND_ATTACK
	db 4,3,BIDE
	db 4,4,$fe
	db 0

	db SCIENTIST,$3
	db 1,1,BLIZZARD
	db 1,2,TOXIC
	db 1,3,FLASH
	db 1,4,REST
	db 0

	db SCIENTIST,$5
	db 1,1,SURF
	db 1,2,SLASH
	db 1,3,BIDE
	db 1,4,$fe
	db 2,1,HORN_ATTACK
	db 2,2,BLIZZARD
	db 2,3,LEER
	db 0

	db SCIENTIST,$0b
	db 1,1,PSYCHIC_M
	db 1,2,BUBBLEBEAM
	db 0

	db SCIENTIST,$0c
	db 1,1,BODY_SLAM
	db 1,3,REFLECT
	db 2,1,ICE_BEAM
	db 2,2,SUBSTITUTE
	db 0

	db SCIENTIST,$0d
	db 1,1,BODY_SLAM
	db 1,2,HORN_DRILL
	db 2,1,SUBMISSION
	db 0

	db GIOVANNI,$1
	db 1,1,THUNDERBOLT
	db 1,3,$fe
	db 2,1,BLIZZARD
	db 2,2,BUBBLEBEAM
	db 3,1,ROCK_SLIDE
	db 3,2,DOUBLE_TEAM
	db 3,4,$fe
	db 4,1,BODY_SLAM
	db 4,2,HORN_DRILL
	db 4,3,$fe
	db 4,4,$fe
	db 5,2,SURF
	db 5,4,MIMIC
	db 0

	db GIOVANNI,$2
	db 1,1,BODY_SLAM
	db 1,2,THUNDER
	db 1,3,HORN_DRILL
	db 1,4,$fe
	db 2,1,FURY_SWIPES
	db 2,2,BUBBLEBEAM
	db 2,3,BITE
	db 2,4,SCREECH
	db 3,1,THUNDERBOLT
	db 3,2,STOMP
	db 3,3,SURF
	db 3,4,FIRE_BLAST
	db 4,1,SUBMISSION
	db 5,1,BODY_SLAM
	db 5,2,EARTHQUAKE
	db 5,3,REFLECT
	db 5,4,TAIL_WHIP
	db 0

	db GIOVANNI,$3
	db 1,1,HYPER_BEAM
	db 1,2,BUBBLEBEAM
	db 1,3,THUNDERBOLT
	db 2,3,FISSURE
	db 3,1,THUNDER
	db 3,2,FISSURE
	db 3,3,HORN_DRILL
	db 3,4,BODY_SLAM
	db 4,1,SUBMISSION
	db 4,2,SURF
	db 4,3,FIRE_BLAST
	db 5,1,ROCK_SLIDE
	db 5,2,DIG
	db 5,4,BODY_SLAM
	db 6,1,EARTHQUAKE
	db 6,2,SKULL_BASH
	db 6,3,ICE_BEAM
	db 6,4,$fe
	db 0

	db ROCKET,$8
	db 1,1,PSYWAVE
	db 1,2,SEISMIC_TOSS
	db 2,1,BUBBLEBEAM
	db 2,2,$fe
	db 0

	db ROCKET,$9
	db 1,1,FIRE_BLAST
	db 1,2,REST
	db 2,1,THUNDER
	db 2,2,BLIZZARD
	db 2,4,$fe
	db 0

	db ROCKET,$0a
	db 1,1,PSYCHIC_M
	db 1,2,THUNDERSHOCK
	db 1,3,QUICK_ATTACK
	db 1,4,$fe
	db 2,1,STRENGTH
	db 2,2,LEER
	db 2,3,SUBMISSION
	db 2,4,$fe
	db 0

	db ROCKET,$0c
	db 1,1,FIRE_BLAST
	db 1,2,BIDE
	db 2,2,SWORDS_DANCE
	db 0

	db ROCKET,$0d
	db 1,1,HORN_DRILL
	db 1,2,FIRE_BLAST
	db 1,3,$fe
	db 1,4,$fe
	db 2,2,STRENGTH
	db 2,3,$fe
	db 2,4,$fe
	db 0

	db ROCKET,$0f
	db 1,1,WRAP
	db 1,2,BITE
	db 1,3,SCREECH
	db 1,4,GLARE
	db 2,1,BUBBLEBEAM
	db 2,2,PAY_DAY
	db 2,3,DISABLE
	db 2,4,$fe
	db 0

	db ROCKET,$12
	db 1,1,MEGA_KICK
	db 2,1,RAZOR_WIND
	db 2,2,RAGE
	db 2,3,$fe
	db 2,4,$fe
	db 0

	db ROCKET,$18
	db 1,1,DOUBLE_EDGE
	db 1,2,CONFUSE_RAY
	db 1,3,$fe
	db 1,4,$fe
	db 2,1,DIG
	db 0

	db ROCKET,$19
	db 1,1,SURF
	db 1,2,CONFUSION
	db 1,3,DISABLE
	db 2,1,SKULL_BASH
	db 2,2,HYPER_FANG
	db 2,3,QUICK_ATTACK
	db 2,4,DIG
	db 3,1,METRONOME
	db 0

	db ROCKET,$1a
	db 1,1,TRI_ATTACK
	db 1,2,SUBMISSION
	db 1,3,MEDITATE
	db 1,4,$fe
	db 2,1,SEISMIC_TOSS
	db 2,2,EARTHQUAKE
	db 2,3,ROCK_SLIDE
	db 2,4,$fe
	db 3,1,BODY_SLAM
	db 3,2,GUILLOTINE
	db 3,3,$fe
	db 3,4,$fe
	db 0

	db ROCKET,$1b
	db 1,1,EARTHQUAKE
	db 2,1,BODY_SLAM
	db 2,2,BUBBLEBEAM
	db 2,3,SEISMIC_TOSS
	db 2,4,HYPNOSIS
	db 3,1,RAZOR_WIND
	db 3,3,CONFUSE_RAY
	db 3,2,TAKE_DOWN
	db 3,4,$fe
	db 0

	db ROCKET,$1c
	db 1,1,TAKE_DOWN
	db 1,2,PSYWAVE
	db 1,3,COUNTER
	db 1,4,AMNESIA
	db 0

	db ROCKET,$1e
	db 1,1,SUBMISSION
	db 1,2,EARTHQUAKE
	db 1,3,MEGA_KICK
	db 1,4,SEISMIC_TOSS
	db 2,1,DRAGON_RAGE
	db 2,2,TAKE_DOWN
	db 2,3,LEER
	db 2,4,$fe
	db 0

	db ROCKET,$21
	db 1,1,BODY_SLAM
	db 1,2,SURF
	db 1,3,ICE_BEAM
	db 1,4,AMNESIA
	db 2,1,MEGA_DRAIN
	db 2,2,EXPLOSION
	db 2,3,HYPNOSIS
	db 2,4,DREAM_EATER
	db 3,1,ROCK_SLIDE
	db 3,2,DIG
	db 3,3,SLASH
	db 3,4,HYPER_BEAM
	db 0

	db ROCKET,$22
	db 1,1,BODY_SLAM
	db 2,1,THUNDERBOLT
	db 2,2,SLAM
	db 2,3,FLASH
	db 0

	db ROCKET,$23
	db 1,1,PSYWAVE
	db 1,2,ICE_PUNCH
	db 1,3,$fe
	db 1,4,$fe
	db 0

	db ROCKET,$24
	db 1,1,FIRE_BLAST
	db 1,2,DRAGON_RAGE
	db 1,3,TAKE_DOWN
	db 1,4,$fe
	db 2,1,PETAL_DANCE
	db 2,2,DOUBLE_EDGE
	db 2,3,ACID
	db 2,4,STUN_SPORE
	db 3,1,BUBBLEBEAM
	db 3,2,SUBMISSION
	db 3,3,SKULL_BASH
	db 3,4,$fe
	db 0

	db ROCKET,$25
	db 1,1,STRENGTH
	db 0

	db ROCKET,$27
	db 1,1,MEGA_PUNCH
	db 1,2,THUNDERBOLT
	db 1,3,PSYWAVE
	db 0

	db ROCKET,$29
	db 1,1,SURF
	db 1,2,TOXIC
	db 1,3,REST
	db 1,4,$fe
	db 2,2,MEGA_KICK
	db 3,1,FISSURE
	db 3,2,THUNDER
	db 3,3,$fe
	db 3,4,$fe
	db 0

	db ROCKET,$2a
	db 1,1,MEGA_DRAIN
	db 1,2,SUBSTITUTE
	db 1,3,SKULL_BASH
	db 2,1,SMOG
	db 2,2,DOUBLE_TEAM
	db 2,3,REST
	db 3,1,PAY_DAY
	db 3,2,WATER_GUN
	db 0

	db ROCKET,$2b
	db 1,1,TAKE_DOWN
	db 1,2,BUBBLEBEAM
	db 1,3,SCREECH
	db 1,4,$fe
	db 2,1,WRAP
	db 2,2,ROCK_SLIDE
	db 2,3,GLARE
	db 2,4,SCREECH
	db 3,1,THUNDERBOLT
	db 3,2,REST
	db 0

	db ROCKET,$2c
	db 1,1,TAKE_DOWN
	db 1,2,BUBBLEBEAM
	db 1,4,$fe
	db 2,2,ROCK_SLIDE
	db 3,1,THUNDERBOLT
	db 3,2,REST
	db 0

	db ROCKET,$2d
	db 1,1,FIRE_BLAST
	db 1,2,SLUDGE
	db 1,3,SMOKESCREEN
	db 1,4,REST
	db 2,1,EARTHQUAKE
	db 2,2,ROCK_SLIDE
	db 2,3,SCREECH
	db 2,4,GLARE
	db 3,1,BUBBLEBEAM
	db 3,2,SLASH
	db 3,3,$fe
	db 3,4,$fe
	db 0

	db COOLTRAINER_M,$1
	db 1,1,BODY_SLAM
	db 1,2,THUNDER
	db 1,3,HORN_DRILL
	db 1,4,$fe
	db 2,1,BLIZZARD
	db 2,2,BUBBLEBEAM
	db 2,3,DOUBLE_EDGE
	db 2,4,$fe
	db 3,1,HYPER_BEAM
	db 3,2,LEECH_SEED
	db 3,3,SWORDS_DANCE
	db 3,4,SLEEP_POWDER
	db 0

	db COOLTRAINER_M,$2
	db 1,1,PSYCHIC_M
	db 2,3,PSYCHIC_M
	db 3,1,HYPER_BEAM
	db 3,2,DOUBLE_EDGE
	db 3,3,FISSURE
	db 3,4,BLIZZARD
	db 0

	db COOLTRAINER_M,$3
	db 1,1,SOLARBEAM
	db 2,1,ICE_BEAM
	db 2,2,EARTHQUAKE
	db 3,1,FLY
	db 0

	db COOLTRAINER_M,$5
	db 2,1,SUBMISSION
	db 2,2,COUNTER
	db 3,1,BODY_SLAM
	db 3,2,DIG
	db 4,1,METRONOME
	db 4,2,SOLARBEAM
	db 0

	db COOLTRAINER_M,$9
	db 1,1,EARTHQUAKE
	db 1,2,$fe
	db 1,3,$fe
	db 1,4,$fe
	db 0

	db COOLTRAINER_M,$0a
	db 1,1,DOUBLE_EDGE
	db 1,2,EARTHQUAKE
	db 1,3,BLIZZARD
	db 1,4,$fe
	db 0

	db COOLTRAINER_F,$2
	db 1,1,CRABHAMMER
	db 1,2,BODY_SLAM
	db 1,3,GUILLOTINE
	db 1,4,ICE_BEAM
	db 2,1,STUN_SPORE
	db 2,2,WRAP
	db 2,3,SOLARBEAM
	db 2,4,ACID
	db 3,1,FLAMETHROWER
	db 3,2,DIG
	db 3,3,TAKE_DOWN
	db 3,4,$fe
	db 0

	db COOLTRAINER_F,$3
	db 1,1,METRONOME
	db 1,2,$fe
	db 1,3,$fe
	db 1,4,$fe
	db 2,1,METRONOME
	db 2,2,$fe
	db 2,3,$fe
	db 2,4,$fe
	db 3,1,METRONOME
	db 3,2,SOFTBOILED
	db 3,3,TOXIC
	db 3,4,$fe
	db 0

	db COOLTRAINER_F,$5
	db 1,1,DRILL_PECK
	db 1,2,FLY
	db 1,3,TRI_ATTACK
	db 1,4,AGILITY
	db 2,1,THUNDER
	db 2,2,SEISMIC_TOSS
	db 2,3,DOUBLE_EDGE
	db 2,4,$fe
	db 3,1,FIRE_BLAST
	db 3,2,FIRE_SPIN
	db 3,3,HORN_DRILL
	db 3,4,AGILITY
	db 0

	db BRUNO,$1
	db 1,1,ROCK_SLIDE
	db 1,2,SCREECH
	db 1,4,DIG
	db 2,3,FIRE_PUNCH
	db 2,4,DOUBLE_TEAM
	db 3,1,METRONOME
	db 3,2,MEGA_KICK
	db 3,4,SUBSTITUTE
	db 4,1,ROCK_SLIDE
	db 5,2,KARATE_CHOP
	db 5,3,EARTHQUAKE
	db 0

	db BROCK,$1
	db 1,2,COUNTER
	db 2,3,FISSURE
	db 2,4,BIDE
	db 0

	db MISTY,$1
	db 1,1,ICE_BEAM
	db 1,2,THUNDERBOLT
	db 1,3,THUNDER_WAVE
	db 2,1,TOXIC
	db 2,2,REST
	db 2,3,BUBBLEBEAM
	db 2,4,SAND_ATTACK
	db 3,1,TRI_ATTACK
	db 3,2,BUBBLEBEAM
	db 3,3,PSYWAVE
	db 3,4,HARDEN
	db 0

	db LT_SURGE,$1
	db 1,1,THUNDER_WAVE
	db 1,2,FLASH
	db 1,3,SEISMIC_TOSS
	db 2,1,THUNDERBOLT
	db 2,2,TOXIC
	db 2,3,REFLECT
	db 2,4,REST
	db 3,1,THUNDERBOLT
	db 3,2,MEGA_PUNCH
	db 3,3,SUBMISSION
	db 3,4,SUBSTITUTE
	db 0

	db ERIKA,$1
	db 1,1,SKULL_BASH
	db 1,2,POISONPOWDER
	db 1,3,BIND
	db 1,4,SWORDS_DANCE
	db 2,1,STUN_SPORE
	db 2,3,VINE_WHIP  
	db 2,4,$fe
	db 3,1,DIG
	db 3,2,SLASH
	db 3,3,SPORE
	db 3,4,$fe
	db 4,1,ACID
	db 4,2,MEGA_DRAIN
	db 4,3,REST
	db 4,4,SLEEP_POWDER
	db 0

	db KOGA,$1
	db 1,1,RAZOR_WIND
	db 1,2,TOXIC
	db 1,3,FLASH
	db 1,4,REST
	db 2,1,SURF
	db 2,2,MEGA_DRAIN
	db 2,3,TOXIC
	db 2,4,BARRIER
	db 3,1,DOUBLE_EDGE
	db 3,2,CONFUSE_RAY
	db 3,3,DOUBLE_TEAM
	db 3,4,TOXIC
	db 4,1,SOLARBEAM
	db 4,2,TOXIC
	db 4,3,LEECH_SEED
	db 4,4,REFLECT
	db 5,1,TOXIC
	db 5,4,FIRE_BLAST
	db 0

	db BLAINE,$1
	db 1,1,FLAMETHROWER
	db 1,4,DIG
	db 2,2,SAND_ATTACK
	db 2,3,BODY_SLAM
	db 3,1,SKULL_BASH
	db 3,3,HORN_DRILL
	db 4,1,DRAGON_RAGE
	db 4,4,FLY
	db 5,1,FIRE_BLAST
	db 5,2,FLAMETHROWER
	db 5,3,DIG
	db 5,4,BITE
	db 0

	db SABRINA,$1
	db 1,1,MEGA_KICK
	db 1,3,SUBMISSION	
	db 2,1,SURF
	db 2,4,REST
	db 3,1,EGG_BOMB
	db 3,2,PSYWAVE
	db 3,3,REFLECT
	db 3,4,STUN_SPORE
	db 4,2,PSYCHIC_M
	db 4,3,SOLARBEAM
	db 4,4,THUNDERBOLT
	db 0

	db GENTLEMAN,$1
	db 1,2,FIRE_BLAST
	db 2,2,DRAGON_RAGE
	db 0

	db GENTLEMAN,$2
	db 1,1,BUBBLEBEAM
	db 1,2,TOXIC
	db 2,3,REST
	db 0

	db GENTLEMAN,$5
	db 3,1,DIG
	db 3,2,TOXIC
	db 3,3,REFLECT
	db 3,4,REST
	db 0

	db SONY2,$1
	db 1,1,EGG_BOMB
	db 1,2,HYPNOSIS
	db 1,3,REFLECT
	db 1,4,$fe
	db 2,1,SWORDS_DANCE
	db 2,2,SLASH
	db 2,3,SAND_ATTACK
	db 2,4,$fe
	db 3,1,METRONOME
	db 3,2,CONFUSION
	db 3,3,KINESIS
	db 3,4,$fe
	db 4,1,SWIFT
	db 4,2,REST
	db 4,3,SAND_ATTACK
	db 4,4,TOXIC
	db 0

	db SONY2,$2
	db 1,1,PSYBEAM
	db 1,2,METRONOME
	db 1,3,KINESIS
	db 1,4,DISABLE
	db 3,1,BODY_SLAM
	db 3,3,DIG
	db 4,1,HYPNOSIS
	db 4,2,BARRAGE
	db 4,3,MEGA_DRAIN
	db 4,4,PSYWAVE
	db 5,1,SEISMIC_TOSS
	db 5,2,SLASH
	db 5,3,SAND_ATTACK
	db 5,4,BIDE
	db 6,1,DOUBLE_KICK
	db 6,2,THUNDERBOLT
	db 6,3,QUICK_ATTACK
	db 6,4,SAND_ATTACK
	db 0

	db SONY2,$3
	db 1,1,PSYBEAM
	db 1,2,METRONOME
	db 1,3,KINESIS
	db 1,4,DISABLE
	db 2,1,FLASH
	db 2,2,SONICBOOM
	db 2,3,THUNDERBOLT
	db 2,4,SUPERSONIC
	db 4,1,HYPNOSIS
	db 4,2,BARRAGE
	db 4,3,MEGA_DRAIN
	db 4,4,PSYWAVE
	db 5,1,SEISMIC_TOSS
	db 5,2,SLASH
	db 5,3,SAND_ATTACK
	db 5,4,BIDE
	db 6,1,TOXIC
	db 6,2,SUBSTITUTE
	db 6,3,REST
	db 0

	db SONY2,$4
	db 1,1,PSYBEAM
	db 1,2,METRONOME
	db 1,3,KINESIS
	db 1,4,DISABLE
	db 2,1,BODY_SLAM
	db 2,3,DIG
	db 3,1,FLASH
	db 3,2,SONICBOOM
	db 3,3,THUNDERBOLT
	db 3,4,SUPERSONIC
	db 4,1,HYPNOSIS
	db 4,2,BARRAGE
	db 4,3,MEGA_DRAIN
	db 4,4,PSYWAVE
	db 5,1,SEISMIC_TOSS
	db 5,2,SLASH
	db 5,3,SAND_ATTACK
	db 5,4,BIDE
	db 6,1,REFLECT
	db 6,2,BIDE
	db 6,3,BUBBLEBEAM
	db 0

	db SONY2,$5
	db 1,1,ROCK_SLIDE
	db 1,2,SLASH
	db 1,3,FISSURE
	db 1,4,SWIFT
	db 2,1,FLAMETHROWER
	db 2,2,QUICK_ATTACK
	db 2,3,DIG
	db 2,4,TAIL_WHIP
	db 3,1,EGG_BOMB
	db 3,2,HYPNOSIS
	db 3,3,SOLARBEAM
	db 3,4,MIMIC
	db 5,1,METRONOME
	db 6,1,THUNDERBOLT
	db 6,2,DOUBLE_KICK
	db 6,3,TWINEEDLE
	db 6,4,BITE
	db 0

	db SONY2,$6
	db 1,1,ROCK_SLIDE
	db 1,2,SLASH
	db 1,3,FISSURE
	db 1,4,SWIFT
	db 3,1,EGG_BOMB
	db 3,2,HYPNOSIS
	db 3,3,SOLARBEAM
	db 3,4,MIMIC
	db 4,1,SONICBOOM
	db 4,2,THUNDERBOLT
	db 4,3,SUPERSONIC
	db 4,4,THUNDER_WAVE
	db 5,1,METRONOME
	db 6,1,DOUBLE_TEAM
	db 6,2,REST
	db 0

	db SONY2,$7
	db 1,1,ROCK_SLIDE
	db 1,2,SLASH
	db 1,3,FISSURE
	db 1,4,SWIFT
	db 2,1,SONICBOOM
	db 2,2,THUNDERBOLT
	db 2,3,THUNDER_WAVE
	db 2,4,SUPERSONIC
	db 3,1,EGG_BOMB
	db 3,2,HYPNOSIS
	db 3,3,SOLARBEAM
	db 3,4,MIMIC
	db 4,1,FLAMETHROWER
	db 4,2,QUICK_ATTACK
	db 4,3,DIG
	db 4,4,TAIL_WHIP
	db 5,1,METRONOME
	db 6,1,BUBBLEBEAM
	db 0

	db SONY2,$8
	db 1,2,EARTHQUAKE
	db 1,4,ROCK_SLIDE
	db 2,1,SOLARBEAM
	db 2,2,PSYWAVE
	db 2,3,EGG_BOMB
	db 2,4,LEECH_SEED
	db 3,1,FLAMETHROWER
	db 3,3,DIG
	db 3,4,TAKE_DOWN
	db 4,3,ICE_BEAM
	db 5,1,METRONOME
	db 6,1,TOXIC
	db 6,2,SUBSTITUTE
	db 6,3,SKULL_BASH
	db 0

	db SONY2,$9
	db 1,2,EARTHQUAKE
	db 1,4,ROCK_SLIDE
	db 2,1,SOLARBEAM
	db 2,2,PSYWAVE
	db 2,3,EGG_BOMB
	db 2,4,LEECH_SEED
	db 3,3,ICE_BEAM
	db 4,1,THUNDERBOLT
	db 4,4,BIDE
	db 5,1,METRONOME
	db 6,1,BODY_SLAM
	db 6,2,DOUBLE_TEAM
	db 6,3,REST
	db 0

	db SONY2,$0a
	db 1,2,EARTHQUAKE
	db 1,4,ROCK_SLIDE
	db 2,1,SOLARBEAM
	db 2,2,PSYWAVE
	db 2,3,EGG_BOMB
	db 2,4,LEECH_SEED
	db 3,1,THUNDERBOLT
	db 3,4,BIDE
	db 4,1,FLAMETHROWER
	db 4,3,DIG
	db 4,4,TAKE_DOWN
	db 5,1,METRONOME
	db 6,2,DOUBLE_EDGE
	db 0

	db SONY3,$1
	db 1,2,SWORDS_DANCE
	db 1,3,EARTHQUAKE
	db 1,4,ROCK_SLIDE
	db 2,1,KINESIS
	db 3,1,DOUBLE_EDGE
	db 3,3,PSYWAVE
	db 3,4,SOLARBEAM
	db 4,1,TOXIC
	db 4,3,BLIZZARD
	db 4,4,TRI_ATTACK
	db 5,1,CONFUSE_RAY
	db 5,3,DIG
	db 5,4,FLAMETHROWER
	db 6,1,DOUBLE_KICK
	db 6,3,HYPER_BEAM
	db 0

	db SONY3,$2
	db 1,2,SWORDS_DANCE
	db 1,3,EARTHQUAKE
	db 1,4,ROCK_SLIDE
	db 2,1,KINESIS
	db 3,1,DOUBLE_EDGE
	db 3,3,PSYWAVE
	db 3,4,SOLARBEAM
	db 4,1,THUNDERBOLT
	db 4,3,HYPER_BEAM
	db 5,1,TOXIC
	db 5,3,BLIZZARD
	db 5,4,TRI_ATTACK
	db 6,2,BODY_SLAM
	db 6,3,TOXIC
	db 0

	db SONY3,$3
	db 1,2,SWORDS_DANCE
	db 1,3,EARTHQUAKE
	db 1,4,ROCK_SLIDE
	db 2,1,KINESIS
	db 3,1,DOUBLE_EDGE
	db 3,3,PSYWAVE
	db 3,4,SOLARBEAM
	db 4,1,CONFUSE_RAY
	db 4,3,DIG
	db 4,4,FLAMETHROWER
	db 5,1,THUNDERBOLT
	db 5,3,HYPER_BEAM
	db 6,2,BLIZZARD
	db 0

	db LORELEI,$1
	db 1,1,BUBBLEBEAM
	db 2,3,ICE_BEAM
	db 3,1,PSYCHIC_M
	db 3,3,LOVELY_KISS
	db 4,1,COUNTER
	db 4,2,EARTHQUAKE
	db 5,3,BLIZZARD
	db 5,4,THUNDERBOLT
	db 0

	db CHANNELER,$18
	db 1,1,SEISMIC_TOSS
	db 1,2,MEGA_KICK
	db 1,4,$fe
	db 2,2,BLIZZARD
	db 0

	db AGATHA,$1
	db 2,2,TOXIC
	db 2,3,DOUBLE_EDGE
	db 2,4,REST
	db 3,1,BUBBLEBEAM
	db 3,4,SUBMISSION
	db 4,1,WRAP
	db 4,4,TOXIC
	db 5,2,PSYCHIC_M
	db 0

	db LANCE,$1
	db 1,1,TOXIC
	db 1,2,ICE_BEAM
	db 2,2,FIRE_BLAST
	db 2,3,THUNDERBOLT
	db 2,4,WRAP
	db 3,1,EARTHQUAKE
	db 3,4,FLY
	db 5,2,SKY_ATTACK
	db 5,3,FIRE_BLAST
	db 6,1,BLIZZARD
	db 6,2,FIRE_BLAST
	db 6,3,THUNDER
	db 0

	db $ff