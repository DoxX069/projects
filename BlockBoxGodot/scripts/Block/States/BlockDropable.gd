extends BlockState
class_name BlockDropable

func physics_update(_delta: float) -> void:
	raycast_down()
	raycast_up()
	dropable = true
	ground_distance = Global.under_block_position.distance_to(block.global_transform.origin)
	#Global.dragged_block = null
	if Global.block_above:
		finished.emit(self, "idle")
	if ground_distance > 1 and not Global.falling:
		finished.emit(self, "fall")
	if Input.is_action_just_pressed("drag") and draggable:
		finished.emit(self, "drag")
		
func _on_block_mouse_entered() -> void:
	draggable = true
	Global.dragged_block = block # For ignoring dragged block in raycast intersection

func _on_block_mouse_exited() -> void:
	draggable = false
	Global.dragged_block = null # For ignoring dragged block in raycast intersection
