extends CharacterBody2D


const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var horizontalDirection = Input.get_axis("move_player_left", "move_player_right")
	var verticalDirection = Input.get_axis("move_player_up", "move_player_down")
	
	if horizontalDirection:
		velocity.x = horizontalDirection * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 50)
	
	if verticalDirection:
		velocity.y = verticalDirection * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, 50)

	if horizontalDirection != 0 || verticalDirection != 0:
		velocity = velocity.normalized() * SPEED
	move_and_slide()
