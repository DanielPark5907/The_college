extends CharacterBody2D

const speed = 125.0
const superspeed = 175.0
@onready var animation = $AnimatedSprite2D

var last_direction = Vector2(0, 1)  # Направление "вниз" по умолчанию

func _ready() -> void:
	position = PlayerState.position

func _physics_process(delta: float) -> void:
	PlayerState.position = position
	
	if Engine.time_scale == 0:
		return
	
	var direction = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down")).normalized()
	
	var is_running = Input.is_action_pressed("ui_shift")
	if is_running:
		velocity = direction * superspeed
	else:
		velocity = direction * speed
		
	# Если персонаж движется, обновляем последнее направление
	if direction != Vector2.ZERO:
		last_direction = direction
		
		
	# Управляем анимацией
	if velocity.length() == 0:
		# Выбираем idle анимацию в зависимости от последнего направления
		if last_direction.x < 0 and last_direction.y < 0:
			animation.play("idle_leftup")
		elif last_direction.x > 0 and last_direction.y < 0:
			animation.play("idle_rightup")
		elif last_direction.x < 0:
			animation.play("idle_left")
		elif last_direction.x > 0:
			animation.play("idle_right")
		elif last_direction.y < 0:
			animation.play("idle_up")
		elif last_direction.y > 0:
			animation.play("idle")
	else:
		# Определяем, в каком направлении играет анимация
		if direction.x < 0 and direction.y < 0:
			animation.play("run_leftup" if is_running else "walk_leftup")
		elif direction.x > 0 and direction.y < 0:
			animation.play("run_rightup" if is_running else "walk_rightup")
		elif direction.x < 0:
			animation.play("run_left" if is_running else "walk_left")
		elif direction.x > 0:
			animation.play("run_right" if is_running else "walk_right")
		elif direction.y < 0:
			animation.play("run_up" if is_running else "walk_up")
		elif direction.y > 0:
			animation.play("run_down" if is_running else "walk_down")

	move_and_slide()
