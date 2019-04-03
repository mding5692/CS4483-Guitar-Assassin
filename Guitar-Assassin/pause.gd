extends Control

func _on_Continue_Button_pressed():
	get_tree().paused = false
	$ColorRect.visible = false


func _on_Quit_Button_pressed():
	get_tree().change_scene("res://Title_Screen/Title.tscn")
	get_tree().paused = false
