extends "res://Classes/Character.gd"

const DAMAGE = 1

onready var blue_bullet = preload("res://Classes/Bullets/blue_bullet.tscn")
onready var red_bullet = preload("res://Classes/Bullets/red_bullet.tscn")
onready var yellow_bullet = preload("res://Classes/Bullets/yellow_bullet.tscn")
onready var green_bullet = preload("res://Classes/Bullets/green_bullet.tscn")
onready var enemy = preload("res://Classes/Enemy.tscn")

var bounce_dir = Vector2(0,0)
var string1_ability = false
var string2_ability = false
var string3_ability = false
var string4_ability = false

var player_is_hurt = false
var hurt_timer = 0

var timer = null
var bullet_delay = 0.5
var can_shoot = true

func _ready():
	type = "Player"
	hp = 10
	
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(bullet_delay)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)

func _process(delta):
	if hurt_timer > 0:
		$Sprite.self_modulate = Color(1, 0, 0)
		hurt_timer -= 1
	else:
		$Sprite.self_modulate = Color(1, 1, 1)
		player_is_hurt = false
	
	key_controls()
	character_movement()
	sprite_direction()
	if Input.is_action_just_pressed("shoot1") and can_shoot:
		shoot("1")
	elif Input.is_action_just_pressed("shoot2") and can_shoot:
		shoot("2")
	elif Input.is_action_just_pressed("shoot3") and can_shoot:
		shoot("3")
	elif Input.is_action_just_pressed("shoot4") and can_shoot:
		shoot("4")
	
	
func _physics_process(delta):
	damage(delta)
	player_hurt_or_death()

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
			$Guitar_sprite.visible = false
			$Guitar_sprite_up.visible = true
			$Guitar_sprite_left.visible = false
			
			$weapon_muzzle.set_position(Vector2(0,-40))
			$weapon_muzzle.rotation = 3*PI/2
		"down":
			$Guitar_sprite.visible = true
			$Guitar_sprite_up.visible = false
			$Guitar_sprite_left.visible = false
			
			$weapon_muzzle.set_position(Vector2(0,40))
			$weapon_muzzle.rotation = PI/2
		"left":
			$Guitar_sprite.visible = false
			$Guitar_sprite_up.visible = false
			$Guitar_sprite_left.visible = true
			
			$weapon_muzzle.set_position(Vector2(-30,0))
			$weapon_muzzle.rotation = PI
		"right":
			$Guitar_sprite_up.visible = false
			$Guitar_sprite.visible = true
			$Guitar_sprite_left.visible = false
			
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

#shoot the correct attack based on string abilities
func shoot(str_num):
	var string1 = AudioStreamPlayer.new()
	var string2 = AudioStreamPlayer.new()
	var string3 = AudioStreamPlayer.new()
	var string4 = AudioStreamPlayer.new()
	self.add_child(string1)
	self.add_child(string2)
	self.add_child(string3)
	self.add_child(string4)
	string1.stream = load("res://Assets/game music/effects/string/C_chord.wav")
	string2.stream = load("res://Assets/game music/effects/string/G_chord.wav")
	string3.stream = load("res://Assets/game music/effects/string/E_chord.wav")
	string4.stream = load("res://Assets/game music/effects/string/F_chord.wav")
	
	string1.volume_db = -5
	string2.volume_db = -5
	string3.volume_db = -5
	string4.volume_db = -5
	if string1_ability == true and str_num == "1":
		string1.play()
		var b = blue_bullet.instance()
		set_bullet(b)
	elif string2_ability == true and str_num == "2":
		string2.play()
		var b = red_bullet.instance()
		set_bullet(b)
	elif string3_ability == true and str_num == "3":
		string3.play()
		var b = yellow_bullet.instance()
		set_bullet(b)
	elif string4_ability == true and str_num == "4":
		string4.play()
		var b = green_bullet.instance()
		set_bullet(b)

func on_timeout_complete():
	can_shoot = true

func set_bullet(bullet):
		bullet.bullet_start_position($weapon_muzzle.global_position, $weapon_muzzle.rotation)
		get_parent().add_child(bullet)
		can_shoot = false
		timer.start()


func player_hurt_or_death():
	if hp <= 0:
		get_tree().change_scene("res://Classes/game_over.tscn")
	elif player_is_hurt:
		hurt_timer = 2