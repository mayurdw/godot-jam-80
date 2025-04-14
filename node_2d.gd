extends Node2D

#@onready var player: AudioStreamPlayer2D = $Player
@onready var color_rect: ColorRect = $Control/ColorRect
@onready var r: RhythmNotifier = $RhythmNotifier

@export_color_no_alpha var colors : Array[Color] = []

var index = 0
#var bpm = 120
#var beat = 0
#var multiplier: int
#
#func _ready():
	#multiplier = bpm / 60
	#player.play()
#
#
#func _process(delta):
	#if (beat < player.get_playback_position() * multiplier):
		#beat += 1
		#index += 1
		#if index >= colors.size():
			#index = 0
		#color_rect.color = colors[index]

func _ready() -> void:
# Change the song tempo partway through
	r.bpm = 60
	r.beats(4).connect(func(count):
		if r.bpm == 60 and count == 4:
			print("Four seconds into the song, we speed up.")
			r.bpm = 120
		elif r.bpm == 120:
			print("We are %.2f seconds into the song." % r.current_position))
	r.audio_stream_player.play()

func _on_rhythm_notifier_beat(current_beat: int) -> void:
	index += 1
	if index >= colors.size():
		index = 0
	color_rect.color = colors[index]
