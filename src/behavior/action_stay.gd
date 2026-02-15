class_name ActionStay
extends RefCounted

func update_behavior(object: Npc):
	# check should state change to another one
	pass

func do_task(object: Npc):	# part of duck typing
	stay(object)

func stay(object: Npc) -> void:
	# do everything needed as in stay state
	pass
