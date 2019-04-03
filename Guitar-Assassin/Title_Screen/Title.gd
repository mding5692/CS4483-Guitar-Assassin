extends Control

var scene_path_to_load
var player = AudioStreamPlayer.new()

func _ready():
	$Menu/CentreRow/Buttons/MenuButton.grab_focus()
	var start_game_button = $Menu/CentreRow/Buttons.get_node("MenuButton")
	start_game_button.connect("pressed", self, "_on_Button_pressed", [start_game_button.scene_to_load])
	
	
	self.add_child(player)
	player.stream = load("res://Assets/game music/backgroundmusic/Intro.wav")
	player.volume_db = -5
	player.play()
 
func _on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in()
	player.stop() 

func _on_QuitButton_pressed():
	get_tree().quit()


func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)
