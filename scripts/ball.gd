extends CharacterBody2D

class_name Ball


@onready var manager: Score_Manager = get_tree(). get_first_node_in_group("score_manager")
@onready var player: Player = $"../player"
@onready var enemy: AI = $"../player2"
@onready var score = get_tree().get_first_node_in_group("score")


var max_speed = 700
var velocity_ball = Vector2(100,100)

func _ready() -> void:
	position = Vector2(get_viewport_rect().size.x /2, get_viewport_rect().size.y /2)


func _physics_process(delta: float) -> void:
	move_and_collide(velocity_ball * delta)
	var sizex = get_viewport_rect().size.x
	if position.x <= 0 or position.x >= sizex :
		velocity_ball.x = - velocity_ball.x
	

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("puddle"):
		velocity_ball.y = - velocity_ball.y
		if velocity_ball.y < 0:
			velocity_ball.y -= 30
		elif  velocity_ball.y > 0:
			velocity_ball.y += 30
		if velocity_ball.y > max_speed:
			velocity_ball.y = max_speed
		elif velocity_ball.y < -max_speed:
			velocity_ball.y = -max_speed 


func set_velocity_ball(new_velocity: Vector2):
	velocity_ball = new_velocity
