PokemonTower1Script:
	call EnableAutoTextBoxDrawing
	ret

PokemonTower1TextPointers:
	dw PokemonTower1Text1
	dw PokemonTower1Text2
	dw PokemonTower1Text3
	dw PokemonTower1Text4
	dw PokemonTower1Text5

PokemonTower1Text1:
	TX_MARKOV _PokemonTower1Text1
	db "@"

PokemonTower1Text2:
	TX_MARKOV _PokemonTower1Text2
	db "@"

PokemonTower1Text3:
	TX_MARKOV _PokemonTower1Text3
	db "@"

PokemonTower1Text4:
	TX_MARKOV _PokemonTower1Text4
	db "@"

PokemonTower1Text5:
	TX_MARKOV _PokemonTower1Text5
	db "@"
