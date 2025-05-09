extends RayCast3D

var block

func _ready() -> void:
	block = get_node("../Blocks").get_child(0)

func _physics_process(delta: float) -> void:
	self.position = Global.intersection + Vector3(0.5,1,0.5)
	if is_colliding():
		if get_collider() != null:
			print(get_collider().name)
