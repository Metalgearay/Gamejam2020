extends KinematicBody2D
var speed = 0

var direction = Vector2(0,0)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func init(input_direction, input_speed):
	speed = input_speed
	direction = input_direction.normalized()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	# check if otuside and kill
	var x_pos = get_global_position().x
	if x_pos < 0 or x_pos > 900:
		get_parent().remove_child(self)
	else:
		move_and_slide(direction * speed)
	 
