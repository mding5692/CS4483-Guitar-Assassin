extends "res://Classes/Character.gd"

# Gonkee's follow AI for Godot 3 - full tutorial https://youtu.be/WXC8eBCEbho <== used this for AI for inspiration

const TYPE = "ENEMY"
var enemy_moves = {'up': Vector2(0,-1), 'right': Vector2(1,0), 'left': Vector2(-1,0), 'down': Vector2(0,1)}
const animation = "walk"

# For handling how much time it talks to walk
var movetimer_length = 15
var movetimer = 0

func _ready():
	speed = 30
	randomize()

func _process(delta):
	character_movement()
	if movetimer > 0:
		movetimer -= 1
	elif movetimer == 0:
		change_enemy_direction()
		movetimer = movetimer_length
	

func change_enemy_direction():
	var randNum = randi() % 4
	direction = enemy_moves.keys()[randNum]
	move_direction = enemy_moves.values()[randNum]
	enemy_animation()
	
func enemy_animation():
	var newanim = str(animation, direction)
	if $anim.current_animation != newanim:
		$anim.play(newanim)
