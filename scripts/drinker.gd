extends "character.gd"

func _ready():
	add_to_group("drinker")
	think(DRINK)
	
func drunk():
	add_to_group("smoochable")
	think(KISS)