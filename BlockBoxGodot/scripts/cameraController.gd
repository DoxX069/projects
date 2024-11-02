extends Node3D

@export var rotationSpeed: float = 2.5
var rotationAngle: float = 0.0
var rotationTween
var lastMousePosition = Vector2()

#animation Curve (with tweens)
var cameraTween
var cameraZoom: float
var maxZoom: int = 200
var minZoom: int = 25
@export var zoomIncrement: float = 2500
var zoomTarget: Vector3= Vector3(0,0,0)
var newPosition: Vector3

func _ready() -> void:
	cameraZoom = $Camera3D.global_transform.origin.distance_to(zoomTarget)

func _process(delta):
	cam_zoom(delta)
	cam_rotation(delta)
	

func cam_rotation(delta) -> void:
	if Input.is_action_pressed("rotate-"):
		rotationAngle -= rotationSpeed * delta
		cam_tween(Vector3(0,0,0),rotationAngle)
	if Input.is_action_pressed("rotate+"):
		rotationAngle += rotationSpeed * delta
		cam_tween(Vector3(0,0,0),rotationAngle)

func cam_zoom(delta) -> void:
	var zoomDirection: Vector3 = (zoomTarget - $Camera3D.global_transform.origin).normalized()
	
	if Input.is_action_just_pressed("zoom in"):
		cameraZoom = clamp(cameraZoom - zoomIncrement * delta, minZoom, maxZoom)
		newPosition = zoomTarget - zoomDirection * cameraZoom
		
		cam_tween(newPosition,0)
	if Input.is_action_just_pressed("zoom out"):
		cameraZoom = clamp(cameraZoom + zoomIncrement * delta, minZoom, maxZoom) 
		newPosition = zoomTarget - zoomDirection * cameraZoom
		
		cam_tween(newPosition,0)

func cam_tween(zoom: Vector3 = Vector3(0,0,0), angle: float = 0) -> void:
	if cameraTween:
		cameraTween.kill()
	cameraTween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	if zoom != Vector3(0,0,0):
		cameraTween.tween_property($Camera3D,"global_position",zoom,1)
	if angle != 0:
		cameraTween.tween_property(self,"rotation:y",angle,1)

func get_mouse_displacement() -> Vector2:
	var currentMousePosition = get_viewport().get_mouse_position()
	var discplacement = currentMousePosition - lastMousePosition
	lastMousePosition = currentMousePosition
	return discplacement
