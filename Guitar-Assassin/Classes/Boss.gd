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

func spots_player():
	sees_player = true
	spot_player_timer = 15
	get_parent().play_boss_music()