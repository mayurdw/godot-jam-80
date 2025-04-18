extends Control

@onready var start: TextureButton = $Panel/CenterContainer/VBoxContainer/MarginContainer/HBoxContainer/Start
@onready var exit: TextureButton = $Panel/CenterContainer/VBoxContainer/MarginContainer/HBoxContainer/Exit


func _on_start_button_up() -> void:
	SceneManager.change_scene("res://scenes/game.tscn")

func _on_exit_button_up() -> void:
	get_tree().quit()
