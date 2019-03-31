extends ColorRect

signal fade_finished

func fade_in():
	$Fade.play("fade_in")

func _on_FadeIn_animation_finished(anim_name):
	emit_signal("fade_finished")
