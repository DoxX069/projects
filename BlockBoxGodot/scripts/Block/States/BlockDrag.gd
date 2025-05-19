extends BlockState
class_name BlockDragging

var offset: Vector3

func enter() -> void:
	#get_intersection()
	# Prevent object from snapping to mouse
	
	offset = Global.intersection.position - block.global_transform.origin
	
func update(_delta:float) ->void:
	pass
	
func physics_update(_delta: float) ->void:
	if Global.intersection:
		print(Global.intersection.collider.position)
		#Global.intersection.collider.get_node("MeshInstance3D").change_material()
		# Change position while dragging
		block.global_transform.origin = Global.intersection.position - offset
	# Change state
	if Input.is_action_just_released("drag"):
		finished.emit(self, "drop")
