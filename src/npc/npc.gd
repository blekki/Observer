# Description: a smart object with its behaviour
class_name Npc
extends Entity

# Parameters
@export var helth: int = 0
@export var damage: int = 0
@export var npc_type: Enums.NpcTypes = Enums.NpcTypes.NONE

var delta: float = 0.0
static var state_machine = StateMachine.new()
var currect_task: Callable

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
	pass
	
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	self.delta = delta
	update_task()
	do_task()

func update_task() -> void:
	currect_task = state_machine.update_task(self)

func do_task() -> void:
	currect_task.call()

func set_navigation_target(new_pos: Vector2) -> void:
	$NavigationAgent2D.target_position = new_pos
