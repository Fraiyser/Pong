extends Control
 
class_name UI

@onready var score_text = $CanvasLayer/score
@onready var ball: Ball = get_tree().get_first_node_in_group("ball")
@onready var end_container = $CanvasLayer/end_conteiner
@onready var manager:Score_Manager = get_tree().get_first_node_in_group("score_manager")
@onready var player:Player = get_tree().get_first_node_in_group("player")
@onready var ai:AI = get_tree().get_first_node_in_group("ai")
var is_game_ended: bool = false


func _on_game_ended():
	is_game_ended = true
	get_tree().paused = true
	if ai.ai_score < player.player_score:
		score_text.text = "You Won!!!"
	elif ai.ai_score > player.player_score: 
		score_text.text = "You Lost!!!"
	get_tree().paused = true
	await get_tree().create_timer(2).timeout
	end_container.show()

func  _ready() -> void:
	manager.game_ended.connect(_on_game_ended)
	manager.player_scored.connect(on_player_scored)
	manager.ai_scored.connect(on_ai_scored)
	score_text.text = ("get ready, it is FT " + str(manager.score_first_to) + " match")
	score_text.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	get_tree().paused = true
	await  get_tree().create_timer(3).timeout
	get_tree().paused = false
	score_text.text = (str(player.player_score)+ "-" + str(ai.ai_score))
	


	

func on_player_scored(score_player: int, score_ai: int):
	if is_game_ended:
		return
	score_text.text = ("You scored")
	score_text.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	get_tree().paused = true
	await get_tree().create_timer(1.50).timeout
	get_tree().paused = false
	score_text.text = (str(score_player)+ "-" + str(score_ai))


func on_ai_scored(score_player: int, score_ai: int):
	if is_game_ended:
		return
	score_text.text = ("ai scored")
	score_text.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	get_tree().paused = true
	await get_tree().create_timer(1.50).timeout
	get_tree().paused = false
	score_text.text = (str(score_player)+ "-" + str(score_ai))

func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
