extends Node

var is_dragging = false
var draggable = false
var current_tween: Tween
var nodes_in_area: Array = [] # TODO Reset node array -> should only gets the nodes close to the dragged block
var closest_block = null
