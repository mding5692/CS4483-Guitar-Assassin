extends KinematicBody2D

onready var dialog_box = get_parent().get_node("player").get_node("Camera2D2").get_node("Dialog_Box/Main_Text")

func _on_Visibility_body_entered(body):
	if body.get_name() == "player":
		dialog_box.start_dialog()

func _on_Visibility_body_exited(body):
	dialog_box.hide()
