extends Node2D
var Mob = load("res://enemy.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	$MobTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_MobTimer_timeout():
	print("time out")
	# Create a Mob instance and add it to the scene.
	var mob = Mob.instance()
	mob.position =  Vector2(rand_range(0,600),-100)
	mob.set_velocity(Vector2(0,100))
	get_parent().add_child(mob)
