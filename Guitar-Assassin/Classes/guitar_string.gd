extends Area2D

func _ready():
	pass

func _on_guitar_string_body_entered(body):
	print(body.get_name())
	if body.get_name() == "player":
		queue_free()