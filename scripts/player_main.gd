extends KinematicBody2D
export var speed = 400
var direction
var launched = {"up":false, "right":false, "down": false, "left":false}
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal eject(pod_name)
var move_direction = Vector2(0,0)
export var health = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func jetteson():
	var pod_to_eject = ""
	var log_text = get_tree().get_root().get_node("MainGame/GUI-Helper/GUI_Side/TextureRect/RichTextLabel")
	if Input.is_action_pressed("eject_up") and not launched["up"]:
		pod_to_eject = $top_capsule
		direction = Vector2(0, -1)
		log_text.append_bbcode("\n[color=#0F0]Angsty Chris ejected![/color]\n")
		launched["up"] = true
	if Input.is_action_pressed("eject_right") and not launched["right"]:
		pod_to_eject = $right_capsule
		direction = Vector2(1, 0)
		log_text.append_bbcode("\n[color=#0F0]Little Timmy ejected![/color]\n")
		launched["right"] = true
	if Input.is_action_pressed("eject_down")and not launched["down"]:
		pod_to_eject = $bot_capsule
		direction = Vector2(0, 1)
		log_text.append_bbcode("\n[color=#0F0]Little Cindy ejected![/color]\n")
		launched["down"] = true
	if Input.is_action_pressed("eject_left")and not launched["left"]:
		pod_to_eject = $left_capsule
		direction = Vector2(-1, 0)
		log_text.append_bbcode("\n[color=#0F0]Dr. Buccatelli ejected![/color]\n")
		launched["left"] = true
	if pod_to_eject:
		emit_signal("eject", pod_to_eject, direction)
func move_loop():
	#print(health)
	move_direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	move_direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	$player.set_frame(0)
	if move_direction.x > 0:
		if move_direction.y > 0:
			$player.set_frame(6)
		elif move_direction.y <0:
			$player.set_frame(5)
		else:
			$player.set_frame(4)
	elif move_direction.x < 0:
		if move_direction.y > 0:
			$player.set_frame(8)
		elif move_direction.y <0:
			$player.set_frame(7)
		else:
			$player.set_frame(3)
	else:
		if move_direction.y > 0:
			$player.set_frame(2)
		elif move_direction.y <0:
			$player.set_frame(1)
		else:
			$player.set_frame(0)
	
	var motion = move_direction.normalized() * speed
	var collide_info = move_and_slide(motion)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	move_loop()
	jetteson()
