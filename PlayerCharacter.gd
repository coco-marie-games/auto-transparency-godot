extends KinematicBody2D

const SPEED = 80

var velocity = Vector2.ZERO
var facing = "down"

onready var animatedSprite = $AnimatedSprite

func _physics_process(_delta):
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if velocity != Vector2.ZERO:
		if velocity.x > 0:
			facing = "right"
		elif velocity.x < 0:
			facing = "left"
		if velocity.y > 0:
			facing = "down"
		elif velocity.y < 0:
			facing = "up"
		
		animatedSprite.animation = "walk_" + facing
		
		velocity = velocity.normalized()
		move_and_slide(velocity * SPEED)
	else:
		animatedSprite.animation = "idle_" + facing
	
	$AnimatedSprite.play()
