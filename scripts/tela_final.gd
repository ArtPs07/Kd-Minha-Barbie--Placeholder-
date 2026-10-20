extends Button

@onready var select_audio: AudioStreamPlayer2D = $"../../select_audio"
@onready var winning_audio: AudioStreamPlayer2D = $"../../winning_audio"



func _on_pressed() -> void:
	select_audio.play()
	await select_audio.finished
	get_tree().quit()
