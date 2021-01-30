extends KinematicBody2D
var pattern = preload("res://bullet_spread.tscn").instance()
onready var patrol_points = get_node("path_points")
var points
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func set_dir(vec):
	return move_and_slide(vec) 
# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.connect("timeout", self, "_on_timer_timeout")
	add_child(timer)
	timer.start()
	# spawn code here
func _physics_process(delta):
	#movement code here
	pass

func _on_timer_timeout():
	add_child(pattern)
	pattern.spawn(position.x, position.y)

