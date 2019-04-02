extends "res://Classes/Character.gd"

var enemy_moves = {'up': Vector2(0,-1), 'right': Vector2(1,0), 'left': Vector2(-1,0), 'down': Vector2(0,1)}
const animation = "walk"

# For raycasting and figuring if player is seen
var sees_player = false
var spot_player_timer = 0
onready var player_target = get_parent().get_node("player")

# For handling how much time it talks to walk
var movetimer_length = 15
var movetimer = 0

func _ready():
	hp = 50
	type = "Enemy"
	speed = 30
	randomize()

func _process(delta):
	if spot_player_timer > 0:
		sees_player = true
		spot_player_timer -= 1
	
	character_movement()
	if sees_player: # pursues player if they see the player
		move_direction = (player_target.global_position - self.global_position).normalized()
		change_to_player_direction()
	else: # else do random movement
		if movetimer > 0:
			movetimer -= 1
		elif movetimer == 0:
			change_enemy_direction()
			movetimer = movetimer_length

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
		sees_player = true

func _on_Visibility_body_exited(body):
	if body.get_name() == "player" && spot_player_timer == 0:
		sees_player = false
		
func spots_player():
	sees_player = true
	spot_player_timer = 15

func hurt_or_death_animation():
	if hp == 0:
		queue_free()
	else:
		print("b")
