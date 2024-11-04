extends Camera

# Получаем игрока по пути в иерархии
onready var player = get_tree().get_root().get_node("Node/KinematicBody")  # Замените путь на путь к вашему игроку

# Настройки камеры
var follow_offset = Vector3(0, 5, -10)  # Смещение камеры относительно игрока
var follow_speed = 2.0  # Скорость следования за игроком
var look_at_player = true  # Камера будет смотреть на игрока

func _process(delta):
	if player:
		# Целевая позиция камеры с учётом смещения
		var target_position = player.global_transform.origin + follow_offset

		# Плавное перемещение камеры к целевой позиции
		global_transform.origin = global_transform.origin.linear_interpolate(target_position, follow_speed * delta)

		# Поворачиваем камеру, чтобы смотреть на игрока, если включено
		if look_at_player:
			look_at(player.global_transform.origin, Vector3.UP)

