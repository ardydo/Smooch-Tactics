extends "hideable.gd"

func _ready():
	to_hide = $center/Sprite
	toggle_hide()