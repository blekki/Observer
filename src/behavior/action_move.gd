class_name ActionMove
extends RefCounted

func get_task(object: Npc) -> Callable:
	return move.bind(object)

# task action
func move(object: Npc):
	var nav_agent = object.get_node("NavigationAgent2D")
	
	if not nav_agent.is_navigation_finished():
		var next_point = nav_agent.get_next_path_position()
		var direction = (next_point - object.global_position).normalized()
		object.global_position += direction * object.velocity * object.delta
	pass
