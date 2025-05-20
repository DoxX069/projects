extends BlockState
class_name BlockDrop

var initialPos: Vector3 = Vector3(0,1,0)
var current_tween: Tween

func enter() ->void:
	if current_tween:
		current_tween.kill()
	current_tween = get_tree().create_tween().set_trans(Tween.TRANS_EXPO)
		
	if Global.intersection != null and Global.intersection.collider.get_node("StateMachine/Dropable").dropable:
		current_tween.tween_property(block,"global_position",Global.intersection.collider.position+Vector3(0,1,0),0.5)
		await current_tween.finished
		current_tween.kill()
		# Change state
		finished.emit(self, "idle")

	# Return to original position (if not inside a drop area)
	else:
		current_tween.tween_property(block,"global_position",Global.last_collider_position+Vector3(0,1,0),0.5)
		await current_tween.finished
		current_tween.kill()
		# Change state
		finished.emit(self, "idle")
