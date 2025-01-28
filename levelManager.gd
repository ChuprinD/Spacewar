extends Node2D

@onready var missile_scn = preload("res://Objects/missile.tscn")
# Called when the node enters the scene tree for the first time.
func _enter_tree():
	$SpaceCrafts/Player1Craft.connect("missile_fired", _on_player1_missile_fired)
	

func _on_player1_missile_fired(obj,_group_to_kill):
	var m = missile_scn.instantiate()
	$Missiles.add_child(m)
	m.scale = Vector2.ONE * 0.3
	m.transform = obj.transform
	m.group_to_kill = _group_to_kill
