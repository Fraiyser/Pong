extends CharacterBody2D

class_name Ball

signal game_ended

@onready var player: Player = $"../player"
@onready var enemy: AI = $"../player2"
@onready var score = get_tree().get_first_node_in_group("score")


var velocity_ball = Vector2(100,100)
var max_speed = 700
var score_first_to = Global.score_limit

func  _ready() -> void:
	score.text = ("Get ready, it's FT " + str(score_first_to) + " match" + "\n" + "Press ESC to main menu")
	score.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	get_tree().paused = true
	await  get_tree().create_timer(3).timeout
	get_tree().paused = false

func _physics_process(delta: float) -> void:
	score.text = str(player.player_score) + "-" + str(enemy.ai_score)
	score.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	move_and_collide(velocity_ball * delta)
	var sizex = get_viewport_rect().size.x
	var sizey = get_viewport_rect().size.y
	if position.x <= 0 or position.x >= sizex :
		velocity_ball.x = - velocity_ball.x
	if position.y <= 0:
		player.player_score +=1
		if player.player_score >= score_first_to:
			score.text = ("YOU WON!!!")
			game_ended.emit()
			return
		get_tree().paused = true
		score.text = ("YOU SCORED")
		await get_tree().create_timer(1.5).timeout
		score.text = str(player.player_score) + "-" + str(enemy.ai_score)
		score.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		get_tree().paused = false
		global_position = Vector2(get_viewport_rect().size.x /2,  get_viewport_rect().size.y /2)
		velocity_ball = Vector2(100,100)
	elif position.y >= sizey:
		enemy.ai_score +=1
		if enemy.ai_score >= score_first_to:
			score.text = ("AI WON!!!")
			game_ended.emit()
			return
		get_tree().paused = true
		score.text = ("AI SCORED")
		await get_tree().create_timer(1.5).timeout
		score.text = str(player.player_score) + "-" + str(enemy.ai_score)
		score.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		get_tree().paused = false
		global_position = Vector2(get_viewport_rect().size.x /2,  get_viewport_rect().size.y /2)
		velocity_ball = Vector2(-100,-100)
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


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
