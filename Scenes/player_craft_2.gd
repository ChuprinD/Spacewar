extends SpaceCraft

@onready var missile = load("res://Objects/missile.tscn")
@onready var body_sprite = $Body
@onready var target_sprite = $Target
@onready var thrust_animation = $Thrust

func _ready():
	super._ready()

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if Input.is_action_pressed("ui_up"):
		thrust_animation.play("thrust")
		calculate_thurst_direction(body_sprite, target_sprite)
	if Input.is_action_pressed("ui_left"):
		rotation += -rotation_speed * delta
	if Input.is_action_pressed("ui_right"):
		rotation += rotation_speed * delta
	#if Input.is_action_just_pressed("Fire_P1"):
		#fire()
		
func _unhandled_input(event):
	if Input.is_action_just_released("Thrust_P1"):
		thrust_animation.play("idle")
