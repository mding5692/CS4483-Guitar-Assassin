extends KinematicBody2D

onready var dialog_box = get_parent().get_node("player").get_node("Camera2D2").get_node("Dialog_Box/Main Text")
var dialog_started = false

func _on_Visibility_body_entered(body):
	if body.get_name() == "player" && dialog_started == false:
		dialog_box.start_dialog()
		dialog_started = true
		
