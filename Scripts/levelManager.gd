extends Node2D

@onready var missile_scn = preload("res://Objects/missile.tscn")

func _enter_tree():
	$SpaceCrafts/PlayerCraft1.connect("missile_fired", _on_player1_missile_fired)
	$SpaceCrafts/PlayerCraft1.connect("death", _on_player1_dead)
	$SpaceCrafts/PlayerCraft2.connect("missile_fired", _on_player2_missile_fired)
	$SpaceCrafts/PlayerCraft2.connect("death", _on_player2_dead)
	
func _on_player1_missile_fired(obj):
	var m = missile_scn.instantiate()
	$Missiles.add_child(m)
	m.scale = Vector2.ONE * 0.3
	m.transform = obj.transform
	m.rotation_degrees  = obj.rotation_degrees - 90
	
func _on_player2_missile_fired(obj):
	var n = missile_scn.instantiate()
	$Missiles.add_child(n)
	n.scale = Vector2.ONE * 0.3
	n.transform = obj.transform
	n.rotation_degrees = obj.rotation_degrees - 90
	
func _on_player1_dead(obj, _transform):
	$Explosions.add_child(obj)
	obj.transform = _transform
	$Timer.start()
	
func _on_player2_dead(obj, _transform):
	$Explosions.add_child(obj)
	obj.transform = _transform
	$Timer.start()
		
func _on_timer_timeout():
	get_tree().reload_current_scene()
	
func _unhandled_input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
