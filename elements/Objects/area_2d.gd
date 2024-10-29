extends Area2D

@export var target_floor_ladder: String
@export var target_position_for_player: Vector2

func _on_body_entered (body):
	if body.is_in_group("Player"):
		print("player entered just rn lol")
		get_tree().change_scene_to_file (target_floor_ladder)
		body.global_position = target_position_for_player #где заспавниться персонаж жоска
		print("you are on the next floor maybe ", "Current floor is:", target_floor_ladder,"spawn at:", target_position_for_player)
