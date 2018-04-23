extends Control

func _input(event):
	if Input.is_action_just_pressed("ui_select"):
		global.next_stage()