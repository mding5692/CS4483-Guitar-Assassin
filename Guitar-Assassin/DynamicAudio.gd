extends Node

func _ready():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Assets/game music/backgroundmusic/ExploringMap.wav")
	player.play()