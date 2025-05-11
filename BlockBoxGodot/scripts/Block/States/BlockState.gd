extends State
class_name BlockState

var block: Node3D
var is_dragging = false
var nodes_in_area: Array = []
var draggable = false
var closest_block: bool
var closest_node: Node3D
var intersection: Vector3

func _ready() -> void:
	block = get_node("../..")	

func get_intersection() -> void:
	# Get camera and mouse position for raycasting
	var camera = get_viewport().get_camera_3d()
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_origin
	var ray_direction
	if camera and mouse_pos:
		ray_origin = camera.project_ray_origin(mouse_pos)
		ray_direction = camera.project_ray_normal(mouse_pos)
	# Create a plane where dragging will happen (based on Y-axis)
	var plane = Plane(Vector3(0,1,0), 1) #global_transform.origin.y) #TODO Test if it works
	var var_intersection
	if ray_origin and ray_direction:
		var_intersection = plane.intersects_ray(ray_origin, ray_direction)
	if var_intersection:
		intersection = var_intersection
