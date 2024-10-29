extends Control

@onready var main = $"../"

func _on_continue_pressed() -> void:
	main.pauseMenu()
	
func _on_exit_to_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/UI/menu.tscn")
