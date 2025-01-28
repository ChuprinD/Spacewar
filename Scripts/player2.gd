extends SpaceCraft

@onready var missile = load("res://Objects/missile.tscn")
@onready var body_sprite = $Body
@onready var target_sprite = $Target
@onready var thrust_animation = $Thrust


func _ready():
	super._ready()

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if Input.is_action_pressed("Thrust_P2"):
		thrust_animation.play("thrust")
		
		calculate_thurst_direction(body_sprite, target_sprite)
	if Input.is_action_pressed("Left_P2"):
		rotation += -rotation_speed * delta * 0.1
	if Input.is_action_pressed("Right_P2"):
		rotation += rotation_speed * delta * 0.1
	if Input.is_action_just_pressed("Fire_P2"):
		fire()
		
func _unhandled_input(event):
	if Input.is_action_just_released("Thrust_P2"):
		thrust_animation.play("idle")
