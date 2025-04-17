extends Node

@export var attackers : Array[PackedScene]
@onready var spawn_path: Path2D = $SpawnPath
@onready var spawn_location: PathFollow2D = $SpawnPath/SpawnLocation
@export var target_position: Node2D

func _spawn_attacker() -> void:
	var scene = attackers[0].instantiate()
	spawn_location.progress_ratio = randf()

	# Set the mob's position to the random location.
	scene.position = spawn_location.position
	
	scene.direction = scene.position.direction_to(target_position.position)

	# Spawn the mob by adding it to the Main scene.
	add_child(scene)
