extends RigidBody3D
class_name Block

#var nodes_in_area: Array = []
#var is_dragging: bool = false
#var draggable: bool = false
#var is_inside_dropable = false
#var initialPos: Vector3 = Vector3(0.5,1.5,0.5)
#var offset: Vector3
var camera_rig: Node3D

func _ready() -> void:
	camera_rig = get_node("../../CameraRig")
	Global.current_tween = get_tree().create_tween()
	
func _process(_delta):
#	if self == Global.closest_block:
		if camera_rig.zoom_finished == true and camera_rig.rotation_finished == true:
			pass
#			if draggable:
#				if Input.is_action_just_pressed("drag"):
#					is_dragging = true
#					# Prevent object from snapping to mouse
#					offset = Global.intersection - global_transform.origin
#				elif Input.is_action_pressed("drag"):
#					if Global.closest_node != null:	
#						Global.closest_node.get_node("MeshInstance3D").change_color()	
#					# Change position while dragging
#					global_transform.origin = Global.intersection - offset
#				if Input.is_action_just_released("drag"):
#					self.is_dragging = false
#					if Global.current_tween:
#						Global.current_tween.kill()
#					Global.current_tween = get_tree().create_tween()
#					if Global.closest_node != null:
#						Global.current_tween.tween_property(self,"global_position",Global.closest_node.global_transform.origin+Vector3(0,1.5,0),0.5).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_EXPO)
#						await Global.current_tween.finished
#						Global.current_tween.kill()
#						print(closest_node.position+Vector3(0,1.5,0))
#					# End the drag and return the object to its original position (if not inside a drop area)
#					else:
#						Global.current_tween.tween_property(self,"global_position",initialPos,0.5).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_EXPO)
#						await Global.current_tween.finished
#						Global.current_tween.kill()	

#func _on_area_3d_body_entered(body: Node3D) -> void:
#	if body is Node3D:
#		nodes_in_area.append(body)  # Add body to the list
#			
#func _on_area_3d_body_exited(body: Node3D) -> void:
#	if body in nodes_in_area:
#		nodes_in_area.erase(body) # Remove body from list
#		
#	body.get_node("MeshInstance3D").reset_color()
		
#func _on_area_3d_mouse_entered() -> void:
#	if not is_dragging:
#		draggable = true
#
#func _on_area_3d_mouse_exited() -> void:
#	if not is_dragging:
#		draggable = false
		
