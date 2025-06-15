extends Node2D

func reparent_units():
	for unit in $level.get_child(0).get_node("units").get_children():
		var pos = unit.global_position
		unit.reparent($units)
		unit.global_position = pos
		
func _ready():
	reparent_units()
