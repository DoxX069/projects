extends BlockState
class_name BlockAboveDrag

func enter() ->void:
	falling = true
	var current_tween := get_tree().create_tween().set_trans(Tween.TRANS_EXPO)
	current_tween.tween_property(block,"global_position",Global.block_above.position + Vector3(0,1,0),0.5)

func physics_update(_delta: float) ->void:
	ground_distance = Global.collision_point.distance_to(block.global_transform.origin)
	# Change state
	if ground_distance <= 0.1:
		falling = false
		finished.emit(self, "idle")
