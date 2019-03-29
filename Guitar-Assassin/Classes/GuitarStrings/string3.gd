extends Area2D

const DAMAGE = 15
const string_type = "string3"

func _ready():
	pass

func _on_string3_body_entered(body):
	if body.get_name() == "player":
		body.set_attack_ability(string_type)
		queue_free()
