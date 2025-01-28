extends CharacterBody2D

class_name SpaceCraft

@export var thurst_power: int = 200
@export var rotation_speed: float = 3
@export var missiles: int = 500

var current_direction := Vector2.ZERO
var current_rotation := 0.0

signal missile_fired

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	check_for_screen_presence()
	move_and_slide()
	
func calculate_thurst_direction(from, target):
	current_direction = target.global_position - from.global_position
	current_direction = current_direction.normalized()
	velocity += current_direction * thurst_power / 100
	
func check_for_screen_presence():
	var screen_size = get_viewport_rect().size
	position.x = fposmod(position.x, screen_size.x)
	position.y = fposmod(position.y, screen_size.y)
	
func fire():
	if missiles > 0:
		missiles -= 1
		emit_signal("missile_fired", self)
