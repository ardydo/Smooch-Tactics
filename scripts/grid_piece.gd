extends Control

onready var spr_destaque = $center/sprites/destaque

func _ready():
	destaque()

func destaque():
	var a = spr_destaque.visible
	spr_destaque.visible = !a