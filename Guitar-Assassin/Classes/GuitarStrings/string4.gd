extends Area2D

const DAMAGE = 20
const string_type = "string4"

func _ready():
	pass

func _on_string4_body_entered(body):
	if body.get_name() == "player":
		body.set_attack_ability(string_type)
		queue_free()
