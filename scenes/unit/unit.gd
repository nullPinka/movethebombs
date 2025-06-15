extends CharacterBody2D

var speed : float = 100

func set_target_pos(pos : Vector2):
	$NavigationAgent2D.target_position = pos

func _physics_process(delta: float) -> void:
	velocity = global_position.direction_to($NavigationAgent2D.get_next_path_position()) * speed
	move_and_slide()
