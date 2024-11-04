extends Spatial

var ray_origin = Vector3()
var ray_target = Vector3()

func _physics_process(delta):
	
	var mouse_position = get_viewport().get_mouse_position()
	
	ray_origin = $CameraBody/Camera.project_ray_origin(mouse_position)
	
	ray_target = ray_origin + $CameraBody/Camera.project_ray_normal(mouse_position) * 2000
	
	var space_state = get_world().direct_space_state
	  
	var inter = space_state.intersect_ray(ray_origin, ray_target)
	
	if inter:
		var pos = inter.position
		var lok = Vector3(pos.x, $CameraBody/MeshInstance.global_transform.origin.y, pos.z)

		var look_dir = (lok - $CameraBody/MeshInstance.global_transform.origin).normalized()
		var angle_y = atan2(look_dir.x, look_dir.z)
		$CameraBody/MeshInstance.rotation.y = angle_y
