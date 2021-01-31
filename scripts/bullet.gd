extends Area2D
var speed = 0
var pos = Vector2(0,0)
var direction = Vector2(0,0)
var state = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func init(input_direction, input_speed, input_pos):
	speed = input_speed
	direction = input_direction
	pos = input_pos
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("area_enter", self, "_on_area_enter")

func _process(delta):
	var overlapping = get_overlapping_bodies()
	for x in overlapping:
		if x.name == "Ship":
			x.health -=1
			state = -1
		elif "capsule" in x.name:
			x.get_parent().health -=1
			state = -1
			
	#pos = get_global_position()
	#if pos.x > 1500 or pos.x < -50 or pos.y >  1000 or pos.y <-50:
	#		state = -1
	if state == -1:
		get_parent().remove_child(self)
		queue_free()
		return
	pos += direction * speed * delta
	self.position = pos

func _on_area_enter(area):
	print("here")
