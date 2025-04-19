extends Node

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var rhythm_notifier: RhythmNotifier = $RhythmNotifier

@export var tracks: Array[Track]

signal on_beat

func _ready() -> void:
	_queue_track()

func _queue_track() -> void:
	var track = tracks.pick_random()
	rhythm_notifier.bpm = track.bpm
	audio_stream_player.stream = track.trackStream
	audio_stream_player.play()

func _on_audio_stream_player_finished() -> void:
	_queue_track()

func _on_rhythm_notifier_beat(current_beat: int) -> void:
	on_beat.emit()
