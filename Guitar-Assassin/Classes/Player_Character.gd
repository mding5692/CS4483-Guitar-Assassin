extends "res://Classes/Character.gd"

func _process(delta):
	if can_move:
		for dir in moves.keys():
			if Input.is_action_pressed(dir):
				move(dir)
