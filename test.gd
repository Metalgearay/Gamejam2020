extends Node2D
var bullet = get_node("Bullet").instance()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	bullet.init("DIG_UR", 10)
	get_parent().add_child(bullet)
