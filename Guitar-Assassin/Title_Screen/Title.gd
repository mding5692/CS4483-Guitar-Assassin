extends Control

var scene_path_to_load

func _ready():
	$Menu/CentreRow/Buttons/MenuButton.grab_focus()
	var start_game_button = $Menu/CentreRow/Buttons.get_node("MenuButton")
	start_game_button.connect("pressed", self, "_on_Button_pressed", [start_game_button.scene_to_load])
 
func _on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in() 

func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)

func _on_QuitButton_pressed():
	get_tree().quit()
