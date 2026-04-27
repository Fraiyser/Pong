extends CharacterBody2D

class_name Player

var speed = 300
var player_score = 0

func  _physics_process(delta: float) -> void:
	movement(delta)

func movement(delta: float):
	var direction = Input.get_axis("left","right")
	var get_velocity_vector = Vector2(direction, 0) * speed
	move_and_collide(get_velocity_vector * delta)
	var sizex = get_viewport_rect().size.x
	position.x = clamp(position.x, 160, sizex - 5 )
	
