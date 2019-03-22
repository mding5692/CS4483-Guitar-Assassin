extends Area2D

func _ready():
	pass

func _on_guitar_string_body_entered(body):
	if body.get_name() == "player":
		queue_free()