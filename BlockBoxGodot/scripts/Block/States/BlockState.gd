extends State
class_name BlockState

var block: Node3D
var draggable := false
var ground_distance: float
var dropable := true
const ray_length = 1000
var block_above: Node3D
var last_position: Vector3
var under_block_position: Vector3
var under_block: Node3D
 
func _ready() -> void:
	block = get_node("../..")

func raycast_down():
	var space_state = block.get_world_3d().direct_space_state
	
	var origin = block.position
	var end = origin + Vector3(0,-1,0) * ray_length
	var query = PhysicsRayQueryParameters3D.create(origin, end)
	var result = space_state.intersect_ray(query)
	if result:
		Global.under_block_position = result.position
		Global.under_block = result.collider
	
func raycast_up():
	var space_state = block.get_world_3d().direct_space_state

	var origin = block.position
	var end = origin + Vector3(0,1,0) * ray_length
	var query = PhysicsRayQueryParameters3D.create(origin, end)
	var result = space_state.intersect_ray(query)
	if result:
		block_above = result.collider
		#print(block_above)
	
func change_material(node: Node3D) ->void:
	var material = StandardMaterial3D.new()
	material.albedo_color = Color(0,100,100)
	if node.get_node("MeshInstance3D"):
		node.get_node("MeshInstance3D").material_override = material

func reset_material(node: Node3D):
	if node.get_node("MeshInstance3D"):
		node.get_node("MeshInstance3D").material_override = null
