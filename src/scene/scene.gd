# scne with level
class_name Scene
extends Node

const npc_preload = preload("res://src/npc/npc.tscn")
const DEFENDERS_COUNT = 1
var defenders: Array[Npc] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	createDefenders()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("come_to"):
		var new_pos = get_viewport().get_mouse_position()
		defenders[0].set_navigation_target(new_pos)
	pass

func createDefenders():
	for i in range(DEFENDERS_COUNT):
		defenders.push_back(npc_preload.instantiate())
		defenders[i].position = Vector2(200, 100)
		add_child(defenders[i])
	pass
