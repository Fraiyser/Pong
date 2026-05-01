extends Control


@onready var menu_container = $Main_panel/VBoxContainer
@onready var settings_conteiner = $Main_panel/ModeContainer2
@onready var set_text = $Main_panel/ModeContainer2/Label
@onready var back_button = $Back
@onready var toggle_difficulty = $Main_panel/ModeContainer2/CheckButton

func _ready() -> void:
	if Global.enemy_speed == 1000:
		toggle_difficulty.button_pressed = true
		toggle_difficulty.text = "difficulty mode: Hard"
	else:
		toggle_difficulty.button_pressed = false
		toggle_difficulty.text = "difficulty mode: Easy"


func _on_settings_pressed() -> void:
	menu_container.hide()
	settings_conteiner.show()
	back_button.show()

func _on_six_pressed() -> void:
	Global.score_limit = 6
	set_text.text = ("match first to seted on " + str(Global.score_limit))


func _on_twelve_pressed() -> void:
	Global.score_limit = 12
	set_text.text = ("match first to seted on " + str(Global.score_limit))


func _on_sixteen_pressed() -> void:
	Global.score_limit = 16
	set_text.text = ("match first to seted on " + str(Global.score_limit))


func _on_back_pressed() -> void:
	menu_container.show()
	settings_conteiner.hide()
	back_button.hide()


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		Global.enemy_speed = 1000
		toggle_difficulty.text = ("difficulty mode: Hard")
	else:
		Global.enemy_speed = 500
		toggle_difficulty.text = ("difficulty mode: Easy")



func _on_exit_pressed() -> void:
	get_tree().quit()
