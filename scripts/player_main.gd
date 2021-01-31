extends KinematicBody2D
export var speed = 400

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var move_direction = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	move_loop()

func move_loop():
	move_direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	move_direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	$main.set_frame(0)
	if move_direction.x > 0:
		if move_direction.y > 0:
			$main.set_frame(6)
		elif move_direction.y <0:
			$main.set_frame(5)
		else:
			$main.set_frame(4)
	elif move_direction.x < 0:
		if move_direction.y > 0:
			$main.set_frame(8)
		elif move_direction.y <0:
			$main.set_frame(7)
		else:
			$main.set_frame(3)
	else:
		if move_direction.y > 0:
			$main.set_frame(2)
		elif move_direction.y <0:
			$main.set_frame(1)
		else:
			$main.set_frame(0)
	
	var motion = move_direction.normalized() * speed
	move_and_slide(motion)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_loop()

