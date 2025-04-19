extends Area2D

@export var target_direction = Vector2.ZERO
var info: AttackerInfo

signal player_hit
signal attacker_gone

func _ready() -> void:
	set_info()
	look_at(target_direction)

func set_info() -> void:
	info = AttackerInfo.new()

	get_node("%s" % AttackerInfo.AttackerShape.keys()[info.shape]).visible = true
	get_node("%s" % AttackerInfo.AttackerShape.keys()[info.shape]).outline_color = info.color
	get_node("%sCollider" % AttackerInfo.AttackerShape.keys()[info.shape]).visible = true
	$Trail.process_material.color = info.color
	$Explosion.process_material.color = info.color
	$Explosion.process_material.initial_velocity_max = info.speed
	scale = Vector2(info.scale, info.scale)

func _process(delta: float) -> void:
	position += transform.x * delta * info.speed

func _on_screen_notifier_screen_exited() -> void:
	attacker_gone.emit()
	call_deferred("queue_free")


func _on_body_entered(body: Node2D) -> void:
	player_hit.emit()


func _on_area_entered(area: Area2D) -> void:
	get_node("%s" % AttackerInfo.AttackerShape.keys()[info.shape]).visible = false
	get_node("%sCollider" % AttackerInfo.AttackerShape.keys()[info.shape]).visible = false
	$Trail.emitting = false
	$Explosion.emitting = true
	await $Explosion.finished
	attacker_gone.emit()
	call_deferred("queue_free")
