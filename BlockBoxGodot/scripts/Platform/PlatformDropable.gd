extends PlatformState
class_name PlatformDropable

func physics_update(_delta: float) -> void:
	raycast_down()
	raycast_up()
	if Global.block_above:
		finished.emit(self, "idle")
