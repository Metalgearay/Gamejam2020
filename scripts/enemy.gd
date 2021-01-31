extends KinematicBody2D
var pattern = preload("res://bullet_spread.tscn")
#onready var patrol_points = get_node("path_points")
var points
var direction = Vector2(0,0)
var speed = 100
var exit_side = "Right"

var timer
func set_direction(vec):
	direction = vec.normalized()
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	timer.set_wait_time(1)
	timer.connect("timeout", self, "_on_timer_timeout")
	add_child(timer)
	timer.start()
	
	if position.x > 400:
		exit_side = "Left"
		
func _physics_process(delta):
	if position.y > 0:
		if exit_side == "Right":	
			direction = direction.move_toward(Vector2(1,0),0.006)
		else:
			direction = direction.move_toward(Vector2(-1,0),0.006)
	move_and_slide(direction * speed)

	

func _on_timer_timeout():
	var p = pattern.instance()
	add_child(p)
	p.set_pos(position)

