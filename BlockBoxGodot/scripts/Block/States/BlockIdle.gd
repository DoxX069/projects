extends BlockState
class_name BlockIdle
	
func update(_delta: float) -> void:
	if Input.is_action_just_pressed("drag") and draggable:
		finished.emit(self, "drag")
		
func _on_block_mouse_entered() -> void:
	draggable = true
	Global.dragged_block = block

func _on_block_mouse_exited() -> void:
	draggable = false
	Global.dragged_block = null
