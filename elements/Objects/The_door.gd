extends Area2D

@export var target_audience: String
@export var target_spawn_for_player: Vector2

func _on_body_entered (body):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file (target_audience)
		PlayerState.position = target_spawn_for_player
