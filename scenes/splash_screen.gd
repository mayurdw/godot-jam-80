extends Control


func _on_timer_timeout() -> void:
	SceneManager.change_scene("res://scenes/start_menu.tscn")
