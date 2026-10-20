extends Node2D

	
@onready var select_audio: AudioStreamPlayer2D = $select_audio


func _on_start_pressed() -> void:
	select_audio.play()
	await select_audio.finished
	Global.vidas = 3
	get_tree().change_scene_to_file("res://cena/grama.tscn")


func _on_quit_pressed() -> void:
	select_audio.play()
	await select_audio.finished
	get_tree().quit()
