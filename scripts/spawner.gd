extends Node

@onready var spawn_path: Path2D = $SpawnPath
@onready var spawn_location: PathFollow2D = $SpawnPath/SpawnLocation
@export var target_node: Node

var attacker : PackedScene = preload("res://scenes/attacker.tscn")

func _spawn_attacker() -> void:
	var scene = attacker.instantiate()
	spawn_location.progress_ratio = randf()

	# Set the mob's position to the random location.
	scene.position = spawn_location.position
	var inward_angle = spawn_location.rotation + PI / 2
	scene.rotation = inward_angle + randf_range( -PI / 4, PI / 4)
	scene.target_direction = target_node.global_position

	# Spawn the mob by adding it to the Main scene.
	add_child(scene)
