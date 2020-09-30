extends "res://State.gd"

onready var shared = owner.get_node("SharedVariables")

func change_state(new_state):
	shared.current_state.text = String(new_state)
	.change_state(new_state)

func physics_process(delta):
	shared.velocity = shared.player.move_and_slide(shared.velocity, Vector2.UP)


func input(event):
	shared.direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	shared.current_direction.text = String(shared.direction)
