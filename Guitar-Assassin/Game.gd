extends Node

onready var string1 = preload("res://Classes/GuitarStrings/string1.tscn")
onready var string2 = preload("res://Classes/GuitarStrings/string2.tscn")
onready var string3 = preload("res://Classes/GuitarStrings/string3.tscn")
onready var string4 = preload("res://Classes/GuitarStrings/string4.tscn")

var audio_player

func _ready():
	set_process(true)
	OS.set_window_size(Vector2(712, 512))
	spawn_strings()
	
	audio_player = AudioStreamPlayer.new()
	self.add_child(audio_player)
	audio_player.stream = load("res://Assets/game music/effects/ExploringMap.wav")
	audio_player.volume_db = -25
	audio_player.play()
	
	$pause/pause/ColorRect.visible = false

func _process(delta):
	if Input.is_action_pressed("pause"):
		get_tree().paused = true
		$pause/pause/ColorRect.visible = true

func spawn_strings():
	var s1 = string1.instance()
	add_child(s1)
	var s2 = string2.instance()
	add_child(s2)
	var s3 = string3.instance()
	add_child(s3)
	var s4 = string4.instance()
	add_child(s4)
	s1.set_position(Vector2(880,400))
	s2.set_position(Vector2(560,400))
	s3.set_position(Vector2(-240,272))
	s4.set_position(Vector2(160,-112))
	
func play_fight_music():
	if audio_player:
			audio_player.stream = load("res://Assets/game music/backgroundmusic/fighting_scene.wav")
			audio_player.play()
			
func play_exploration_music():
	if audio_player:
		audio_player.stream = load("res://Assets/game music/effects/ExploringMap.wav")
		audio_player.play()
		
func play_boss_music():
	if audio_player:
		audio_player.stream = load("res://Assets/game music/backgroundmusic/Boss Fighting.wav")
		audio_player.play()
