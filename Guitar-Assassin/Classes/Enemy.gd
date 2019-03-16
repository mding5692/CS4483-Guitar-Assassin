extends "res://Classes/Character.gd"

func _ready():
	randomize()
	direction = moves.keys()[randi() % 4]

func _process(delta):
	if can_move:
		if not move(direction) or randi() % 10 > 5:
			direction = moves.keys()[randi() % 4]
			
