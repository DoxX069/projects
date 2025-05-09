extends Node3D

var is_inside_dropable = false
var initialPos: Vector3 = Vector3(0.5,1.5,0.5)
var offset: Vector3
var closest_node = null
var closest_node_distance = INF
var closest_block = null
var closest_block_distance = INF

func _ready() -> void:
	closest_block = get_node("Block")
	Global.current_tween = get_tree().create_tween()
func _process(_delta):
	update_closest_block()
	update_closest_node()
	if Global.draggable:
		if Input.is_action_just_pressed("drag"):
			Global.is_dragging = true
			# Prevent object from snapping to mouse
			offset = intersection() - closest_block.global_transform.origin
		elif Input.is_action_pressed("drag"):
			if closest_node:	
				closest_node.get_node("MeshInstance3D").change_color()	
			# Change position while dragging
			closest_block.global_transform.origin = intersection() - offset
		elif Input.is_action_just_released("drag"):
			Global.is_dragging = false
			if Global.current_tween:
				Global.current_tween.kill()
			Global.current_tween = get_tree().create_tween()
			if closest_node != null:
				Global.current_tween.tween_property(closest_block,"global_position",closest_node.global_transform.origin+Vector3(0,1.5,0),0.5).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_EXPO)
				await Global.current_tween.finished
				Global.current_tween.kill()
#				print(closest_node.position+Vector3(0,1.5,0))
			# End the drag and return the object to its original position (if not inside a drop area)
			else:
				Global.current_tween.tween_property(closest_block,"global_position",initialPos,0.5).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_EXPO)
				await Global.current_tween.finished
				Global.current_tween.kill()

func update_closest_node() -> void:
	closest_node = null
	closest_node_distance = INF
	for node in closest_block.nodes_in_area:
		
		var distance = node.global_transform.origin.distance_to(closest_block.position)
		# Check if this node is closer than the previous closest
		if distance < closest_node_distance:
			closest_node_distance = distance
			closest_node = node
			#node.get_node("MeshInstance3D").change_color()
		node.get_child(1).reset_color() # Reset material
func update_closest_block() -> void:
	closest_block = null
	closest_block_distance = INF
	for child in get_children():
		var distance = child.global_transform.origin.distance_to(intersection() + Vector3(0.5,1,0.5))
		# Check if this node is closer than the previous closest
		if distance < closest_block_distance:
			closest_block_distance = distance
			closest_block = child

func intersection() -> Vector3:
	# Get camera and mouse position for raycasting
	var camera = get_viewport().get_camera_3d()
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_origin = camera.project_ray_origin(mouse_pos)
	var ray_direction = camera.project_ray_normal(mouse_pos)	
	# Create a plane where dragging will happen (based on Y-axis)
	var plane = Plane(Vector3(0,1,0), global_transform.origin.y)
	var var_intersection = plane.intersects_ray(ray_origin, ray_direction)
	return var_intersection
