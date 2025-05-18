extends Camera3D

const RAY_LENGTH = 1000

func _physics_process(delta):
	var space_state = get_world_3d().direct_space_state
	var cam = self
	var mousepos = get_viewport().get_mouse_position()

	var origin = cam.project_ray_origin(mousepos)
	var end = origin + cam.project_ray_normal(mousepos) * RAY_LENGTH
	var query = PhysicsRayQueryParameters3D.create(origin, end)
	if Global.dragged_block:
		query.exclude = [Global.dragged_block]
	query.collide_with_areas = false
	Global.intersection = space_state.intersect_ray(query)
	if Global.intersection:
		Global.last_hit_position = Global.intersection.position
		#print(Global.intersection.position)
