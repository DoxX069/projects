extends BlockState
class_name BlockIdle

func enter() -> void:
	# TODO Freeze movement when entering Idle state
	#is_closest_block(block)
	pass
	
func update(_delta: float) -> void:
	if Input.is_action_just_pressed("drag") and draggable:# and is_closest_block(block):
		finished.emit(self, "drag")
		
func physics_update(_delta: float) ->void:
	get_intersection()
	
func _on_area_3d_mouse_entered() -> void:
	draggable = true

func _on_area_3d_mouse_exited() -> void:
	draggable = false
	
func is_closest_block(current_block: Node3D) -> bool:
	Global.closest_block_distance
	var distance = current_block.global_transform.origin.distance_to(intersection) 
	# Check if this node is closer than the previous closest
	if distance < Global.closest_block_distance:
		Global.closest_block_distance = distance
		return true
	return false
	
