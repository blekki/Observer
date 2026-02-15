# Description: a moveble base of an object
extends Node2D
class_name Entity

# class parameters
#var velocity = Vector2.ZERO
var velocity: float = 150
const VELOCITY_MODIFICATOR = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
#func update_pos():
	#position += velocity
	
#func update_velocity(direction: Vector2):
	#velocity += direction.normalized() * VELOCITY_MODIFICATOR

#func set_velocity(new_velocity: Vector2):
	#velocity = new_velocity
