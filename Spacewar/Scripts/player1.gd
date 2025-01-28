extends SpaceCraft

@onready var missile = load("res://Objects/missile.tscn")
@onready var body_sprite = $Body
@onready var target_sprite = $Target

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	print(body_sprite.global_position - target_sprite.gloval_position)
	if Input.is_action_just_pressed("Thurst_P1"):
		print(body_sprite.global_position - target_sprite.gloval_position)
		calculate_thurst_direction(body_sprite, target_sprite)
