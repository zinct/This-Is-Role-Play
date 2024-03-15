extends Node 

@onready var sprite_2d = $"../AnimatedSprite2D"

var latestDirection = Vector2.ZERO

func _ready():
	sprite_2d.animation = "idle_right"

func _process(delta):
	var horizontalDirection = Input.get_axis("move_player_left", "move_player_right")
	var verticalDirection = Input.get_axis("move_player_up", "move_player_down")
	
	if(horizontalDirection > 0):
		sprite_2d.animation = "running_right"
		latestDirection = Vector2.RIGHT
	elif(horizontalDirection < 0):
		sprite_2d.animation = "running_left"
		latestDirection = Vector2.LEFT
	elif(verticalDirection > 0):
		sprite_2d.animation = "running_bottom"
		latestDirection = Vector2.DOWN
	elif(verticalDirection < 0):
		sprite_2d.animation = "running_top"
		latestDirection = Vector2.UP
	else :
		_idleDirection()
	
	

func _idleDirection():
	if(latestDirection == Vector2.RIGHT):
		sprite_2d.animation = "idle_right"
	elif(latestDirection == Vector2.LEFT):
		sprite_2d.animation = "idle_left"
	elif(latestDirection == Vector2.UP):
		sprite_2d.animation = "idle_top"
	elif(latestDirection == Vector2.DOWN):
		sprite_2d.animation = "idle_bottom"
	else:
		sprite_2d.animation = "idle_right"
