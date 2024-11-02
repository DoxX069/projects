extends Node3D

@export var speed : Vector3 = Vector3(0, 50 ,0)
var cameraFov

#animation Curve (with tweens)
var cameraTween
var cameraZoom: Vector3
var maxZoom: int = 50
var minZoom: int = -50
var zoomIncrement: int = 1
var zoomTarget: Vector3= Vector3(0,0,0)
var currentZoom: float

func _ready() -> void:
	cameraZoom = $Camera3D.global_transform.origin

func _process(delta) -> void:
	camRotate()
	camZoom()

func camZoom() -> void:
	var zoomDirection: Vector3 = (zoomTarget - $Camera3D.global_transform.origin).normalized()
	
	if Input.is_action_pressed("zoom out"):
		currentZoom = currentZoom - zoomIncrement
		var newPosition: Vector3 = zoomTarget - zoomDirection * currentZoom
		zoomTween(newPosition)
	elif Input.is_action_pressed("zoom in"):
		currentZoom = currentZoom + zoomIncrement
		var newPosition: Vector3 = zoomTarget - zoomDirection * currentZoom
		zoomTween(newPosition)

func camRotate() -> void:
	if Input.is_action_pressed("rotate+"):
			rotation_degrees += speed * get_process_delta_time()
	elif Input.is_action_pressed("rotate-"):
			rotation_degrees -= speed * get_process_delta_time()

func zoomTween(zoom: Vector3) -> void:
	if cameraTween:
		cameraTween.kill()

	cameraTween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	cameraTween.tween_property(self,"position",zoom,1)
