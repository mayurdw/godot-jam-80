extends Resource
class_name AttackerInfo

enum Shape {
	TRIANGE,
	SQUARE,
	ELLIPSE,
	STAR,
	POLYGON
}

enum COLOR {
	# ffbe0b
	YELLOW,
	# fb5607
	ORANGE,
	# ff006e
	PINK,
	# 8338ec
	PURPLE,
	# 3a86ff
	BLUE
}

@export var shape: Shape
@export var color: COLOR
@export_range(150.0, 300.0, 1.0) var speed: int
@export_range(0.5, 1.0, 0.1) var scale: int
