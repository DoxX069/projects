extends Camera3D

@export var speed : Vector3 = Vector3(0, 50 ,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	camRotate()

func camRotate() -> void:
	if Input.is_action_pressed("rotate+"):
			rotation_degrees += speed * get_process_delta_time()
	elif Input.is_action_pressed("rotate-"):
			rotation_degrees -= speed * get_process_delta_time()
