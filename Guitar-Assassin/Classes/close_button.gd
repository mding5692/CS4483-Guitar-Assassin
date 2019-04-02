extends Button

func _on_close_button_pressed():
	get_tree().paused = false
	get_parent().hide()


