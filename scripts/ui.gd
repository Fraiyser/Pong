extends Control
 
class_name UI

@onready var score_text = $CanvasLayer/score
@onready var ball: Ball = get_tree().get_first_node_in_group("ball")
@onready var end_container = $CanvasLayer/end_conteiner

func  _ready() -> void:
	ball.game_ended.connect(_on_game_ended)

func _on_game_ended():
	ball.velocity_ball = Vector2(0,0)
	await  get_tree().create_timer(1).timeout
	end_container.show()
	get_tree().paused = true


func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
