extends CharacterBody2D

var speed : float = 100
var moving = false

func _ready():
	$NavigationAgent2D.navigation_finished.connect(func(): moving = false)

func set_target_pos(pos : Vector2):
	$NavigationAgent2D.target_position = pos
	moving = true

func _physics_process(delta: float) -> void:
	if moving:
		velocity = global_position.direction_to($NavigationAgent2D.get_next_path_position()) * speed
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
