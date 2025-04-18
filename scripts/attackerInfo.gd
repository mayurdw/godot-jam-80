extends Resource
class_name AttackerInfo

enum AttackerShape {
	TRIANGLE,
	SQUARE,
	ELLIPSE,
	STAR,
	POLYGON
}

enum AttackerColor {
	YELLOW = 0xffbe0b,
	ORANGE = 0xfb5607,
	PINK = 0xff006e,
	PURPLE = 0x8338ec,
	BLUE = 0x3a86ff
}

@export var shape: AttackerShape
@export var color: AttackerColor
@export_range(250.0, 400.0, 1.0) var speed: int = 300.0
@export_range(0.5, 0.8, 0.1) var scale: float = 0.5
