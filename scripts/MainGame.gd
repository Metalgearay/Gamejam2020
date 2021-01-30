extends Node2D
var Mob = load("res://enemy.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$MobTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MobTimer_timeout():
	# Create a Mob instance and add it to the scene.
	var mob = Mob.instance()
	add_child(mob)
