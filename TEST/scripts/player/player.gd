extends Camera

onready var player = get_tree().get_root().get_node("Camera") 

# Настройки камеры
var follow_offset = Vector3(0, 5, -10) 
var follow_speed = 5.0  
var look_at_player = true 

func _process(delta):
	if player:
		# Целевая позиция камеры с учётом смещения
		var target_position = player.global_transform.origin + follow_offset

		# Плавное перемещение камеры к целевой позиции
		global_transform.origin = global_transform.origin.linear_interpolate(target_position, follow_speed * delta)

		# Поворачиваем камеру, чтобы смотреть на игрока, если включено
		if look_at_player:
			look_at(player.global_transform.origin, Vector3.UP)
