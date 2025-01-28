extends CharacterBody2D

class_name SpaceCraft

@export var thrust_power: int = 200
@export var rotation_speed: float = 3
@export var missiles: int = 500
@export var max_velocity: Vector2 = Vector2(1000,1000)
@export var max_thrust_velocity: Vector2 = Vector2(400,400)

var current_direction := Vector2.ZERO
var current_rotation := 0.0
var is_gravity_active := false
var gravity_center := Vector2.ZERO
var gravity_power := 0.0

signal missile_fired

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	check_for_screen_presence()
	
	if is_gravity_active and abs(velocity) < max_velocity:
		calculate_final_velocity(delta)
	
	move_and_slide()
	
func calculate_thurst_direction(from, target):
	current_direction = target.global_position - from.global_position
	current_direction = current_direction.normalized()
	if abs(velocity) < max_thrust_velocity:
		velocity += current_direction * thrust_power/100
	
func check_for_screen_presence():
	var screen_size = get_viewport_rect().size
	position.x = fposmod(position.x, screen_size.x)
	position.y = fposmod(position.y, screen_size.y)
	
func fire():
	if missiles > 0:
		missiles -= 1
		emit_signal("missile_fired", self)
		
func activate_gravity(_is_gravity_active, _gravity_center, _gravity_power):
	is_gravity_active = _is_gravity_active
	gravity_center = _gravity_center
	gravity_power = _gravity_power
	
func calculate_final_velocity(delta):
	var dir = gravity_center - position
	velocity += dir.normalized() * gravity_power * delta
	
func destroy():
	#var e = explosion_scn.instantiate()
	#emit_signal("death", e, transform)
	queue_free()
