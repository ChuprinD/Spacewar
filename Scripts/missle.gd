extends Area2D

@export var speed: float = 100
@onready var screen_size = get_viewport().size
# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta
	if position.x > screen_size.x or position.y > screen_size.y or position.x < 0 or position.y < 0:
		queue_free()	
		
func _on_body_entered(body):
	if is_in_group("enemy"):
		body.hit()
		queue_free()
