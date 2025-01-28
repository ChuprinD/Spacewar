extends Area2D

@export var speed: float = 500
@export var hit_range: float = 30

@onready var screen_size = get_viewport().size
@onready var starting_position: Vector2 = position 

func _physics_process(delta: float) -> void:
		position += transform.x * speed * delta	
		
func _on_body_entered(body):
	if is_in_group("enemy"):
		body.hit()
		queue_free()
		
func _on_timer_timeout():
	queue_free()
