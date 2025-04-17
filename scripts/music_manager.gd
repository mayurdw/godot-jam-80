extends Node

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var rhythm_notifier: RhythmNotifier = $RhythmNotifier

@export var stream = preload("res://assets/sounds/DiscoLounge.ogg")

signal on_beat

func _ready() -> void:
	rhythm_notifier.bpm = 60
	audio_stream_player.stream = stream
	audio_stream_player.play()

func _on_audio_stream_player_finished() -> void:
	pass # Replace with function body.


func _on_rhythm_notifier_beat(current_beat: int) -> void:
	on_beat.emit()
