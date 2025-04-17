extends Area2D

@export var direction: Vector2
@export var speed: int = 300


func _process(delta: float) -> void:
	position += direction * delta * speed

func _on_screen_notifier_screen_exited() -> void:
	call_deferred("queue_free")


func _on_body_entered(body: Node2D) -> void:
	# TODO: This needs to change
	get_tree().quit()


func _on_area_entered(area: Area2D) -> void:
	call_deferred("queue_free")
