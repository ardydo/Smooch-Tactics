extends Node2D

# directions enuns
enum DIRECTIONS {
	RIGHT,
	LEFT,
	UP,
	DOWN
	}

# collision variables
## storing raycasts
onready var RRight = $RayRight
onready var RLeft = $RayLeft
onready var RUp = $RayUp
onready var RDown = $RayDown
## an array for easier manipulaton
onready var rays = [RRight, RLeft, RUp, RDown]
## pair array to test if it can move
## I prolly could joint then some way but this is something for another day
var canMove = [false, false, false, false]

## distance to walk
var dist = 16
## direction to walk
var direction = 0

func _ready():
	# enabling the raycasts
	for item in rays:
		item.enabled = true
		print(item.enabled)
	
	# connecting the signal to move to move in sync with the game
	# signalManager.connect("step", self, "move")

func _input(event):
	# key storing
	var l = Input.is_action_just_pressed("ui_left")
	var r = Input.is_action_just_pressed("ui_right")
	var u = Input.is_action_just_pressed("ui_up")
	var d = Input.is_action_just_pressed("ui_down")
	
	# only acting if a movement key was pressed
	if l or r or u or d:
		if l:
			direction = LEFT
		if r:
			direction = RIGHT
		if u:
			direction = UP
		if d:
			direction = DOWN
		
		move()
		
		# emitting the signal to move
		# signalManager.emit_signal("step")

func move():
	var dir = direction
	# move availability test
	for item in rays:
		var pos = rays.find(item)
		if item.is_colliding():
			canMove[pos] = false
		else:
			canMove[pos] = true
	
	print("moving!")
	# rotating
	# rotate(dir)
	# can I move?
	var safe = canMove[dir]
	# if I can then check where to
	if safe:
		var d
		match dir:
			LEFT:
				d = Vector2(-dist,0)
			RIGHT:
				d = Vector2(dist,0)
			UP:
				d = Vector2(0,-dist)
			DOWN:
				d = Vector2(0,dist)
		# actually moving
		translate(d)
	
	# else cause the apropriate damage
	# else:
		# damage()

# rotating
func rotate(dir):
	# offset to look at
	var offset = 1
	# actual point to look at
	var t
	# determinating the point to look at
	match dir:
		RIGHT:
			t = Vector2(offset,0)
		LEFT:
			t = Vector2(-offset,0)
		UP:
			t = Vector2(0,-offset)
		DOWN:
			t = Vector2(0,offset)
	
	print(t)
	# looking at it
	$Sprites.look_at(to_global(t))
		
func damage():
	print("ouchies")