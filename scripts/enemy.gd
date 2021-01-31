extends KinematicBody2D
var pattern = preload("res://bullet_spread.tscn")
#onready var patrol_points = get_node("path_points")
var points
var direction = Vector2(0,0)
var speed = 120
var exit_side = "Right"
var flag = false
var bullets_fired = false

var timer
func set_direction(vec):
	direction = vec.normalized()
# Called when the node enters the scene tree for the first time.
func _ready():
	#timer = Timer.new()
	#timer.set_wait_time(1)
	#timer.connect("timeout", self, "_on_timer_timeout")
	#timer.one_shot = true
	#add_child(timer)
	#timer.start()
	if position.x < 400:
		exit_side = "Left"
		
func _physics_process(delta):
	#if flag == false and position.x <400:
	#	move_and_slide(Vector2(0,0))
	#	var p = pattern.instance()
	#	add_child(p)
	#	p.set_pos(position)
	#	flag = true 
	if position.y > 0:
		if exit_side == "Right":	
			if direction.distance_to(Vector2(1,0)) > 0.006:
				direction = direction.move_toward(Vector2(1,0),0.006)
		else:
			if direction.distance_to(Vector2(-1,0)) > 0.006:
				direction = direction.move_toward(Vector2(-1,0),0.006)
		if not bullets_fired and position.y > 100:
			var p = pattern.instance()
			add_child(p)
			p.set_pos(position)
			bullets_fired = true
			
	move_and_slide(direction * speed)

func _process(delta):
	var pos = position
	if pos.x > get_viewport().size.x+100 or pos.x < -100:
		set_process(false)
		queue_free()
		return

func _on_timer_timeout():
	var p = pattern.instance()
	add_child(p)
	p.set_pos(position)

