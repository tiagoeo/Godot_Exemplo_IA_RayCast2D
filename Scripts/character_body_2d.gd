extends CharacterBody2D

@onready var raycast := get_node("RayCast2D")
const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var direction := -1

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if raycast.is_colliding():
		direction = -direction
		#raycast.target_position.x = direction*50
		scale.x = -scale.x

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
