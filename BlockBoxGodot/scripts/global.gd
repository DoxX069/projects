extends Node

var intersection: Dictionary
var dragged_block: Node3D
var last_collider_position: Vector3
var under_block: Node3D
var under_block_position: Vector3
var block_above
var falling: bool = false
