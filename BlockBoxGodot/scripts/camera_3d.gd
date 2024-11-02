extends Node3D

@export var rotationSpeed: float = 2.5
var rotationAngle: float = 0.0
var rotationTween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	camRotation(delta)

func camRotation(delta) -> void:
	if Input.is_action_pressed("rotate-"):
		rotationAngle -= rotationSpeed * delta
		rotateTween(rotationAngle)
	elif Input.is_action_pressed("rotate+"):
		rotationAngle += rotationSpeed * delta
		rotateTween(rotationAngle)

func rotateTween(angle: float) -> void:
	if rotationTween:
		rotationTween.kill()
	rotationTween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	rotationTween.tween_property(self,"rotation:y",angle,1)
