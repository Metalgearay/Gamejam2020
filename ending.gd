extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var lapsed = 0


func _ready():
	lapsed = 0
	$ending_log/RichTextLabel.visible_characters = 0
	var ship = get_tree().get_root().get_node("MainGame/Ship")
	var launched = ship.launched
	var health = ship.health
	
	var ending_text = "[color=#0f0]\nYou lost: \n\n      "
	var num_lost = 0
	if launched["up"]:
		num_lost += 1
		ending_text += "Angsty Chris, "
	if launched["down"]:
		num_lost += 1
		ending_text += "Dr. Buccatelli, "

	if launched["left"]:
		num_lost += 1
		ending_text += "Little Cindy, "

	if launched["right"]:
		num_lost += 1
		ending_text += "Little Timmy, "

	
	if num_lost == 0:
		ending_text += "No one!"
	if num_lost == 4 and health == 0:
		ending_text = "[color=#0f0]\nYou lost:\n\n      Everything."
	
	if health > 0:
		ending_text += "\n\nYou found:\n\n      A new home."
	else:
		ending_text += "\n\nYou found:\n\n      Nothing."
	ending_text += "[/color]"
	
	get_tree().get_root().get_node("ending/ending_log/RichTextLabel").append_bbcode(ending_text)
	
func _physics_process(delta):
	lapsed += 5*delta
	$ending_log/RichTextLabel.visible_characters = lapsed/0.1

# Called every frame. 'delta' is the elapsed time since the previous frame.

