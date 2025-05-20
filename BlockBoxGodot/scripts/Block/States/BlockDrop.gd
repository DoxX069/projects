extends BlockState
class_name BlockDrop

func enter() ->void:
	raycast_down()
	raycast_up()
	var current_tween := get_tree().create_tween().set_trans(Tween.TRANS_EXPO)
	if Global.intersection != null and Global.intersection.normal == Vector3(0,1,0):
		current_tween.tween_property(block,"global_position",Global.intersection.collider.position + Global.intersection.normal,0.5)
		await current_tween.finished
		current_tween.kill()
		# Change state
		finished.emit(self, "idle")

	# Return to original position (if not inside a drop area)
	elif Global.intersection.normal != Vector3(0,1,0):
		current_tween.tween_property(block,"global_position",Global.under_block.position + Vector3(0,1,0),0.5)
		await current_tween.finished
		current_tween.kill()
		# Change state
		finished.emit(self, "idle")
