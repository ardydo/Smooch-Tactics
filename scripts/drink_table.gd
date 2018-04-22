extends Sprite

onready var drink_area = $drink_area

func _ready():
	drink_area.connect("area_entered", self, "drink")

func drink(target):
	print("drinks on me!")
	print(target)
	var a = target.get_parent().get_parent()	
	
	if a.is_in_group("characters"):
		a.give_drink()