extends "res://player/states/PlayerState.gd"

export var GRAVITY = 400

func physics_process(delta):
	shared.velocity.y += GRAVITY * delta
	.physics_process(delta)
