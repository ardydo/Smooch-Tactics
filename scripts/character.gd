extends Node2D

enum THOUGHTS {
	KISS
	DRINK
	}

onready var sp_penso = $pensamento/spr_pensamento
onready var beijar = load("res://assets/coração.png")
onready var beber = load("res://assets/drink.png")

onready var drink = load("res://objects/drink.tscn")
onready var hand1 = $hand1
onready var hand2 = $hand2
var drinking = false
var smoochable = false
var drinkID

func _ready():
	print(hand1)
	print(hand2)
	add_to_group("characters")

func give_drink():
	if not drinking:
		var a = drink.instance()
		a.set_position(hand1.get_position())
		add_child(a)
		drinking = true
		drinkID = a

func _process(delta):
	if smoochable:
		think(KISS)

func think(a):
	sp_penso.visible = true
	if a == KISS:
		sp_penso.texture = beijar
	elif a == DRINK:
		sp_penso.texture = beber
	else:
		sp_penso.visible = false