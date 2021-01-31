extends KinematicBody2D
var ejected = false
var ejecting = false
var ship_origin
var direction = Vector2(0,0)
var bounding = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func is_ejected():
	return ejected
func _process(delta):
	if ejecting == true:
		if self.position.y > -600 or self.position.y<960:
			move_and_slide(direction*400)
		else:
			ejecting = false
			self.queue_free()
			ship_origin.free()
func _on_Ship_eject(pod_name, direction_move):
	if self == pod_name:
		if ejected == false:
			ejecting = true
			ejected = true
			direction = direction_move
			ship_origin = Position2D.new()
			ship_origin.set_global_position(get_parent().position)
			get_tree().get_root().add_child(ship_origin)
			var old_parent = self.get_parent()
			old_parent.remove_child(self)
			ship_origin.add_child(self)
			self.collision_layer = 5
	
