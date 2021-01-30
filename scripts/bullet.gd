extends KinematicBody2D
var speed = 0
var direction = "s"
var move_direction = Vector2(0,0)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func init(input_direction, input_speed, pos):
	speed = input_speed
	direction = input_direction
	move_direction = pos

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	if direction == "UP":
		move_direction +=  Vector2(0,-1)
	if direction == "DOWN":
		move_direction +=  Vector2(0,1)
	if direction == "LEFT":
		move_direction +=  Vector2(-1,0)
	if direction == "RIGHT":
		move_direction +=  Vector2(1,0)
	if direction == "DIG_UR":
		move_direction +=  Vector2(0,-1)
		move_direction +=  Vector2(1,0)
	if direction == "DIG_UL":
		move_direction +=  Vector2(0,-1)
		move_direction +=  Vector2(-1,0)
	if direction == "DIG_DL":
		move_direction +=  Vector2(0,1)
		move_direction +=  Vector2(-1,0)
	if direction == "DIG_DR":
		move_direction +=  Vector2(0,1)
		move_direction +=  Vector2(1,0)
	move_and_slide(move_direction.normalized() * speed)
	 
