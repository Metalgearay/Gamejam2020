extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var hp = get_tree().get_root().get_node("MainGame/Ship").health
	get_node("GUI_Side/Bars/health/TextureProgress").value = 10*hp
