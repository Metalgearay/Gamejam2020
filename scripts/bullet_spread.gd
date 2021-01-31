extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bullet_origin
var b = preload("res://bullet.tscn")

var type = "circle"

var pos = Vector2(0,0)

func set_pos(vec):
	pos = vec
func set_type(s):
	type = s
# Called when the node enters the scene tree for the first time.
func _ready():
	bullet_origin = Position2D.new()
	bullet_origin.set_global_position(get_parent().position)
	get_tree().get_root().add_child(bullet_origin)
	
	if rand_range(0,1) > 0.5:
		type = "arc"
	
	if type == "circle":
		circle_spawn(pos.x, pos.y)
	if type == "arc":
		arc_spawn(pos.x, pos.y)

func circle_spawn(x,y):
#	print("here")
#	print(x,y)
	var count = 12
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
		node.init(direction, 200, center)
		bullet_origin.add_child(node)

	# Rotate one step
		angle += angle_step
		
func arc_spawn(x,y):
#	print("here")
#	print(x,y)
	var count = 4
	var radius = 100.0
	var center = Vector2(x, y)

# Get how much of an angle objects will be spaced around the circle.
# Angles are in radians so 2.0*PI = 360 degrees
	var angle_step = PI / (2 * count)

	var angle = PI/4
# For each node to spawn
	for i in range(0, count):
		var direction = Vector2(cos(angle), sin(angle))
		var pos = center + direction * radius
		var node = b.instance()
		node.init(direction, 200, center)
		bullet_origin.add_child(node)

	# Rotate one step
		angle += angle_step

