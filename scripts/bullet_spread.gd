extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var b = preload("res://bullet.tscn")

var type = "circle"

var pos = Vector2(0,0)

func set_pos(vec):
	pos = vec
# Called when the node enters the scene tree for the first time.
func _ready():
	if type == "circle":
		circle_spawn(pos.x, pos.y)

func circle_spawn(x,y):
#	print("here")
#	print(x,y)
	var count = 9
	var radius = 100.0
	var center = Vector2(x, y)

# Get how much of an angle objects will be spaced around the circle.
# Angles are in radians so 2.0*PI = 360 degrees
	var angle_step = 2.0*PI / count

	var angle = 0
# For each node to spawn
	for i in range(0, count):
		var direction = Vector2(cos(angle), sin(angle))
		var pos = center + direction * radius
		var node = b.instance()
		node.init(direction, 100, pos)
		get_parent().add_child(node)

	# Rotate one step
		angle += angle_step
