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
	pos = self.position
	if pos.x > get_viewport().size.x or pos.y > get_viewport().size.y:
			state = -1
	if state == -1:
		set_process(false)
		queue_free()
		return
	pos += direction * speed * delta
	self.position = pos

func _on_area_enter(area):
	print("here")
