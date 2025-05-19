extends RayCast3D

func _physics_process(_delta: float) -> void:
	Global.block_above = get_collider()
	Global.collision_point = get_collision_point()
