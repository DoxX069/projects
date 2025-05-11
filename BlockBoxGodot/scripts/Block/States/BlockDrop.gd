extends BlockState
class_name BlockDrop

var initialPos: Vector3 = Vector3(0.5,1.5,0.5)

func enter() ->void:
	if Global.current_tween:
		Global.current_tween.kill()
	Global.current_tween = get_tree().create_tween().set_trans(Tween.TRANS_EXPO)
		
	print(closest_node)
	if closest_node != null:
		Global.current_tween.tween_property(block,"global_position",closest_node.global_transform.origin+Vector3(0,1.5,0),0.5)
		await Global.current_tween.finished
		Global.current_tween.kill()
		# Change state
		finished.emit(self, "idle")

	# Return to original position (if not inside a drop area)
	else:
		Global.current_tween.tween_property(block,"global_position",initialPos,0.5)
		await Global.current_tween.finished
		Global.current_tween.kill()
		# Change state
		finished.emit(self, "idle")
