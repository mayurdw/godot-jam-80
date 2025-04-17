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

	# Set the mob's direction perpendicular to the path direction.
	#var direction = spawn_location.rotation + PI / 2
#
	## Add some randomness to the direction.
	#direction += randf_range(-PI / 4, PI / 4)
	
	scene.direction = scene.position.direction_to(target_position.position)

	# Spawn the mob by adding it to the Main scene.
	add_child(scene)
