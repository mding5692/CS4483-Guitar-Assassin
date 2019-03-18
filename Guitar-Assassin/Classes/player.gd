extends "res://Classes/Character.gd"

const SPEED = 50
var health = 100

var str1_ability = false
var str2_ability = false
var str3_ability = false
var str4_ability = false

func _process(delta):
	key_controls()
	character_movement()
	sprite_direction()

func key_controls():
	var LEFT	= Input.is_action_pressed("ui_left")
	var RIGHT	= Input.is_action_pressed("ui_right")
	var UP		= Input.is_action_pressed("ui_up")
	var DOWN	= Input.is_action_pressed("ui_down")
	
	move_direction.x = -int(LEFT) + int(RIGHT)
	move_direction.y = -int(UP) + int(DOWN)
	
	if move_direction == Vector2(0,0):
		change_animation("idle")
	else:
		change_animation("walk")

func change_animation(animation):
	var newanim = str(animation, direction)
	if $anim.current_animation != newanim:
		$anim.play(newanim)

#func player_abilities(ability_level):

#func play_attack():

func collect_string():
	