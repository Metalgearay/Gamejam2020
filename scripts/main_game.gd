extends Node2D
var Mob = load("res://enemy.tscn")

var just_started = true

# Called when the node enters the scene tree for the first time.
func _ready():
	_on_MobTimer_timeout()
	$MobTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if just_started:
		_on_MobTimer_timeout()
		just_started = false

func _on_MobTimer_timeout():
	print("time out")
	# Create a Mob instance and add it to the scene.
	var mob = Mob.instance()
	mob.position =  Vector2(rand_range(100,600),-100)
	mob.set_direction(Vector2(0,100))
	get_parent().add_child(mob)
