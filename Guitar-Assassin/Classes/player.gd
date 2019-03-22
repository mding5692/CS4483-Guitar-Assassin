extends "res://Classes/Character.gd"

const TYPE = "player"
const SPEED = 50
var health = 100
var hit = 0

onready var bullet = preload("res://Classes/bullet.tscn")

var str1_ability = false
var str2_ability = false
var str3_ability = false
var str4_ability = false

func _process(delta):
	key_controls()
	character_movement()
	sprite_direction()
	if Input.is_action_just_pressed("shoot1"):
		shoot()

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

func sprite_direction():
	.sprite_direction()
	match direction:
		"up":
			$weapon_muzzle.set_position(Vector2(0,-40))
			$weapon_muzzle.rotation = 3*PI/2
		"down":
			$weapon_muzzle.set_position(Vector2(0,40))
			$weapon_muzzle.rotation = PI/2
		"left":
			$weapon_muzzle.set_position(Vector2(-30,0))
			$weapon_muzzle.rotation = PI
		"right":
			$weapon_muzzle.set_position(Vector2(30,0))
			$weapon_muzzle.rotation = 0

func shoot():
	var b = bullet.instance()
	b.bullet_start_position($weapon_muzzle.global_position, $weapon_muzzle.rotation)
	get_parent().add_child(b)

#func collect_string():

#func player_abilities(ability_level):
