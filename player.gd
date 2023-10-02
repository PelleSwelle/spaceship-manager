extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.

func _physics_process(delta):
	# Add the gravity.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var horizontal = Input.get_axis("ui_left", "ui_right")
	var vertical = Input.get_axis("ui_up", "ui_down")
	
	if horizontal or vertical:
		sprite.play('run')
		velocity.x = horizontal * SPEED
		velocity.y = vertical * SPEED
	else:
		sprite.play('idle')
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
