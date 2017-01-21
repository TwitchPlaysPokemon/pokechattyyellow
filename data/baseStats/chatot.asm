db DEX_CHATOT ; pokedex id
db 76 ; base hp
db 65 ; base attack
db 45 ; base defense
db 91 ; base speed
db 92 ; base special
db NORMAL ; species type 1
db FLYING ; species type 2
db 30 ; catch rate
db 107 ; base exp yield
INCBIN "pic/ymon/chatot.pic", 0,1 ; 66, sprite dimensions
dw ChatotPicFront
dw ChatotPicBack
; attacks known at lvl 0
db PECK
db 0
db 0
db 0
db 3 ; growth rate
; learnset
	tmlearn 2, 4,6
	tmlearn 32
	tmlearn 35, 36,39
	tmlearn 43, 44
	tmlearn 50, 52
db 0 ; padding
