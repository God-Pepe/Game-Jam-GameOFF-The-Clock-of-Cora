extends KinematicBody

var speed = 5.0  # Скорость передвижения
var gravity = 9.8  # Сила гравитации
var velocity = Vector3()  # Вектор скорости

func _process(delta):
	# Горизонтальное движение
	var input_direction = Vector3()
	if Input.is_action_pressed("right"):
		input_direction.x += 1
	if Input.is_action_pressed("left"):
		input_direction.x -= 1
	if Input.is_action_pressed("down"):
		input_direction.z += 1
	if Input.is_action_pressed("up"):
		input_direction.z -= 1

	# Нормализация скорости движения по горизонтали
	input_direction = input_direction.normalized() * speed
	velocity.x = input_direction.x
	velocity.z = input_direction.z

	# Применение гравитации
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y = 0  # Обнуление вертикальной скорости при соприкосновении с полом

	# Перемещение
	velocity = move_and_slide(velocity, Vector3.UP)
