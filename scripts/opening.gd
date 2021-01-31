extends RichTextLabel


var lapsed = 0


func _ready():
	lapsed = 0

func _physics_process(delta):
	lapsed += 5*delta
	visible_characters = lapsed/0.1
	
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_ENTER:
			return get_tree().change_scene("res://MainGame.tscn")
			
