# Description: choicer logic of behaviours
class_name StateMachine
extends RefCounted

var action_move: ActionMove = ActionMove.new()

#func update_task(npc_type: Enums.NpcTypes, fear_level: int) -> int:
func update_task(object: Npc) -> Callable:
	var task: Callable = action_move.get_task(object)
	return task
