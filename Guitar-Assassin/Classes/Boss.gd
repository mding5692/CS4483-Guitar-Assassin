extends "res://Classes/Enemy.gd"

func _ready():
	hp = 50
	type = "Boss"
	speed = 30
	$Katana_left.visible = false
	$Katana_right.visible = false

func use_weapon():
	pass

func weapon_direction():
	pass