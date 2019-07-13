extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -550

var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x=SPEED
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Run", false)
	elif Input.is_action_pressed("ui_left"):
		motion.x=-SPEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Run", false)
	else:
		motion.x = 0
		$AnimatedSprite.play("Idle", false)
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y=JUMP_HEIGHT
	else:
		$AnimatedSprite.play("Jump", false)
			
	motion = move_and_slide(motion, UP)
	pass
	
	
	
	
	
	
	
