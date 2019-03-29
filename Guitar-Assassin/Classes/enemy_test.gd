extends "res://Classes/Character.gd"

const SPEED = 40
const TYPE = "ENEMY"

func _physics_process(delta):
	damage(delta)