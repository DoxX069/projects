extends BlockState
class_name BlockDrop

var initialPos: Vector3 = Vector3(0.5,1.5,0.5)
var current_tween: Tween

func enter() ->void:
	
	if current_tween:
		current_tween.kill()
	current_tween = get_tree().create_tween().set_trans(Tween.TRANS_EXPO)
		
	if Global.closest_node != null:
		current_tween.tween_property(block,"global_position",Global.closest_node.global_transform.origin+Vector3(0,1.5,0),0.5)
		await current_tween.finished
		current_tween.kill()
		# Change state
		finished.emit(self, "idle")

	# Return to original position (if not inside a drop area)
	else:
		current_tween.tween_property(block,"global_position",initialPos,0.5)
		await current_tween.finished
		current_tween.kill()
		# Change state
		finished.emit(self, "idle")
