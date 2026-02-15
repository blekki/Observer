# Description: a smart object with its behaviour
class_name Npc
extends CharacterBody2D

# Parameters
@export var helth: int = 0
@export var damage: int = 0
@export var npc_type: Enums.NpcTypes = Enums.NpcTypes.NONE
@export var speed: float = 10_000
var delta: float = 0.0		# useful variable copies frame delta time

var current_state = ActionMove.new()

# <><><> Other conde <><><>
func _init(npc_type: Enums.NpcTypes = Enums.NpcTypes.NONE) -> void:
	self.npc_type = npc_type
	
	# set base properties
	const type = Enums.NpcTypes
	const prop = Enums.NpcProp
	match npc_type:
		type.DEFENDER:
			self.helth = prop.DEFENDER_HELTH
			self.damage = prop.DEFENDER_DAMAGE
		type.ARACHNO:
			self.helth = prop.ARACHNO_HELTH
			self.damage = prop.ARACHNO_DAMAGE
	
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	self.delta = delta
	update_task()
	do_task()

func update_task() -> void:
	current_state.update_behavior(self)

func do_task() -> void:
	current_state.do_task(self)

func set_navigation_target(new_pos: Vector2) -> void:
	$NavigationAgent2D.target_position = new_pos
