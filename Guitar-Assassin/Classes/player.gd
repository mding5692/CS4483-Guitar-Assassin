extends "res://Classes/Character.gd"

const TYPE = "player"
const SPEED = 50

onready var bullet = preload("res://Classes/bullet.tscn")

var health = 100
var string1_ability = false
var string2_ability = false
var string3_ability = false
var string4_ability = false

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

#function to change direction of weapon muzzle when character chages direction
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

#enable player attacks
func set_attack_ability(g_string):
	print(g_string)
	match g_string:
		"string1":
			string1_ability = true
		"string2":
			string2_ability = true
		"string3":
			string3_ability = true
		"string4":
			string4_ability = true

#TODO: shoot the correct attack based on string abilities
func shoot():
	if string1_ability == true:
		var b = bullet.instance()
		b.bullet_start_position($weapon_muzzle.global_position, $weapon_muzzle.rotation)
		get_parent().add_child(b)