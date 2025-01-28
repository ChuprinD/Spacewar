extends CharacterBody2D

class_name SpaceCraft

@export var thurst_power: int = 100

var current_direction := Vector2.ZERO
var current_rotation := 0.0

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	move_and_slide()
	
func calculate_thurst_direction(from, target):
	current_direction = target.global_position - from.gloval_position
	current_direction = current_direction.normalized()
	velocity += current_direction * thurst_power / 100
	print(current_direction * thurst_power / 100)
