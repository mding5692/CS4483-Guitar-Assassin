extends Area2D

const DAMAGE = 10
const string_type = "string2"

func _ready():
	pass

func _on_string2_body_entered(body):
	if body.get_name() == "player":
		body.set_attack_ability(string_type)
		queue_free()
