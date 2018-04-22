extends "hideable.gd"

func _ready():
	to_hide = $center/sprites/destaque
	toggle_hide()