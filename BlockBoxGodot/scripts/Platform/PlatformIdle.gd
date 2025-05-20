extends PlatformState
class_name PlatformIdle

func physics_update(_delta: float) -> void:
	raycast_down()
	raycast_up()
	if not Global.block_above:
		finished.emit(self, "dropable")
