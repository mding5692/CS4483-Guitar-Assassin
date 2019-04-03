
extends "res://Classes/Enemy.gd"

func _ready():
	hp = 300
	type = "Boss"
	speed = 55
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
#		sees_player = true
#		spot_player_timer = Timer.new()
#		spot_player_timer.connect("timeout",self,"_on_timer_timeout")
#		get_parent().add_child(spot_player_timer)
#		spot_player_timer.set_wait_time(5.0)
#		spot_player_timer.start() 
		get_parent().play_boss_music()
		
#func _on_timer_timeout():
#	spot_player_timer.stop()
#	get_parent().remove_child(spot_player_timer)
#	sees_player = false
#	get_parent().play_exploration_music()
func hurt_or_death_animation():
	if hp <= 0:
		queue_free()
		get_tree().change_scene("res://Ending.tscn")
	else:
		hurt_timer = 2