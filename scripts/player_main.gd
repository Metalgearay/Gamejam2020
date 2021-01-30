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
	move_direction.y = (int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))/float(2))
	var motion = move_direction.normalized() * speed
	move_and_slide(motion)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_loop()
