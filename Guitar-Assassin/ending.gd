extends Sprite

var audio_player
func _ready():
	audio_player = AudioStreamPlayer.new()
	self.add_child(audio_player)
	audio_player.stream = load("res://Assets/game music/backgroundmusic/Map2.wav")
	audio_player.volume_db = -25
	audio_player.play()
	
	var endingText  =TextEdit