extends Camera2D

@onready var pause_menu = $Menu
var paused = false

@onready var player = $".."

func _process(delta: float) -> void:
	var target_zoom = Vector2(2.5, 2.5)
	
	if Input.get_action_strength("ui_shift"):
		if player.velocity != Vector2(0, 0):
			target_zoom = Vector2(2.2, 2.2)
	else:
		if player.velocity != Vector2(0, 0):
			target_zoom = Vector2(2.4, 2.4)
		
	zoom = lerp(zoom, target_zoom, 0.1)
	
	if Input.is_action_just_pressed("Pause"):
		pauseMenu()
		
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
		
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	paused = !paused
