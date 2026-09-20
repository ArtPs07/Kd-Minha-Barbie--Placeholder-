extends Area2D

@export var prox_nv = ""

func _on_body_entered(_body: Node2D) -> void:
	call_deferred("carrega_prox_fase")
	

func carrega_prox_fase():
	get_tree().change_scene_to_file("res://Cena/" + prox_nv +  ".tscn")
