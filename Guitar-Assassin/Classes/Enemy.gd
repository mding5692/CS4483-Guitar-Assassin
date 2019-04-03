extends "res://Classes/Character.gd"

var enemy_moves = {'up': Vector2(0,-1), 'right': Vector2(1,0), 'left': Vector2(-1,0), 'down': Vector2(0,1)}
const animation = "walk"

# For raycasting and figuring if player is seen
var sees_player = false
var spot_player_timer 
onready var player_target = get_parent().get_node("player")

# For handling how much time it talks to walk
var movetimer_length = 15
var movetimer = 0

var hurt_timer = 0

func _ready():
	$Katana_right.visible = false
	$Katana_left.visible = false
	hp = 50
	type = "Enemy"
	speed = 50
	randomize()

func _process(delta):
	if hurt_timer > 0:
		$Sprite.self_modulate = Color(1, 0, 0)
		hurt_timer -= 1
	else:
		$Sprite.self_modulate = Color(1, 1, 1)
	
	character_movement()
	if sees_player: # pursues player if they see the player
		move_direction = (player_target.global_position - self.global_position).normalized()
		change_to_player_direction()
		weapon_direction()
	else: # else do random movement
		if movetimer > 0:
			movetimer -= 1
		elif movetimer == 0:
			change_enemy_direction()
			weapon_direction()
			movetimer = movetimer_length

func change_to_player_direction():
	if move_direction.x < 0:
		direction = 'right'
	elif move_direction.x > 0:
		direction = 'left'
		
	if move_direction.y < 0 && move_direction.y < move_direction.x:
		direction = 'down'
	elif move_direction.y > 0 && move_direction.y > move_direction.x:
		direction = 'up'
		
	enemy_animation()
	
func weapon_direction():
	if direction == "left" || direction == "down":
		$Katana_right.visible = true
		$Katana_left.visible = false
	else: 
		$Katana_right.visible = false
		$Katana_left.visible = true

func change_enemy_direction():
	var randNum = randi() % 4
	direction = enemy_moves.keys()[randNum]
	move_direction = enemy_moves.values()[randNum]
	enemy_animation()
	
func enemy_animation():
	var newanim = str(animation, direction)
	if $anim.current_animation != newanim:
		$anim.play(newanim)

func _on_Visibility_body_entered(body):
	if body.get_name() == "player":
		spots_player()

func _on_Visibility_body_exited(body):
	pass
		
func spots_player():
	if !sees_player:
		sees_player = true
		player_target.enemies_who_seen_player[self.get_name()] = true
		get_parent().play_fight_music()

func hurt_or_death_animation():
	if hp <= 0:
		sees_player = false
		player_target.enemies_who_seen_player.erase(self.get_name())
		if player_target.enemies_who_seen_player.size() == 0:
			get_parent().play_exploration_music()
		queue_free()
	else:
		hurt_timer = 2

func _on_timer_timeout():
	pass

func use_weapon():
	pass	