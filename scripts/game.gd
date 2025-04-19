extends Node2D

@onready var hud: Control = $HUD

func _on_spawner_player_hit() -> void:
	SceneManager.change_scene("res://scenes/start_menu.tscn")

func _on_spawner_attacker_gone() -> void:
	pass # Replace with function body.
