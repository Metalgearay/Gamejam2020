extends KinematicBody2D
var pattern = preload("res://bullet_spread.tscn")
onready var patrol_points = get_node("path_points")
var points
var velocity

var timer
func set_velocity(vec):
	velocity = vec
	return move_and_slide(vec) 
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	timer.set_wait_time(1)
	timer.connect("timeout", self, "_on_timer_timeout")
	add_child(timer)
	timer.start()
	# spawn code here

func _physics_process(delta):
	#movement code here
	move_and_slide(velocity)
	pass

func _on_timer_timeout():
	var p = pattern.instance()
	add_child(p)
	p.spawn(position.x, position.y)

