extends RigidBody3D
var nodes_in_area: Array = []
	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Node3D:
		nodes_in_area.append(body)  # Add body to the list
			
func _on_area_3d_body_exited(body: Node3D) -> void:
	if body in nodes_in_area:
		nodes_in_area.erase(body) # Remove body from list
		
	if body not in nodes_in_area:
		body.get_node("MeshInstance3D").reset_color()
		
func _on_area_3d_mouse_entered() -> void:
	if not Global.is_dragging:
		Global.draggable = true

func _on_area_3d_mouse_exited() -> void:
	if not Global.is_dragging:
		Global.draggable = false
