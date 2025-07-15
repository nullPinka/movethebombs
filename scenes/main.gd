extends Node2D

var time_in_s = 0

func reparent_units():
	for unit in $level.get_child(0).get_node("units").get_children():
		var pos = unit.global_position
		unit.reparent($units)
		unit.global_position = pos
		
func _ready():
	reparent_units()

func _process(delta):
	time_in_s += delta
	$timer/RichTextLabel.clear()
	$timer/RichTextLabel.add_text(str(time_in_s).pad_decimals(2))
