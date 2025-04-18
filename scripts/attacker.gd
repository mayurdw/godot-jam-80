extends Area2D

@export var target_direction = Vector2.ZERO
@export var info: AttackerInfo

func _ready() -> void:
	set_info(info)
	look_at(target_direction)

func set_info(info: AttackerInfo) -> void:
	self.info = info
	get_node("%s" % AttackerInfo.AttackerShape.keys()[info.shape]).visible = true
	get_node("%s" % AttackerInfo.AttackerShape.keys()[info.shape]).outline_color = Color(info.color)
	get_node("%sCollider" % AttackerInfo.AttackerShape.keys()[info.shape]).visible = true
	scale = Vector2(info.scale, info.scale)

func _process(delta: float) -> void:
	position += transform.x * delta * info.speed

func _on_screen_notifier_screen_exited() -> void:
	call_deferred("queue_free")


func _on_body_entered(body: Node2D) -> void:
	# TODO: This needs to change
	get_tree().quit()


func _on_area_entered(area: Area2D) -> void:
	call_deferred("queue_free")
