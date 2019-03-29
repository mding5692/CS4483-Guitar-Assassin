extends "res://Classes/Character.gd"

const SPEED = 40
var enemy_moves = [Vector2(1,0), Vector2(-1,0), Vector2(0, -1), Vector2(0,1)]

func _ready():
	randomize()

func _process(delta):
	enemy_movement()
	character_movement()
	sprite_direction()

func enemy_movement():
	move_direction = enemy_moves[randi() % 4]
