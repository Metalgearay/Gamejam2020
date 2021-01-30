extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var b = preload("res://bullet.tscn")
func spawn(x,y):
	circle_spawn(x,y)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func circle_spawn(x,y):
	print("here")
	print(x,y)
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
		if count <= 4:
			node.init("LEFT", 400, pos)
		if count <= 8:
			node.init("UP", 400, pos)
		if count <= 13:
			node.init("RIGHT", 400, pos)
		add_child(node)

	# Rotate one step
	angle += angle_step
