extends Control

var os = OS.get_name()

var STAGES = [
	"res://scenes/room1.tscn"
	]
var stage = -1

# reload scene
func reload():
	get_tree().reload_current_scene()

func _ready():
	set_process_input(true)
	if os != "Html5":
		OS.set_window_maximized(true)

func _input(event):
	# quit
	if event.is_action_pressed("ui_quit"):
		get_tree().quit()
	# restart
	if event.is_action_pressed("ui_restart"):
		reload()

# changes scene faster and with debug
func go(a):
	print("changing screen to " + str(a))
	get_tree().change_scene(a)
func next_stage():
	stage += 1
	var a = stage
	print(a)
	go(STAGES[a])