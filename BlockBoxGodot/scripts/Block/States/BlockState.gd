extends State
class_name BlockState

var block: Node3D
var draggable = false
var ground_distance: float
var falling: bool = false
 
func _ready() -> void:
	block = get_node("../..")
