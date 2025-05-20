extends BlockState
class_name BlockDrag

var offset: Vector3
var distance_to_intersection: float

func enter() -> void:
	pass

func physics_update(delta: float) ->void:
	#change_material(Global.intersection.collider)
	# Change position while dragging
	block.global_transform.origin = lerp(block.global_transform.origin, Global.intersection.position + Global.intersection.normal * 0.5 , 15 * delta)
	distance_to_intersection = block.global_transform.origin.distance_to(Global.intersection.position + Vector3(0,0.5,0))
	if distance_to_intersection == 0:
		block.global_transform.origin = Global.intersection.position + Vector3(0,0.5,0)
	# Change state
	if Input.is_action_just_released("drag"):
		finished.emit(self, "drop")
