extends KinematicBody2D

export (int) var playerSpeed
var motion = Vector2(0, 0)

func _ready():
	set_process(true)
	
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		motion.y -= playerSpeed * delta
	elif Input.is_action_pressed("ui_down"):
		motion.y += playerSpeed * delta
	elif Input.is_action_pressed("ui_left"):
		motion.x -= playerSpeed * delta
	elif Input.is_action_pressed("ui_right"):
		motion.x += playerSpeed * delta
	else:
		motion.x = 0
		motion.y = 0
	
	motion = move_and_slide(motion)
