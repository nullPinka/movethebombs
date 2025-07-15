extends Node

var selection_rect = Rect2()
var sel_uni = []
var oldpos = null

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				selection_rect = Rect2()
				selection_rect.position = event.position
			else:
				$selrect.visible = false
				var units = get_parent().get_node("units").get_children()
				sel_uni = []
				for unit in units:
					if selection_rect.abs().has_point(unit.global_position):
						sel_uni.append(unit)
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed:
				for u in sel_uni:
					u.set_target_pos(get_viewport().get_mouse_position())
	
	if event is InputEventMouseMotion:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			var pos = get_viewport().get_mouse_position()
			selection_rect.size = pos - selection_rect.position

func show_rect():
	$selrect.visible = true
	$selrect.position = selection_rect.position
	var srect_dir = sign(selection_rect.size)
	if srect_dir.x < 0:
		$selrect.position.x += selection_rect.size.x
	if srect_dir.y < 0:
		$selrect.position.y += selection_rect.size.y
	$selrect.size = abs(selection_rect.size)

func _physics_process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		show_rect()
