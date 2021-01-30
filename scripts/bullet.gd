extends KinematicBody2D
var speed = 0

var move_direction = Vector2(0,0)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func init(input_direction, input_speed):
	speed = input_speed
	move_direction = input_direction

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	move_and_slide(move_direction.normalized() * speed)
	 
