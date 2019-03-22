extends Area2D

const DAMAGE = 5
const string_type = "string1"

func _ready():
	pass

func _on_guitar_string_body_entered(body):
	if body.get_name() == "player":
		body.set_attack_ability(string_type)
		queue_free()