extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_quit_pressed():
	get_tree().quit()

func _on_new_build_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_load_build_pressed():
	get_tree().change_scene_to_file("res://scenes/savedBuilds.tscn")
