extends BlockState
class_name BlockAboveDrag

func enter() ->void:
	Global.falling = true
	var current_tween := get_tree().create_tween().set_trans(Tween.TRANS_EXPO)
	current_tween.tween_property(block,"global_position",Global.under_block.position + Vector3(0,1,0),0.5)
	await current_tween.finished
	Global.falling = false
	finished.emit(self, "idle")
