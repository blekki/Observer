class_name ActionMove
extends RefCounted


func update_behavior(object: Npc):
	# check should state change to another one
	pass

func do_task(object: Npc):	# part of duck typing
	move(object)
	
func move(object: Npc) -> void:
	# navigation agent way
	var nav_agent = object.get_node("NavigationAgent2D")
	if not nav_agent.is_navigation_finished():
		var next_point = nav_agent.get_next_path_position()
		var direction = (next_point - object.global_position).normalized()
		object.velocity = direction * object.speed * object.delta
	
	# navigation raycast fluence
	
	
	object.move_and_slide()
	pass
