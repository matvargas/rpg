#extends KinematicBody2D
#
#export (int) var playerSpeed
#var motion = Vector2(0, 0)
#var target = Vector2(0, 0)
#
#func _ready():
#	set_process(true)
#
#func _process(delta):
#	if Input.is_action_pressed("ui_up"):
#		motion.y -= playerSpeed * delta
#	elif Input.is_action_pressed("ui_down"):
#		motion.y += playerSpeed * delta
#	elif Input.is_action_pressed("ui_left"):
#		motion.x -= playerSpeed * delta
#	elif Input.is_action_pressed("ui_right"):
#		motion.x += playerSpeed * delta
#	else:
#		motion.x = 0
#		motion.y = 0
#
#	motion = move_and_slide(motion)

extends KinematicBody2D

export (int) var speed = 200

var target = Vector2()
var velocity = Vector2()

func _input(event):
	if event.is_action_pressed('click'):
		target = get_global_mouse_position()

func _physics_process(delta):
	velocity = (target - position).normalized() * speed
	# rotation = velocity.angle()
	if (target - position).length() > 5:
		velocity = move_and_slide(velocity)
