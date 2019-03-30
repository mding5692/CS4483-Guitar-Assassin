extends "res://Classes/Character.gd"

const TYPE = "ENEMY"
var enemy_moves = {'up': Vector2(0,-1), 'right': Vector2(1,0), 'left': Vector2(-1,0), 'down': Vector2(0,1)}
const animation = "walk"

# For raycasting and figuring if player is seen
var sees_player = true
onready var player_target = get_parent().get_node("player")

# For handling how much time it talks to walk
var movetimer_length = 15
var movetimer = 0

func _ready():
	speed = 30
	randomize()

func _process(delta):
	character_movement()
	if sees_player: # pursues player if they see the player
		move_direction = (player_target.global_position - self.global_position).normalized()
#		print(move_direction)
		change_to_player_direction()
	else: # else do random movement
		if movetimer > 0:
			movetimer -= 1
		elif movetimer == 0:
			change_enemy_direction()
			movetimer = movetimer_length

func change_to_player_direction():
#	for i in range(0, enemy_moves.values().size()):
#		if move_direction == enemy_moves.values()[i]:
#			direction = enemy_moves.keys()[i]
#			break
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
