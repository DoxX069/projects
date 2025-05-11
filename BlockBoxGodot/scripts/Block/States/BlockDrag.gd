extends BlockState
class_name BlockDragging

var offset: Vector3
var closest_node_distance = INF

func enter() -> void:
	get_intersection()
	# Prevent object from snapping to mouse
	offset = intersection - block.global_transform.origin + Vector3(0,0.01,0)
	
func update(_delta:float) ->void:
	pass
	
func physics_update(_delta: float) ->void:
	get_intersection()
	get_closest_node()
	if closest_node != null:	
		print(closest_node.global_position)
		closest_node.get_node("MeshInstance3D").change_material()
		# Change position while dragging
	block.global_transform.origin = intersection - offset
	
	# Change state
	if Input.is_action_just_released("drag"):
		finished.emit(self, "drop")

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Node3D:
		nodes_in_area.append(body)  # Add body to the list
			
func _on_area_3d_body_exited(body: Node3D) -> void:
	if body in nodes_in_area:
		nodes_in_area.erase(body) # Remove body from list
	body.get_node("MeshInstance3D").reset_material()
	
func get_closest_node() -> void:
	#closest_node = null
	closest_node_distance = INF
	for node in nodes_in_area:
		node.get_node("MeshInstance3D").reset_material() # Reset material
		var distance = node.global_transform.origin.distance_to(block.position)
		# Check if this node is closer than the previous closest
		if distance < closest_node_distance:
			closest_node_distance = distance
			closest_node = node


func _on_area_3d_mouse_entered() -> void:
	pass # Replace with function body.


func _on_area_3d_mouse_exited() -> void:
	pass # Replace with function body.
