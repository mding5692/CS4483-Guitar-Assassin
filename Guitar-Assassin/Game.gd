extends Node

onready var string1 = preload("res://Classes/GuitarStrings/string1.tscn")
onready var string2 = preload("res://Classes/GuitarStrings/string2.tscn")
onready var string3 = preload("res://Classes/GuitarStrings/string3.tscn")
onready var string4 = preload("res://Classes/GuitarStrings/string4.tscn")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_process(true)
	OS.set_window_size(Vector2(512, 512))

	spawn_strings()

func spawn_strings():
	var s1 = string1.instance()
	add_child(s1)
	var s2 = string2.instance()
	add_child(s2)
	var s3 = string3.instance()
	add_child(s3)
	var s4 = string4.instance()
	add_child(s4)
	s1.set_position(Vector2(100,100))
	s2.set_position(Vector2(200,200))
	s3.set_position(Vector2(300,300))
	s4.set_position(Vector2(400,400))