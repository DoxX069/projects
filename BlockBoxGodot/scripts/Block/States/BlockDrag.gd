extends BlockState
class_name BlockDrag

var offset: Vector3

func enter() -> void:
	print(get_tree().get_nodes_in_group("dropable"))
	#Global.under_block.add_to_group("dropable")
	#Global.dragged_block = block
	# Prevent object from snapping to mouse
	offset = Global.intersection.position - block.global_transform.origin

func physics_update(_delta: float) ->void:
	
	if Global.intersection:
		#Global.intersection.collider.get_node("MeshInstance3D").change_material()
		# Change position while dragging
		block.global_transform.origin = Global.intersection.position - offset
	# Change state
	if Input.is_action_just_released("drag"):
		finished.emit(self, "drop")
