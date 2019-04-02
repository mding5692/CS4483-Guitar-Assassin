extends Node2D


func _on_anim_animation_finished(anim_name):
	if anim_name == "swingup":
		$Sprite.visible = false
