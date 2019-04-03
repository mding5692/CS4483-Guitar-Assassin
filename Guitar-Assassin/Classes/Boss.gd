
extends "res://Classes/Enemy.gd"

func _ready():
	hp = 300
	type = "Boss"
	speed = 60
	$Katana_left.visible = false
	$Katana_right.visible = false

func use_weapon():
	pass

func weapon_direction():
	pass

func change_to_player_direction():
	if move_direction.x < 0:
		direction = 'left'
	elif move_direction.x > 0:
		direction = 'right'
		
	if move_direction.y < 0 && move_direction.y < move_direction.x:
		direction = 'up'
	elif move_direction.y > 0 && move_direction.y > move_direction.x:
		direction = 'down'
		
	enemy_animation()

func spots_player():
	if !sees_player:
		sees_player = true
		player_target.enemies_who_seen_player[self.get_name()] = true
		get_parent().play_boss_music()
		
func hurt_or_death_animation():
	if hp <= 0:
		queue_free()
		get_tree().change_scene("res://Ending.tscn")
	else:
		hurt_timer = 2