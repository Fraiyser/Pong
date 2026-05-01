extends Node2D

class_name Score_Manager

signal player_scored(score_player: int, ai_scored: int)
signal ai_scored(score_player: int, ai_scored: int)
signal game_ended

var score_first_to = Global.score_limit
var is_game_ended = false

@onready var player:Player = get_tree().get_first_node_in_group("player")
@onready var ai:AI = get_tree().get_first_node_in_group("ai")
@onready var ball:Ball = get_tree().get_first_node_in_group("ball")
@onready var score = get_tree().get_first_node_in_group("score")
@onready var size_y = get_viewport_rect().size.y
@onready var size_x = get_viewport_rect().size.x

func _process(_delta: float) -> void:
	score_manager()

func score_manager():
	if ball.position.y >= size_y:
		ai.ai_score +=1
		ai_scored.emit(player.player_score, ai.ai_score)
		check_victory()
		ball_reset()
		ball.set_velocity_ball(Vector2(-100, -100))
		print(ball.velocity_ball)

	elif ball.position.y <=0:
		player.player_score +=1
		player_scored.emit(player.player_score, ai.ai_score)
		check_victory()
		ball_reset()
		ball.set_velocity_ball(Vector2(100, 100))
		print(ball.velocity_ball)


func ball_reset():
	if is_game_ended:  
		return
	ball.global_position = Vector2(size_x/2, size_y/2)
	


func check_victory():
	if ai.ai_score >= score_first_to or player.player_score >= score_first_to:
		is_game_ended = true
		game_ended.emit()
