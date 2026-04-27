extends CharacterBody2D

class_name AI

var speed = Global.enemy_speed
@onready var ball : Ball = get_tree().get_first_node_in_group("ball")
var ai_score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ball:
		var direction =  global_position.direction_to(ball.global_position)
		direction.y = 0
		var get_velocity_vector = direction * speed
		move_and_collide(get_velocity_vector * delta)
	
	var sizex = get_viewport_rect().size.x
	position.x = clamp(position.x, 160, sizex - 5 )
