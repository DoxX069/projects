extends State
class_name BlockState

var block: Node3D
var is_dragging = false
var nodes_in_area: Array = []
var draggable = false
var closest_block: bool
#var closest_node: Node3D
var intersection: Vector3

func _ready() -> void:
	block = get_node("../..")
