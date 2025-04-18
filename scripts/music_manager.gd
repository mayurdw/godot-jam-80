extends Node

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var rhythm_notifier: RhythmNotifier = $RhythmNotifier

@export var tracks: Array[Track]

var index = 0
signal on_beat

func _ready() -> void:
	_queue_track()

func _queue_track() -> void:
	rhythm_notifier.bpm = tracks[index].bpm
	audio_stream_player.stream = tracks[index].trackStream
	audio_stream_player.play()

func _on_audio_stream_player_finished() -> void:
	index += 1
	if index >= tracks.size():
		index = 0
	
	_queue_track()

func _on_rhythm_notifier_beat(current_beat: int) -> void:
	on_beat.emit()
