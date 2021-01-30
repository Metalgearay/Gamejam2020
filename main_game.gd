extends Node2D
var b = preload("res://bullet_spread.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var bullet = b.instance()
	bullet.spawn(0,0)
	add_child(bullet)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
