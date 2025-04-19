extends Resource
class_name AttackerInfo

enum AttackerShape {
	TRIANGLE,
	SQUARE,
	ELLIPSE,
	STAR
}

enum AttackerColor {
	YELLOW = 0xffbe0b,
	ORANGE = 0xfb5607,
	PINK = 0xff006e,
	PURPLE = 0x8338ec,
	BLUE = 0x3a86ff
}

@export var shape: AttackerShape = AttackerShape.values().pick_random()
@export var color: AttackerColor = AttackerColor.values().pick_random()
@export_range(250.0, 400.0, 1.0) var speed: int = randi_range(250.0, 400.0)
@export_range(0.5, 0.8, 0.1) var scale: float = randf_range(0.5, 0.8)
