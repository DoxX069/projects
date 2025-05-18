extends BlockState
class_name BlockDrop

var initialPos: Vector3 = Vector3(0,1,0)
var current_tween: Tween

func enter() ->void:
	if current_tween:
		current_tween.kill()
	current_tween = get_tree().create_tween().set_trans(Tween.TRANS_EXPO)
		
	if Global.intersection:
		current_tween.tween_property(block,"global_position",Global.intersection.collider.position+Vector3(0,1,0),0.5)
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
