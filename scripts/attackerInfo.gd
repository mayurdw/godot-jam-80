extends Resource
class_name AttackerInfo

enum AttackerShape {
	TRIANGLE,
	SQUARE,
	ELLIPSE,
	STAR
}

var AttackerColor = [
	Color.GOLDENROD,
	Color.HOT_PINK,
	Color.WEB_PURPLE,
	Color.BLUE_VIOLET
]

@export var shape: AttackerShape = AttackerShape.values().pick_random()
@export var color: Color = AttackerColor.pick_random()
@export_range(250.0, 400.0, 1.0) var speed: int = randi_range(250.0, 400.0)
@export_range(0.5, 0.8, 0.1) var scale: float = randf_range(0.5, 0.8)
