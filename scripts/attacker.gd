extends Area2D

@onready var collider: CollisionShape2D = $CollisionShape2D

@export_file("*.tscn") var attacker_shape : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var shape_scene = load(attacker_shape)
	shape_scene.ini
	var shape = RectangleShape2D.new()
	shape.size = 
